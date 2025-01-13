# Software Engineering Project

This project is part of my university coursework, where I get to explore and apply various software engineering concepts to a pet project. The goal is to not only learn but to create something meaningful and practical, while using tools and techniques we've covered in class.

---

## Important Dates

1.  **22nd Oct**: Name, Project, and GitHub link (**5 Points**)

2.  **1st Dec**: First Deliverable with substantial content (**15 Points**)

3.  **20th Jan**: Final GitHub submission with all tasks completed

---

## Project Overview

### A) Project Description

This project started as a way for me to get back into coding after spending most of my life working in the service industry. I’ve been behind a bar for years, and one thing I’ve consistently seen is how difficult it is for new bartenders to remember cocktail recipes. Every new place comes with a flood of scribbled notes, recipe books, and cluttered bars.

So, I decided to create a way to solve this problem. First with a Web server, and now with a could based App. My goal is to build a clean, accessible recipe management tool where I (and others) can store all our cocktail recipes in one place. Something new hires can use without the fear of spilling drinks all over it.

This is more than just an app for me, it’s a chance to bridge my personal experience with tech.

---

## Topics to Cover:

### 1. **Git**

- I’ve used Git throughout this project to manage version control effectively. Features like branches, commits, and merges have helped me stay organized and track progress.

### 2. **UML Diagrams**

The project includes three UML diagrams that help visualize the system design. Using what we learned in class I used Miro to create these diagrams:

- **Class Diagram**

