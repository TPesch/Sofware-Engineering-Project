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
}
