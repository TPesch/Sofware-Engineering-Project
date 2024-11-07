mixin RecipeValidationMixin {
  String? validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  String? validatePrice(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Price is required';
    }

    final price = double.tryParse(value);
    if (price == null) {
      return 'Please enter a valid number';
    }

    if (price < 0) {
      return 'Price cannot be negative';
    }

    return null;
  }

  String? validateIngredients(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingredients are required';
    }

    final ingredients = value.split('\n');
    if (ingredients.isEmpty) {
      return 'Please add at least one ingredient';
    }

    // Check if each ingredient has a quantity
    for (final ingredient in ingredients) {
      if (!ingredient.contains(' - ')) {
        return 'Each ingredient should have a quantity (e.g., "2 oz - Vodka")';
      }
    }

    return null;
  }

  String? validateInstructions(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Instructions are required';
    }

    final steps = value.split('\n');
    if (steps.length < 2) {
      return 'Please provide detailed step-by-step instructions';
    }

    return null;
  }

  bool validateForm(Map<String, String?> formValues) {
    final validations = {
      'name': validateRequired(formValues['name'], 'Name'),
      'glass': validateRequired(formValues['glass'], 'Glass type'),
      'mainAlcohol':
          validateRequired(formValues['mainAlcohol'], 'Main alcohol'),
      'price': validatePrice(formValues['price']),
      'ingredients': validateIngredients(formValues['ingredients']),
      'instructions': validateInstructions(formValues['instructions']),
      'category': validateRequired(formValues['category'], 'Category'),
    };

    return !validations.values.any((error) => error != null);
  }
}
