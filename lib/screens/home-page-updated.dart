import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cocktail-provider.dart';
import '../models/recipies.dart';
import '../models/recipe_validation.dart';
import '../services/authentications.dart';
import '../screens/home-page-updated.dart';
import '../services/google_sheets_integration.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    // Initialize recipes when the page loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<CocktailProvider>(context, listen: false);
      provider.initializeSpreadsheet(provider.getCurrentUserId());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddRecipeDialog(context),
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              try {
                await AuthService().signOut();
                if (context.mounted) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (Route<dynamic> route) => false,
                  );
                }
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Error signing out: ${e.toString()}'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              }
            },
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
              return RecipeCard(
                recipe: recipe,
                index: index,
                onEdit: () => _showEditRecipeDialog(context, recipe, index),
                onDelete: () => _confirmDelete(context, index),
              );
            },
          );
        },
      ),
    );
  }

  void _showAddRecipeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => RecipeDialog(
        onSave: (recipe) {
          Provider.of<CocktailProvider>(context, listen: false)
              .addRecipe(recipe);
        },
      ),
    );
  }

  void _showEditRecipeDialog(
      BuildContext context, CocktailRecipe recipe, int index) {
    showDialog(
      context: context,
      builder: (context) => RecipeDialog(
        recipe: recipe,
        onSave: (updatedRecipe) {
          Provider.of<CocktailProvider>(context, listen: false)
              .updateRecipe(index, updatedRecipe);
        },
      ),
    );
  }

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Recipe'),
        content: Text('Are you sure you want to delete this recipe?'),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text('Delete'),
            onPressed: () {
              Navigator.pop(context);
              Provider.of<CocktailProvider>(context, listen: false)
                  .deleteRecipe(index);
            },
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final CocktailRecipe recipe;
  final int index;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const RecipeCard({
    Key? key,
    required this.recipe,
    required this.index,
    required this.onEdit,
    required this.onDelete,
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
        subtitle: Text('${recipe.category} • ${recipe.mainAlcohol}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => RecipeDetailsDialog(recipe: recipe),
          );
        },
      ),
    );
  }
}

class RecipeDialog extends StatefulWidget {
  final CocktailRecipe? recipe;
  final Function(CocktailRecipe) onSave;

  const RecipeDialog({
    Key? key,
    this.recipe,
    required this.onSave,
  }) : super(key: key);

  @override
  _RecipeDialogState createState() => _RecipeDialogState();
}

