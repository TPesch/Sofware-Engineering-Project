import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cocktail-provider.dart';
import '../models/recipies.dart';

class CocktailListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cocktails'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddEditRecipeDialog(context),
          ),
        ],
      ),
      body: Consumer<CocktailProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.recipes.isEmpty) {
            return Center(
              child: Text('No recipes yet. Add your first cocktail!'),
            );
          }

          return ListView.builder(
            itemCount: provider.recipes.length,
            itemBuilder: (context, index) {
              final recipe = provider.recipes[index];
              return RecipeListTile(
                recipe: recipe,
                index: index,
              );
            },
          );
        },
      ),
    );
  }

  void _showAddEditRecipeDialog(BuildContext context, [CocktailRecipe? recipe, int? index]) {
    // TODO: Implement add/edit dialog
    // This will be implemented in the next part
  }
}

class RecipeListTile extends StatelessWidget {
  final CocktailRecipe recipe;
  final int index;

  const RecipeListTile({
    Key? key,
    required this.recipe,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: ListTile(
        leading: recipe.imageUrl.isNotEmpty
            ? Image.network(
                recipe.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Icon(Icons.local_bar),
              )
            : Icon(Icons.local_bar),
        title: Text(recipe.name),
        subtitle: Text(recipe.category),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // TODO: Implement edit functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                Provider.of<CocktailProvider>(context, listen: false)
                    .deleteRecipe(index);
              },
            ),
          ],
        ),
        onTap: () {
          // TODO: Navigate to detail view
        },
      ),
    );
  }
}
