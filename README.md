Software Engineering Project

This is a university project focused on applying various software engineering concepts to a small pet project. The project includes coding, documentation, and the use of several key development tools and techniques.

## Important Dates

1. **22nd Oct**: Name, Project, and GitHub link (**5 Points**)
2. **1st Dec**: First Deliverable with substantial content (**15 Points**)
3. **20th Jan**: Final GitHub submission with all tasks completed

---

## Project Overview

### A) Project Description

A small pet project aimed at getting back into coding. The code can be relatively simple (e.g., a basic game with console output). Documentation should be brief but informative.

- Most of my Adult life I have been working in the service industry. Specifically I've been working behind A Bar, and after all these years i can honestly say the hardest thing for new bartenders (Besides keeping the bar clean) is learning and memorizing the cocktails. With every new Restaurant/Bar or New hire, came a bunch of loose papers with scribbles on it to be shoved here and there in the bar. I want to be able to have all my recipes in one place, to be able to keep my bar clean, and to be able to give all the new hires the recipes without the fear of them loosing the Recipe Book in a accident.

### B) Key Topics Covered

Each team member must apply the following topics taught in the course to the project.

---

## Topics to Cover:

### 1. **Git**

- Demonstrate effective use of Git for version control, including branches, commits, and merges.

### 2. **UML Diagrams**

Include at least **three** different UML diagrams, artificially enhanced if necessary to fit Domain-Driven Design (DDD). The diagrams must be exported as images for submission.

