class CocktailRecipe {
  final String name;
  final String glass;
  final String mainAlcohol;
  final String imageUrl;
  final String ingredients;
  final String instructions;
  final String garnish;
  final String price;
  final String category;

  CocktailRecipe({
    required this.name,
    required this.glass,
    required this.mainAlcohol,
    required this.imageUrl,
    required this.ingredients,
    required this.instructions,
    required this.garnish,
    required this.price,
    required this.category,
  });

  List<dynamic> toList() {
    return [
      name,
      glass,
      mainAlcohol,
      imageUrl,
      ingredients,
      instructions,
      garnish,
      price,
      category,
    ];
  }

  factory CocktailRecipe.fromList(List<dynamic> list) {
    return CocktailRecipe(
      name: list[0] ?? '',
      glass: list[1] ?? '',
      mainAlcohol: list[2] ?? '',
      imageUrl: list[3] ?? '',
      ingredients: list[4] ?? '',
      instructions: list[5] ?? '',
      garnish: list[6] ?? '',
      price: list[7] ?? '',
      category: list[8] ?? '',
    );
  }

  /// Parses a recipe from human-readable text
  factory CocktailRecipe.fromText(String text) {
    final lines = text.split('\n');
    final Map<String, String> fields = {};

    for (var line in lines) {
      final parts = line.split(':');
      if (parts.length == 2) {
        fields[parts[0].trim()] = parts[1].trim();
      }
    }

    return CocktailRecipe(
      name: fields['Cocktail'] ?? '',
      glass: fields['Glass'] ?? '',
      mainAlcohol: fields['Main Alcohol'] ?? '',
      imageUrl: fields['Image URL'] ?? '',
      ingredients: fields['Ingredients'] ?? '',
      instructions: fields['Instructions'] ?? '',
      garnish: fields['Garnish'] ?? '',
      price: fields['Price'] ?? '',
      category: fields['Category'] ?? '',
    );
  }

  @override
  String toString() {
    return '''
Cocktail: $name
Glass: $glass
Main Alcohol: $mainAlcohol
Ingredients: $ingredients
Instructions: $instructions
Garnish: $garnish
Price: $price
Category: $category
''';
  }
}
