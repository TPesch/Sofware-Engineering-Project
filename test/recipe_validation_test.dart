import 'package:flutter_test/flutter_test.dart';
import '../lib/models/recipe_validation.dart';

class TestValidation with RecipeValidationMixin {}

void main() {
  final validation = TestValidation();

  group('RecipeValidationMixin Tests', () {
    test('Validate Price', () {
      expect(validation.validatePrice("10.0"), null); // Valid input
      expect(validation.validatePrice("-5.0"),
          "Price cannot be negative"); // Invalid input
      expect(validation.validatePrice("abc"),
          "Please enter a valid number"); // Invalid input
    });

    test('Validate Required Fields', () {
      expect(validation.validateRequired("", "Name"), "Name is required");
      expect(validation.validateRequired("Cocktail", "Name"), null);
    });

    test('Validate Ingredients', () {
      expect(validation.validateIngredients("2 oz - Vodka\n1 oz - Lime Juice"),
          null); // Valid input
      expect(validation.validateIngredients(""),
          "Ingredients are required"); // Invalid input
    });
  });
}