- **Class Diagram**  
  ![Class Diagram](https://i.imgur.com/1fJUkjS.png)

- **Use Case Diagram**  
  ![Use Case Diagram](https://i.imgur.com/mlQ6zBV.png)

- **Activity Diagram**  
  ![Activity Diagram](https://i.imgur.com/DdcNVZy.png)

---

### 3.**Mobile App Requirements**

- The mobile app **MUST** implement the following features:

  1.  **Google OAuth 2.0 for Authentication**:

      - Users **MUST** log in using **Google OAuth 2.0** for secure authentication.
      - The authentication **MUST** follow Google's best practices for OAuth security.

  2.  **Google Sheets API for Cocktail Data Management (Per User)**:

      - Each user **MUST** have their own individual **Google Sheet** to store and manage cocktail details such as the name, ingredients, and instructions.
      - The app **MUST** implement CRUD operations (Create, Read, Update, Delete) synchronized with the user's Google Sheet.
      - The data stored in the Google Sheet **CANNOT** be accessible to other users, ensuring per-account data privacy.

  3.  **Cocktail Details Management**:

      - Authenticated users **MUST** be able to add, edit, delete, and view cocktail details.
      - Data **MUST** be securely stored in the Google Sheet and **SHOULD** be updated in real-time when CRUD operations are performed.

  4.  **Per-Account Data Segregation**:

      - Each user **SHOULD** have access only to their own cocktail data, ensuring privacy and data integrity.
      - Data **MUST** be private, and one user **CANNOT** access another user's data under any circumstance.

  5.  **Mobile App Development Using Flutter**:
      - The app **MUST** be developed using **Flutter** and **MUST** be built to run on Android devices.
      - The use of Flutter widgets and best practices **SHOULD** be implemented for smooth and responsive UI.

---

### 4. **System Analysis**

#### 1. Document Analysis

##### Data Structures

- **Recipe Structure**

  - Title (string)
  - Ingredients (array)
  - Instructions (array)
  - Photo URL (string)
  - Categories (array)
  - Search Tags (array)
  - Last Modified (timestamp)

- **Google Sheets Structure**
  - Sheet 1: Recipe Main Data
    - Column A: Recipe ID
    - Column B: Title
    - Column C: Ingredients (JSON)
    - Column D: Instructions (JSON)
    - Column E: Photo URL
    - Column F: Categories
    - Column G: Search Tags
    - Column H: Last Modified

#### 2. Process Analysis

##### Core Processes

1. **Recipe Management**

   - Create new recipes
   - Upload and associate photos
   - Update existing recipes
   - Delete recipes
   - Sync with Google Sheets

2. **Search Functionality**

   - Full-text search
   - Category filtering
   - Tag-based search
   - Sort by various criteria

3. **Data Synchronization**
   - Auto-sync with Google Sheets
   - Handle offline/online states
   - Conflict resolution
   - Data validation

#### 3. User Analysis

##### User Types and Needs

1. **Regular Users**

   - Search for recipes
   - View recipe details
   - Filter by categories
   - Save favorites

2. **Contributors**

   - Add new recipes
   - Upload photos
   - Assign categories
   - Add search tags

3. **Administrators**
   - Edit any recipe
   - Manage categories
   - Control user access
   - Maintain data integrity

#### 4. Domain Analysis

##### Core Domains

1. **Recipe Domain**

   - Recipe CRUD operations
   - Recipe metadata management
   - Recipe validation
   - Events:
     - RecipeCreated
     - RecipeUpdated
     - RecipeDeleted
     - RecipeViewed

2. **Storage Domain**

   - Google Sheets API integration
   - Data synchronization
   - Data backup
   - Events:
     - DataSynced
     - SheetUpdated
     - BackupCreated

3. **Search Domain**

   - Search indexing
   - Query processing
   - Results ranking
   - Events:
     - SearchPerformed
     - ResultsFiltered
     - ResultsSorted

4. **Media Domain**
   - Photo upload
   - Image processing
   - Storage management
   - Events:
     - PhotoUploaded
     - PhotoProcessed
     - PhotoDeleted

### Technical Requirements

1. **Frontend**

   - Responsive web interface
   - Search functionality
   - Recipe form with photo upload
   - Recipe display with photos

2. **Backend**

   - Google Sheets API integration
   - Data validation
   - Error handling
   - Security measures

3. **Data Storage**
   - Google Sheets as primary database
   - Local caching for performance
   - Photo storage solution

### Implementation Plan

1. **Phase 1: Core Setup**

   - Basic project structure
   - Google Sheets API connection
   - Simple CRUD operations

2. **Phase 2: Features**

   - Search implementation
   - Photo upload
   - Recipe management

3. **Phase 3: Refinement**
   - UI/UX improvements
   - Performance optimization
   - Testing and bug fixes

---

### 5. **Domain-Driven Design (DDD)**

- Invent additional domains if necessary, and document them with strategic design mappings.
- Show relationships between more than four domains and represent them in a Core Domain Chart.
- **DDD Diagram\***
  ![DDD Diagram](https://imgur.com/XdZt3eQ.png)
- **DDD Event Diagram\***
  ![DDD Event Diagram](https://imgur.com/mYavfpV.png)
- **DDD Core Domain Chart\***

  ![DDD Core Domain Chart](https://imgur.com/U8NPeLF.png)

- **DDD Core Domain Chart version 2\***

  ![DDD Core Domain Chart version 2](https://imgur.com/AIjW4wZ.png)

- **Miro Link**
  [Miro Link](https://miro.com/welcomeonboard/aXR5MVI5eTBSMmFXWTRERlk2alVvdHNFeFdvZXBzNEFHZjNWckltaS9xZEk0ZitKWTdDUHlFNWpOM01kL2pxVThia0xZSm4rRi96N2E3UHNhb24zdWt4czV5cEhaRy9QYUViY2ZIS2FIdGJJM1ZpWUZ2TW5mTkp0S1VVSWZtazghZQ==?share_link_id=682601141672)

---

### 6. **Metrics**

- Include at least **two** non-trivial metrics to measure code quality (e.g., SonarQube).

- Linter for Dart

- **Linter Output in Dart\***
  ![Linter Output in Dart](https://imgur.com/jRJ74RS.png)

---

### Clean Code Development (CCD)

#### Examples of Clean Code Principles in the Project:

1. **Single Responsibility Principle**:

   - The `AuthService` class in `authentications.dart` handles only authentication-related tasks such as signing in, signing out, and managing the authentication state.

2. **Readable and Descriptive Naming**:

   - Methods and variables like `initializeSpreadsheet`, `pickAndUploadImage`, and `signInWithGoogle` clearly indicate their functionality.

3. **Encapsulation**:

   - Private methods like `_setLoading` in `CocktailProvider` manage internal state, ensuring encapsulation.

4. **Don't Repeat Yourself (DRY)**:

   - The `GoogleSheetsService` class uses reusable methods like `_getAuthHeaders` to reduce redundancy.

5. **Reusability with Mixins**:
   - The `RecipeValidationMixin` centralizes validation logic for recipes, ensuring consistent and reusable code.

#### CCD Cheat Sheet

![CCD Principles](https://external-preview.redd.it/LqnfN_7TaXROOzrJBzXq-tk7mDsu7kHK9LdkfDGgNfI.jpg?auto=webp&s=66f8d5ca711e4a95df33745d4ab50563f659fa58)

For more details, refer to the [CCD Cheat Sheet PDF](./CCD_Cheat_Sheet-1.pdf).

### 8. **Build Management**

- The project utilizes Gradle to build and manage the project. It is included in Dart.

---

### 9. **Continuous Delivery (CI/CD)**

- A CI/CD pipeline is set up using GitHub Actions to automate build, test, and deployment processes.
- The pipeline:
  - Installs dependencies.
  - Runs all tests.
  - Builds the release APK for deployment.
- CI/CD Configuration File: [.github/workflows/ci.yml](.github/workflows/ci.yml)
- Build Status:
  ![Build Status](https://github.com/TPesch/Sofware-Engineering-Project/actions/workflows/ci.yml/badge.svg)

---

### 10. **Unit Tests**

- Unit tests are implemented to ensure code quality and functionality.
- Test cases validate methods like `validatePrice` and `validateRequired` in `recipe_validation.dart`.
- Test files are located in the `test/` directory.
- Current issues are that You cannot fully test due to the fact that the applications requires you to login to google account via firebase authentication.
- Example:
  - [Widget Test](test/widget_test.dart)
- To run the tests, use:
  ```bash
  flutter test
  ```

---

### IDE Proficiency - VSCode

#### Key Features Used:

- **Extensions**: Flutter, Dart, GitLens, Prettier
- **Integrated Terminal**: Running `flutter run` and Git commands
- **Debugging**: Setting breakpoints, inspecting variables, and hot-reload

#### Favorite Shortcuts:

- **`Ctrl + P`**: Quick open files
- **`Ctrl + Shift + F`**: Search across all files
- **`Ctrl + /`**: Comment/uncomment code
- **`F5`**: Debugging
- **`Alt + Shift + F`**: Format document
- **`Ctrl + .`**: Suggest code fixes for highlighted code errors

### 12. **Domain-Specific Language (DSL)**

This project includes a small **Domain-Specific Language (DSL)** for managing cocktail recipes. The DSL simplifies the process of defining, parsing, and displaying recipes in a human-readable and structured format.

#### **Key Features**:

1. **Declarative Recipe Definition**:
   Define recipes using a clean and simple syntax with the `define` method.
2. **Human-Readable Input**:
   Parse recipes from a text-based format into structured objects using the `fromText` factory.
3. **Readable Output**:
   Recipes are displayed consistently using the `toString` method.

#### **Example Usage**:

1. **Declarative Recipe Definition**:

   ```dart
   final mojito = CocktailRecipe.define(
     name: 'Mojito',
     glass: 'Highball',
     mainAlcohol: 'Rum',
     ingredients: 'Mint, Lime, Sugar, Rum, Soda',
     instructions: 'Muddle mint, lime, and sugar. Add rum and top with soda.',
     garnish: 'Mint sprig',
     price: '10.00',
     category: 'Classic',
   );
   ```

2. **Parsing Recipes from Text**:
   Recipes can be provided in a human-readable text format:

   ```
   Cocktail: Mojito
   Glass: Highball
   Main Alcohol: Rum
   Ingredients: Mint, Lime, Sugar, Rum, Soda
   Instructions: Muddle mint, lime, and sugar. Add rum and top with soda.
   Garnish: Mint sprig
   Price: 10.00
   Category: Classic
   ```

   Use the `fromText` factory to parse this input:

   ```dart
   final recipeText = '''
   Cocktail: Mojito
   Glass: Highball
   Main Alcohol: Rum
   Ingredients: Mint, Lime, Sugar, Rum, Soda
   Instructions: Muddle mint, lime, and sugar. Add rum and top with soda.
   Garnish: Mint sprig
   Price: 10.00
   Category: Classic
   '';

   final mojito = CocktailRecipe.fromText(recipeText);
   print(mojito);
   ```

3. **Readable Output**:
   The `toString` method outputs the recipe in a clean, readable format:
   ```
   Cocktail: Mojito
   Glass: Highball
   Main Alcohol: Rum
   Ingredients: Mint, Lime, Sugar, Rum, Soda
   Instructions: Muddle mint, lime, and sugar. Add rum and top with soda.
   Garnish: Mint sprig
   Price: 10.00
   Category: Classic
   ```

#### **Why Use This DSL?**

- **Simplifies Code**: Reduces boilerplate when working with recipes.
- **Readable and Extensible**: Provides a consistent format and can be expanded for additional functionality.

For the DSL implementation, refer to the [`CocktailRecipe` class`](lib/models/cocktail_recipe.dart).

---

### 13. **Functional Programming**

This project demonstrates key principles of functional programming:

### **1. Immutable Data Structures**

All core data structures, like `CocktailRecipe`, are immutable. Fields are declared `final` to prevent unintended modifications:

```dart
class CocktailRecipe {
  final String name;
  final String glass;
  final String mainAlcohol;
  final String ingredients;
  final String instructions;
  final String garnish;
  final String price;
  final String category;

  CocktailRecipe({
    required this.name,
    required this.glass,
    required this.mainAlcohol,
    required this.ingredients,
    required this.instructions,
    required this.garnish,
    required this.price,
    required this.category,
  });
}
```

---

### **2. Side-Effect-Free Functions**

Validation methods like `validatePrice` are pure and do not modify external state:

```dart
String? validatePrice(String price) {
  final parsedPrice = double.tryParse(price);
  if (parsedPrice == null || parsedPrice < 0) {
    return 'Please enter a valid, non-negative price.';
  }
  return null;
}
```

These functions always produce the same result for the same input, ensuring predictability.

---

### **3. Higher-Order Functions**

Higher-order functions like `.map()` are used to transform lists efficiently:

```dart
List<String> capitalizeIngredients(List<String> ingredients) {
  return ingredients.map((ingredient) => ingredient.toUpperCase()).toList();
}
```

This demonstrates how functions can operate on collections and return new transformed data without modifying the original input.

---

### **4. Closures and Anonymous Functions**

Anonymous functions in widget callbacks, like the `onTap` handler below, demonstrate closures capturing context:

```dart
onTap: () => print("Cocktail selected: Mojito"),
```

Closures allow access to variables from the surrounding context, making the code concise and efficient for interactive elements.

---

### **Conclusion**

The project adheres to functional programming principles by ensuring immutability, using side-effect-free functions, leveraging higher-order functions for data transformations, and employing closures for efficient, concise logic. These practices make the code more predictable, maintainable, and robust.

---

## Final Deliverables

- Complete documentation must be available publicly on GitHub or another platform.
- A **checklist** for each of the **13 points** mentioned above, linking to the relevant sections of the project (e.g., code, diagrams, CCD files, or test files).
- 1-2 paragraphs explaining your solution for each point, with links to appropriate code sections.

---

## Submission

Submit the GitHub link in the comment section on Moodle. Ensure that your repository is public for grading but feel free to make it private afterward.

---

## Final Remark

Share personal experiences, screenshots, and personalized text. **Avoid** submitting generic or AI-generated content. Non-compliance may result in course failure.

---
