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

### 3. & 4. **Mobile App Requirements & System Analysis**

- The mobile app **MUST** implement the following features:

   1. ##**Google OAuth 2.0 for Authentication**:
      - Users **MUST** log in using **Google OAuth 2.0** for secure authentication.
      - The authentication **MUST** follow Google's best practices for OAuth security.
   
   2. ##**Google Sheets API for Cocktail Data Management (Per User)**:
      - Each user **MUST** have their own individual **Google Sheet** to store and manage cocktail details such as the name, ingredients, and instructions.
      - The app **MUST** implement CRUD operations (Create, Read, Update, Delete) synchronized with the user's Google Sheet.
      - The data stored in the Google Sheet **CANNOT** be accessible to other users, ensuring per-account data privacy.

   3. ##**Cocktail Details Management**:
      - Authenticated users **MUST** be able to add, edit, delete, and view cocktail details.
      - Data **MUST** be securely stored in the Google Sheet and **SHOULD** be updated in real-time when CRUD operations are performed.

   4. ##**Per-Account Data Segregation**:
      - Each user **SHOULD** have access only to their own cocktail data, ensuring privacy and data integrity.
      - Data **MUST** be private, and one user **CANNOT** access another user's data under any circumstance.

   5. ##**Mobile App Development Using Flutter**:
      - The app **MUST** be developed using **Flutter** and **MUST** be built to run on Android devices.
      - The use of Flutter widgets and best practices **SHOULD** be implemented for smooth and responsive UI.


---

### 5. **Domain-Driven Design (DDD)**
   - Invent additional domains if necessary, and document them with strategic design mappings.
   - Show relationships between more than four domains and represent them in a Core Domain Chart.

### 6. **Metrics**
   - Include at least **two** non-trivial metrics to measure code quality (e.g., SonarQube).

### 7. **Clean Code Development (CCD)**
   - Provide **five** examples in the code that reflect clean code principles.
   - Include a **CCD Cheat Sheet** with at least **10 points** (e.g., as a PDF).

### 8. **Build Management**
   - Use any build system (Ant, Maven, Gradle, etc.) for build management, documentation generation, and running tests.

### 9. **Continuous Delivery**
   - Implement a CI/CD pipeline using tools like Jenkins, GitHub Actions, or GitLab CI. 
   - Include more than two script calls in the build process.

### 10. **Unit Tests**
   - Integrate unit tests that are automatically triggered by the build system.

### 11. **IDE Proficiency**
   - Use an Integrated Development Environment (IDE) such as **VSCode** or **IntelliJ** and document your favorite shortcuts.

### 12. **Domain-Specific Language (DSL)**
   - Create a small DSL demo in your code, even if it doesn’t contribute directly to the main project.

### 13. **Functional Programming**
   Demonstrate functional programming principles in your code, including:
   - Immutable data structures
   - Side-effect-free functions
   - Higher-order functions
   - Use of closures and anonymous functions

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