class _RecipeDialogState extends State<RecipeDialog>
    with RecipeValidationMixin {
  late TextEditingController nameController;
  late TextEditingController glassController;
  late TextEditingController alcoholController;
  late TextEditingController ingredientsController;
  late TextEditingController instructionsController;
  late TextEditingController garnishController;
  late TextEditingController priceController;
  late TextEditingController categoryController;

  // Map to store validation errors
  Map<String, String?> validationErrors = {};

  @override
  void initState() {
    super.initState();
    final recipe = widget.recipe;
    nameController = TextEditingController(text: recipe?.name ?? '');
    glassController = TextEditingController(text: recipe?.glass ?? '');
    alcoholController = TextEditingController(text: recipe?.mainAlcohol ?? '');
    ingredientsController =
        TextEditingController(text: recipe?.ingredients ?? '');
    instructionsController =
        TextEditingController(text: recipe?.instructions ?? '');
    garnishController = TextEditingController(text: recipe?.garnish ?? '');
    priceController = TextEditingController(text: recipe?.price ?? '');
    categoryController = TextEditingController(text: recipe?.category ?? '');
  }

  @override
  void dispose() {
    nameController.dispose();
    glassController.dispose();
    alcoholController.dispose();
    ingredientsController.dispose();
    instructionsController.dispose();
    garnishController.dispose();
    priceController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.recipe == null ? 'Add Recipe' : 'Edit Recipe'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Name',
                errorText: validationErrors['name'],
              ),
              onChanged: (_) => setState(() {
                validationErrors['name'] =
                    validateRequired(nameController.text, 'Name');
              }),
            ),
            TextField(
              controller: glassController,
              decoration: InputDecoration(
                labelText: 'Glass Type',
                errorText: validationErrors['glass'],
              ),
              onChanged: (_) => setState(() {
                validationErrors['glass'] =
                    validateRequired(glassController.text, 'Glass type');
              }),
            ),
            TextField(
              controller: alcoholController,
              decoration: InputDecoration(
                labelText: 'Main Alcohol',
                errorText: validationErrors['mainAlcohol'],
              ),
              onChanged: (_) => setState(() {
                validationErrors['mainAlcohol'] =
                    validateRequired(alcoholController.text, 'Main alcohol');
              }),
            ),
            TextField(
              controller: ingredientsController,
              decoration: InputDecoration(
                labelText: 'Ingredients',
                errorText: validationErrors['ingredients'],
                helperText: 'Format: "2 oz - Vodka" (one per line)',
              ),
              maxLines: 3,
              onChanged: (_) => setState(() {
                validationErrors['ingredients'] =
                    validateIngredients(ingredientsController.text);
              }),
            ),
            TextField(
              controller: instructionsController,
              decoration: InputDecoration(
                labelText: 'Instructions',
                errorText: validationErrors['instructions'],
                helperText: 'Enter step-by-step instructions (one per line)',
              ),
              maxLines: 3,
              onChanged: (_) => setState(() {
                validationErrors['instructions'] =
                    validateInstructions(instructionsController.text);
              }),
            ),
            TextField(
              controller: garnishController,
              decoration: InputDecoration(labelText: 'Garnish'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                labelText: 'Price',
                errorText: validationErrors['price'],
              ),
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() {
                validationErrors['price'] = validatePrice(priceController.text);
              }),
            ),
            TextField(
              controller: categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                errorText: validationErrors['category'],
              ),
              onChanged: (_) => setState(() {
                validationErrors['category'] =
                    validateRequired(categoryController.text, 'Category');
              }),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        TextButton(
          child: Text('Save'),
          onPressed: () {
            final formValues = {
              'name': nameController.text,
              'glass': glassController.text,
              'mainAlcohol': alcoholController.text,
              'ingredients': ingredientsController.text,
              'instructions': instructionsController.text,
              'price': priceController.text,
              'category': categoryController.text,
            };

            if (validateForm(formValues)) {
              final recipe = CocktailRecipe(
                name: nameController.text,
                glass: glassController.text,
                mainAlcohol: alcoholController.text,
                imageUrl: '', // Add image handling later
                ingredients: ingredientsController.text,
                instructions: instructionsController.text,
                garnish: garnishController.text,
                price: priceController.text,
                category: categoryController.text,
              );
              widget.onSave(recipe);
              Navigator.pop(context);
            } else {
              // Show validation errors
              setState(() {
                validationErrors = {
                  'name': validateRequired(nameController.text, 'Name'),
                  'glass': validateRequired(glassController.text, 'Glass type'),
                  'mainAlcohol':
                      validateRequired(alcoholController.text, 'Main alcohol'),
                  'ingredients':
                      validateIngredients(ingredientsController.text),
                  'instructions':
                      validateInstructions(instructionsController.text),
                  'price': validatePrice(priceController.text),
                  'category':
                      validateRequired(categoryController.text, 'Category'),
                };
              });
            }
          },
        ),
      ],
    );
  }
}

class RecipeDetailsDialog extends StatelessWidget {
  final CocktailRecipe recipe;

  const RecipeDetailsDialog({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(recipe.name),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (recipe.imageUrl.isNotEmpty)
              Image.network(
                recipe.imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            SizedBox(height: 16),
            _buildDetailRow('Glass', recipe.glass),
            _buildDetailRow('Main Alcohol', recipe.mainAlcohol),
            _buildDetailRow('Category', recipe.category),
            _buildDetailRow('Price', recipe.price),
            _buildDetailSection('Ingredients', recipe.ingredients),
            _buildDetailSection('Instructions', recipe.instructions),
            _buildDetailRow('Garnish', recipe.garnish),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: Text('Close'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  Widget _buildDetailSection(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(value),
        ],
      ),
    );
  }
}
