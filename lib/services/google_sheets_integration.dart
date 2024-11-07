import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/recipies.dart';

class GoogleSheetsService {
  static const String _spreadsheetScope =
      'https://www.googleapis.com/auth/spreadsheets';
  static const String _driveScope =
      'https://www.googleapis.com/auth/drive.file';

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      _spreadsheetScope,
      _driveScope,
    ],
  );
  //
  Future<String?> getUserSpreadsheetId(String userId) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return null;

      final headers = await _getAuthHeaders(user);
      if (headers == null) return null;

      // Use Google Drive API to search for spreadsheets with a specific title
      final response = await http.get(
        Uri.parse('https://www.googleapis.com/drive/v3/files?q='
            'mimeType="application/vnd.google-apps.spreadsheet" and '
            'name="Cocktail Recipes - ${user.displayName}" and '
            '"me" in owners'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final files = data['files'] as List<dynamic>;

        if (files.isNotEmpty) {
          // Return the first matching spreadsheet's ID
          return files[0]['id'] as String;
        }
      }
      return null;
    } catch (e) {
      print('Error checking for existing spreadsheet: $e');
      return null;
    }
  }

  // Create a new spreadsheet for a user
  Future<String?> createUserSpreadsheet(String userId) async {
    try {
      // Check if a spreadsheet already exists
      final existingSpreadsheetId = await getUserSpreadsheetId(userId);
      if (existingSpreadsheetId != null) {
        return existingSpreadsheetId; // Return existing spreadsheet ID
      }

      // No existing spreadsheet found, so create a new one
      final user = await _googleSignIn.signIn();
      if (user == null) return null;

      final headers = await _getAuthHeaders(user);
      if (headers == null) return null;

      final response = await http.post(
        Uri.parse('https://sheets.googleapis.com/v4/spreadsheets'),
        headers: headers,
        body: jsonEncode({
          'properties': {
            'title': 'Cocktail Recipes - ${user.displayName}',
          },
          'sheets': [
            {
              'properties': {
                'title': 'Recipes',
                'gridProperties': {'frozenRowCount': 1}
              }
            }
          ]
        }),
      );

      if (response.statusCode == 200) {
        final spreadsheet = jsonDecode(response.body);
        final spreadsheetId = spreadsheet['spreadsheetId'];

        await _initializeSpreadsheet(spreadsheetId, headers);

        return spreadsheetId;
      }
      return null;
    } catch (e) {
      print('Error creating spreadsheet: $e');
      return null;
    }
  }

  Future<void> _initializeSpreadsheet(
      String spreadsheetId, Map<String, String> headers) async {
    final values = [
      [
        'Name',
        'Glass',
        'Main Alcohol',
        'Image URL',
        'Ingredients',
        'Instructions',
        'Garnish',
        'Price',
        'Category'
      ]
    ];

    await http.put(
      Uri.parse(
          'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/A1:I1?valueInputOption=RAW'),
      headers: headers,
      body: jsonEncode({
        'values': values,
      }),
    );
  }

  // Get all recipes
  Future<List<CocktailRecipe>> getAllRecipes(String spreadsheetId) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return [];

      final headers = await _getAuthHeaders(user);
      if (headers == null) return [];

      final response = await http.get(
        Uri.parse(
            'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/A2:I'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final values = data['values'] as List<dynamic>?;

        if (values == null) return [];

        return values.map((row) => CocktailRecipe.fromList(row)).toList();
      }
      return [];
    } catch (e) {
      print('Error getting recipes: $e');
      return [];
    }
  }

  // Add recipe
  Future<bool> addRecipe(String spreadsheetId, CocktailRecipe recipe) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return false;

      final headers = await _getAuthHeaders(user);
      if (headers == null) return false;

      final response = await http.post(
        Uri.parse(
            'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/A:I:append?valueInputOption=RAW'),
        headers: headers,
        body: jsonEncode({
          'values': [recipe.toList()],
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error adding recipe: $e');
      return false;
    }
  }

  // Update recipe
  Future<bool> updateRecipe(
      String spreadsheetId, int rowIndex, CocktailRecipe recipe) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return false;

      final headers = await _getAuthHeaders(user);
      if (headers == null) return false;

      // Row index + 2 because of header row and 0-based index
      final range = 'A${rowIndex + 2}:I${rowIndex + 2}';

      final response = await http.put(
        Uri.parse(
            'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?valueInputOption=RAW'),
        headers: headers,
        body: jsonEncode({
          'values': [recipe.toList()],
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error updating recipe: $e');
      return false;
    }
  }

  // Delete recipe
  Future<bool> deleteRecipe(String spreadsheetId, int rowIndex) async {
    try {
      final user = await _googleSignIn.signIn();
      if (user == null) return false;

      final headers = await _getAuthHeaders(user);
      if (headers == null) return false;

      // Create delete request
      final response = await http.post(
        Uri.parse(
            'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId:batchUpdate'),
        headers: headers,
        body: jsonEncode({
          'requests': [
            {
              'deleteDimension': {
                'range': {
                  'sheetId': 0,
                  'dimension': 'ROWS',
                  'startIndex': rowIndex + 1, // +1 for header row
                  'endIndex': rowIndex + 2
                }
              }
            }
          ]
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error deleting recipe: $e');
      return false;
    }
  }

  // Helper methods
  Future<Map<String, String>?> _getAuthHeaders(GoogleSignInAccount user) async {
    final auth = await user.authentication;
    if (auth.accessToken == null) return null;

    return {
      'Authorization': 'Bearer ${auth.accessToken}',
      'Content-Type': 'application/json',
    };
  }
}