![Class Diagram](https://i.imgur.com/1fJUkjS.png)

- **Use Case Diagram**

![Use Case Diagram](https://i.imgur.com/mlQ6zBV.png)

- **Activity Diagram**

![Activity Diagram](https://i.imgur.com/DdcNVZy.png)

---

### 3. **Mobile App Requirements**

#### Simple Tool Trello

- **Requirments at start**

![Cocktail Recipe App Requirements](https://imgur.com/1M1c9Ue.png)

**Requirments Currently**

- [Cocktail Recipe App Requirements - Trello Board](https://trello.com/invite/b/67852abf8551da1b8f59c8d9/ATTIf900b65a11b7a0a33f84290b7fedf8fbAF81C2E0/cocktail-recipe-app-requirements)

#### Professional Tool Jira

- **Requirments at start**

![Cocktail Recipe App Requirements](https://imgur.com/pzE8iI6.png)

**Requirments Currently**

- [Cocktail Recipe App Requirements - Jira Board](https://tpesch.atlassian.net/jira/core/projects/MP/board?atlOrigin=eyJpIjoiZDFmYWI0Y2EzNDExNDM0Mjg2MjJkMmQ5ZDk4NzQyOWUiLCJwIjoiaiJ9)

### 4. **System Analysis**

#### **Checklist for Analysis:**

    Problem Definition
    Target Audience
    Unique Selling Proposition (USP)
    Competitor Analysis
    Core Features
    Monetization Strategy
    Technical Feasibility
    User Experience (UX) Design
    Data Privacy and Security
    Scalability
    Market Validation
    Development Timeline
    Risks and Challenges
    Innovation Potential
    Future Expansion

#### Document Analysis

You can find the detailed project analysis checklist in the following PDF document:

## [Project Analysis Checklist](Project-Analysis-Checklist.pdf)

### 5. **Domain-Driven Design (DDD)**

Here’s how I broke the project into domains:

1.  **Recipe Domain**: CRUD operations and metadata management.

2.  **Storage Domain**: Integration with Google Sheets and data backup.

3.  **Search Domain**: Filtering and sorting functionality.

4.  **Media Domain**: Handling photo uploads and storage.

Visuals:

![DDD Diagram](https://imgur.com/XdZt3eQ.png)

DDD Diagrams:

![DDD Diagram V1](https://imgur.com/wVkKUtF.png)

![DDD Diagram V2](https://imgur.com/tlznXHB.png)

![DDD Diagram V3](https://imgur.com/5tAFayU.png)

Core Domain Chart:

![Core Domain Chart](https://imgur.com/U8NPeLF.png)

---

### 6. **Metrics**

- I used Dart’s linter to ensure the code follows best practices.

- The linter results show a clean codebase with minimal warnings/errors.

Linter Screenshots through the course of the project:

![Linter Sc V1](https://imgur.com/G5I4RdH.png)

![Linter Sc V2](https://imgur.com/Ouepxto.png)

![Linter Sc V3](https://imgur.com/prqdkDD.png)

---

### 7. **Clean Code Development (CCD)**

Here’s how I kept the code clean:

1.  **Single Responsibility Principle**: Classes like [`AuthService`](./lib/services/authentications.dart) focus on one thing—authentication.

2.  **Readable Names**: Methods like [`initializeSpreadsheet`](./lib/providers/cocktail-provider.dart) and [`signInWithGoogle`](./lib/services/authentications.dart) are self-explanatory.

3.  **Encapsulation**: Internal state management is handled by private methods within classes like [`StorageService`](./lib/services/storage_service.dart).

4.  **DRY Principle**: Reusable methods like [`_getAuthHeaders`](./lib/services/google_sheets_integration.dart) simplify code.

5.  **Mixins**: Recipe validation is centralized in [`RecipeValidationMixin`](./lib/models/recipe_validation.dart).

### 8. **REFACTORING**: Show me two (non-trivial) Refactoring Examples of your code! Showing the original content and the refactored code! Explain what happened, why and how it has improved! Again: do not send me pure AI work!

As part of the development process, I found and improved two areas of the code where refactoring was necessary. Below are two examples, including the original and refactored versions, along with explanations of the changes and their benefits.

#### **Example 1: Centralizing Error Handling in Authentication**

**Original Code:**

The `signOut` method in [`authentications.dart`](./lib/services/authentications.dart) had repetitive error-handling logic. This worked but wasn't reusable and consistent, making it harder to maintain.

```dart
Future<void> signOut() async {
  try {
    await Future.wait([
      _auth.signOut(),
      _googleSignIn.signOut(),
    ]);
  } catch (e) {
    print('Error signing out: $e');
  }
}
```

**Refactored Code:**

By highlighting the error-handling block in Example 1 and used the Extract Method in Visual studio i was able to generate th helper function. `_handleError` This method can be reused multiple times in the class, making the code cleaner and more consistent.

```dart
void  _handleError(BuildContext? context, String message, dynamic error) {
print('$message: $error');
if (context != null) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text('$message: ${error.toString()}'), backgroundColor: Colors.red),
);
}
}

Future<void> signOut() async {
try {
await  Future.wait([
_auth.signOut(),
_googleSignIn.signOut(),
]);
} catch (e) {
_handleError(null, 'Error signing out', e);
}
}
```

**Why I Refactored:**

This change centralizes the error-handling logic into a single method, reducing redundancy and improving readability. If other methods require error handling in the future, I can now reuse `_handleError`.

---

#### **Example 2: Simplifying Ingredient Formatting in Recipe Dialog**

**Original Code:**

The `formatIngredients` method in [`home-page-updated.dart`](./lib/screens/home-page-updated.dart) was designed to clean and format a list of ingredients. However, it looked tacky and hard to read, so I used the linting suggestion from Dart Analyzer to simplify the redundant operations in Example 2.

```dart
String  formatIngredients(String rawIngredients) {
return rawIngredients
.split(',')
.map((ingredient) => ingredient.trim())
.where((ingredient) => ingredient.isNotEmpty)
.join('\n');
}



```

**Refactored Code:**

I simplified the method by combining operations and eliminating unnecessary steps. (Thowing this into ChatGbt Had helped in orgnising this bit of code)

```dart
String  formatIngredients(String rawIngredients) {
return rawIngredients.split(',').where((i) => i.trim().isNotEmpty).join('\n');
}
```

**Why I Refactored:**

This change reduces unnecessary operations like `map` and simplifies the logic into a more concise form. The code is now easier to read and slightly faster, as fewer operations are performed.

---

#### **How These Changes Improved the Code**

1.  **Centralized Error Handling:**

- It reduces code duplication.

- As well as ensures consistent error reporting across the code.

- Finally it improves maintainability as error handling can now be reused.

2.  **Simplified Ingredient Formatting:**

- Reduces complexity by eliminating redundant operations.

- This improves readability and performance.

- As well as ensures that the method is easier to understand for future developers.

### 9. **Build Management**

- The project utilizes Gradle to build and manage the project. Key files include:

- [`build.gradle`](./android/build.gradle): The root-level Gradle build file that configures repositories and dependencies shared across the project.

- [`settings.gradle`](./android/settings.gradle): Configures Gradle modules and their inclusion in the project.

- [`app/build.gradle`](./android/app/build.gradle): The module-level Gradle build file for the app, containing specific configurations like dependencies, build types, and product flavors.

- [`gradle.properties`](./android/gradle.properties): Contains project-level properties like JVM arguments and AndroidX settings.

### 10. show me your pipeline using e.g. Jenkins, GitHub Actions, GitLab CI, etc. E.g. you can also use Jenkins Pipelining or BlueOcean, etc. But at least insert more than 2 script calls as done in the lecture! (e.g. also call Ant or Gradle or something else).

Set up GitHub Actions to automate the workflow:

- Install dependencies

- Run tests

- Build the release APK

You can view the GitHub Actions workflow configuration [here](https://github.com/TPesch/Sofware-Engineering-Project/actions/workflows/ci.yml).

### 11.Integrate some nice UNIT TESTS in your Code to be integrated into the Build!

Test cases cover validation methods ([`validatePrice`](./lib/models/recipe_validation.dart), [`validateRequired`](./lib/models/recipe_validation.dart)). These tests ensure the app runs smoothly, even if login limits full testing.

You can find the related test files here:

- [`recipe_validation_test.dart`](./test/recipe_validation_test.dart): Contains unit tests for recipe validation methods.

- [`widget_test.dart`](./test/widget_test.dart): Ensures proper functionality of widgets.

### 12. Use a good IDE and get fluent with it: e.g. VSCode, IntelliJ. What are your favourite key shortcuts?!

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

### 13. AI Coding: Set Up an AI-coding environment on your computer like ZED, Aider, free Cursor / Windsurf programs, etc. Show your steps and personal experiences!

#### **Tools Used**

I chose **GitHub Copilot** as my AI coding assistant because of its seamless integration with Visual Studio Code. It helps me write code faster by suggesting snippets, refactorings, and patterns in real time.

#### **Personal Experience**

Setting up Copilot was easy, and it immediately started assisting with my project. I used it to:

- Create a search bar for filtering cocktail recipes.
- Learn better Dart coding patterns by reviewing its suggestions.

#### **Example: Creating a Search Bar**

[See AI Coding Examples](#15-set-up-a-running-ai-coding-environment-prove-it-by-coding-something-iteratively)

### 14. **Functional Programming**

This project demonstrates key principles of functional programming:

#### **A. Immutable Data Structures**

All core data structures, like `CocktailRecipe`, are immutable. Fields are declared `final` to prevent unintended modifications:

```dart

class  CocktailRecipe {
final  String name;
final  String glass;
final  String mainAlcohol;
final  String ingredients;
final  String instructions;
final  String garnish;
final  String price;
final  String category;

CocktailRecipe({
required  this.name,
required  this.glass,
required  this.mainAlcohol,
required  this.ingredients,
required  this.instructions,
required  this.garnish,
required  this.price,
required  this.category,
});

}

```

---

#### **B. Side-Effect-Free Functions**

Validation methods like `validatePrice` are pure and do not modify external state:

```dart

String? validatePrice(String price) {
final parsedPrice = double.tryParse(price);
if (parsedPrice == null || parsedPrice < 0) {
return  'Please enter a valid, non-negative price.';
}
return  null;
}

```

These functions always produce the same result for the same input, ensuring predictability.

---

#### **C. Higher-Order Functions**

Higher-order functions like `.map()` are used to transform lists efficiently:

```dart
List<String> capitalizeIngredients(List<String> ingredients) {
return ingredients.map((ingredient) => ingredient.toUpperCase()).toList();
}
```

This demonstrates how functions can operate on collections and return new transformed data without modifying the original input.

#### **D. Closures and Anonymous Functions**

Anonymous functions in widget callbacks, like the `onTap` handler below, demonstrate closures capturing context:

```dart
onTap: () => print("Cocktail selected: Mojito"),
```

Closures allow access to variables from the surrounding context, making the code concise and efficient for interactive elements.

---

### 15. Set up a running AI Coding environment! Prove it by “coding” something iteratively

![Ai coding part 1](https://imgur.com/bk6qZ0E.png)
![Ai coding part 2](https://imgur.com/fqAfK2o.png)
![Ai coding part 3](https://imgur.com/yEp8YCb.png)

Honestly i am impressed how fast I was able to implement a search function to the app, with just the help of Copilot. This was somthing that i was putting off due to my little understanding behind how to implement it in dart. But now i feel like i should have been using Copilot much sooner!

### **Conclusion**

The project adheres to functional programming principles by ensuring immutability, using side-effect-free functions, leveraging higher-order functions for data transformations, and employing closures for efficient, concise logic. These practices make the code more predictable, maintainable, and robust.

---

## Final Deliverables

- Complete documentation must be available publicly on GitHub or another platform.

- A **checklist** for each of the **13 points** mentioned above, linking to the relevant sections of the project (e.g., code, diagrams, CCD files, or test files).

- 1-2 paragraphs explaining your solution for each point, with links to appropriate code sections.

---

## Submission

Submit the GitHub link. Ensure that your repository is public for grading but feel free to make it private afterward.

---

## Final Remark

Share personal experiences, screenshots, and personalized text.

I had alot of fun making this project. Although it was somthing that i wanted to do for a long time, I realise i wouldnt have been able to make it as fast or efficient as this project ended up becoming. Learning about the different ways to utalize Github repositories, mistakes and all, was honestly one of the highlights of this project.

My personal favorite mess up was discovering that i had uploaded the api keys for Firebase onto github just as I was finishing up in class. I remember seeing an email from github that i had "messed up" and had gotten warnings for each api key. Normally all i would have to do is reset the api keys and then add the api key to git.ignore, but for some reason Firebase didnt want to do that. This wonderfull mistake allowed me to learn how to branch and merge branches on github. Looking back I still find it quite funny how much stress i ended up having, and essencially reseting my entire project. however in the end I'm grateful i learned this lesson on a simple university project and not a 40Million $ project.

Another part of this that I found interesting also relates to GitHub. I think it’s wild that you can run active projects directly through the Actions tab. At first, I had no idea what it was or why I’d ever use it, but after we had a class on it, i started getting inspirations for it. I realized how cool it was to have workflows that could automatically test and deploy my code. Of course, I managed to mess it up the first few times, as well. Turns out, YAML files are a lot more complicated than I thought. But after some trial and error (and a few desperate messages to ChatGBT), I got the hang of it, i finally had something running. Only for it to continue to fail, time in and time out. Turns out, its hard to test code that relies on data that is locked behind a unique google account. I think that maybe in the future ill do better in organizing my code, so that it is easier to implement such tests and workflows.

In the end Im greatful for this project, as an opertunity to give me the pressure i needed to work on the idea i had in the back of my head, and to be able to learn what actually goes into creating an organised project from start to "finish". I know that i will be taking what ive learning this semester forward withme as i continue to study, and even past that, hopefuly working in tech.

## Funny IRL Video Reaction of me coding in Uruguay (Click to see the video)

[![Watch the video](https://drive.google.com/uc?export=view&id=1b_NyLd6CKBlEyBQaGlXQBQiir3ZDqTcA)](https://youtube.com/shorts/lW26YjiGeCA?feature=share)
