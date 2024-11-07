import 'package:flutter/foundation.dart';
import '../models/recipies.dart';
import '/services/google_sheets_integration.dart';
import '/services/authentications.dart';

class CocktailProvider with ChangeNotifier {
  final GoogleSheetsService _sheetsService = GoogleSheetsService();
  final AuthService _authService = AuthService();

  List<CocktailRecipe> _recipes = [];
  String? _spreadsheetId;
  bool _isLoading = false;

  List<CocktailRecipe> get recipes => _recipes;
  bool get isLoading => _isLoading;

  String getCurrentUserId() {
    final user = _authService.getCurrentUser();
    return user?.uid ?? '';
  }

  Future<void> initializeSpreadsheet(String userId) async {
    if (userId.isEmpty) {
      print('Error: User ID is empty');
      return;
    }

    _setLoading(true);
    try {
      _spreadsheetId = await _sheetsService.createUserSpreadsheet(userId);
      if (_spreadsheetId != null) {
        print('Successfully created spreadsheet with ID: $_spreadsheetId');
        await loadRecipes();
      } else {
        print('Error: Failed to create spreadsheet');
      }
    } catch (e) {
      print('Error initializing spreadsheet: $e');
    } finally {
      _setLoading(false);
    }
  }
 // Add new recipe
  Future<bool> addRecipe(CocktailRecipe recipe) async {
    if (_spreadsheetId == null) {
      print('Error: Spreadsheet ID is null');
      return false;
    }

    _setLoading(true);
    try {
      final success = await _sheetsService.addRecipe(_spreadsheetId!, recipe);
      if (success) {
        await loadRecipes();
        return true;
      } else {
        print('Error: Failed to add recipe to spreadsheet');
        return false;
      }
    } catch (e) {
      print('Error adding recipe: $e');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  // Load all recipes
  Future<void> loadRecipes() async {
    if (_spreadsheetId == null) return;

    _setLoading(true);
    _recipes = await _sheetsService.getAllRecipes(_spreadsheetId!);
    _setLoading(false);
    notifyListeners();
  }

 
  // Update existing recipe
  Future<bool> updateRecipe(int index, CocktailRecipe recipe) async {
    if (_spreadsheetId == null) return false;

    _setLoading(true);
    final success =
        await _sheetsService.updateRecipe(_spreadsheetId!, index, recipe);
    if (success) {
      await loadRecipes();
    }
    _setLoading(false);
    return success;
  }

  // Delete recipe
  Future<bool> deleteRecipe(int index) async {
    if (_spreadsheetId == null) return false;

    _setLoading(true);
    final success = await _sheetsService.deleteRecipe(_spreadsheetId!, index);
    if (success) {
      await loadRecipes();
    }
    _setLoading(false);
    return success;
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
