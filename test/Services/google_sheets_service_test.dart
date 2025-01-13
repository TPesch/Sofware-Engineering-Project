import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:NewFolderName/models/recipies.dart';
import 'google_sheets_service_test.mocks.dart';
import 'test_cocktail_provider.dart'; // Import the test subclass
import 'package:mockito/annotations.dart';
import 'package:NewFolderName/services/google_sheets_integration.dart';
import 'package:NewFolderName/services/authentications.dart';

@GenerateMocks([GoogleSheetsService, AuthService])
void main() {
  late MockGoogleSheetsService mockGoogleSheetsService;
  late MockAuthService mockAuthService;
  late TestCocktailProvider provider;

  setUp(() {
    // Create mock services
    mockGoogleSheetsService = MockGoogleSheetsService();
    mockAuthService = MockAuthService();

    // Create a TestCocktailProvider with mock services
    provider = TestCocktailProvider(
      testSheetsService: mockGoogleSheetsService,
      testAuthService: mockAuthService,
    );
  });

  test('should load recipes successfully', () async {
    // Mock the getAllRecipes method
    when(mockGoogleSheetsService.getAllRecipes(any)).thenAnswer((_) async => [
          CocktailRecipe(
            name: 'Mojito',
            glass: 'Highball',
            mainAlcohol: 'Rum',
            imageUrl: '',
            ingredients: 'Mint, Lime, Sugar, Rum, Soda',
            instructions:
                'Muddle mint, add lime and sugar, pour rum, top with soda.',
            garnish: 'Mint sprig',
            price: '10.00',
            category: 'Classic',
          )
        ]);

    // Call loadRecipes on the provider
    await provider.loadRecipes();

    // Verify the results
    expect(provider.recipes.length, 1);
    expect(provider.recipes.first.name, 'Mojito');
  });

  test('should handle empty recipes list', () async {
    // Mock an empty response from getAllRecipes
    when(mockGoogleSheetsService.getAllRecipes(any))
        .thenAnswer((_) async => []);

    // Call loadRecipes
    await provider.loadRecipes();

    // Verify that recipes is empty
    expect(provider.recipes.length, 0);
  });
}
