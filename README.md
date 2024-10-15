# Software-Engineering-Project
Software Engineering Project for University

## Important Dates:
1. **22nd Oct**: Name, Project, and GitHub link [5 Points]
2. **1st Dec**: First Deliverable with substantial content [15 Points]
3. **20th Jan**: Final GitHub submission with all tasks completed

### Project Overview
A) Write a small pet project to get back into coding. The code on GitHub can be relatively simple (e.g., a basic game with console output). The documentation can also be brief.

B) Ensure that each team member has applied the following topics taught during lectures in the code:

### Topics to Cover:

1. **Git:**  
   Show that you've used Git for version control effectively.

2. **UML Diagrams:**  
   Include at least **3 different diagrams**. These can be artificially enhanced as per Domain-Driven Design (DDD). Export the images for submission.

   - **Class Diagram:**
     ![Class_Diagram](https://i.imgur.com/1fJUkjS.png)
     _A Class Diagram_

   - **Use Case Diagram:**
     ![Use_Case_Diagram](https://i.imgur.com/mlQ6zBV.png)
     _A Use Case Diagram_

   - **Activity Diagram:**
     ![Activity_Diagram](https://i.imgur.com/DdcNVZy.png)
     _An Activity Diagram_

3. **Requirements:**

The mobile app should have five main features:

 **Google OAuth 2.0 for Authentication**  
   - The app must allow users to log in using Google OAuth 2.0 for secure authentication.

 **Google Sheets API for Cocktail Data Management (Per User)**  
   - Each user will have their own **individual Google Sheet** associated with their account.
   - Upon successful authentication, the app will either create a new Google Sheet for the user (if it doesn't exist) or retrieve the existing sheet associated with the user’s account.
   - Users can store and manage their cocktail details (e.g., name, ingredients, instructions, etc.) on their personal sheet.
   - CRUD (Create, Read, Update, Delete) operations will be implemented, enabling users to interact with their cocktail data stored in their Google Sheet.

 **Built Using Flutter**  
   - The app will be developed using **Flutter**, a cross-platform framework, to ensure it runs on Android.

 **Cocktail Details Management**  
   - The app will allow users to **add**, **edit**, **delete**, and **view** cocktail details, with all changes being reflected in their personal Google Sheet.
   - Editing features will be available only to authenticated users, ensuring that only authorized users can modify their own cocktail data.
   - The changes will be synchronized with the user’s personal Google Sheets backend via the **Google Sheets API**.

 **Per-Account Data Segregation**  
   - Each user will only have access to their own cocktail data stored in their personal Google Sheet.
   - Users will not be able to view or modify other users' data, ensuring that each user's data is private and secure.


5. **Analysis:**  
   Provide an analysis of your system, covering the key features and functionality.

6. **Domain-Driven Design (DDD):**
   A) If your domain is too small, invent additional domains and document them as if you had €100M in investment.  
   B) Develop a strategic design with mappings/relationships between more than 4 domains from Event Storming sessions.  
   C) Drop your domains into a Core Domain Chart and show the relationships between them.

7. **Metrics:**  
   Include at least two non-trivial metrics (e.g., SonarQube) to measure code quality.

8. **Clean Code Development (CCD):**
   A) Show at least **5 points** in your code that reflect clean code principles.  
   B) Provide a CCD cheat sheet with more than 10 points (can be in a PDF).

9. **Build Management:**  
   Use any build system (Ant, Maven, Gradle, etc.). Generate documentation, run tests, and manage your build effectively.

10. **Continuous Delivery:**  
   Implement a CI/CD pipeline using tools like Jenkins, GitHub Actions, GitLab CI, etc. Include more than two script calls, such as build tools like Gradle or Ant.

11. **Unit Tests:**  
    Integrate unit tests in your code that are automatically triggered by your build system.

12. **Integrated Development Environment (IDE):**  
    Use a good IDE (e.g., VSCode, IntelliJ) and get fluent with it. Share your favorite key shortcuts.

13. **Domain-Specific Language (DSL):**  
    Create a small DSL demo in your code, even if it's in another language or doesn’t contribute to the project.

14. **Functional Programming:**  
    Demonstrate functional programming concepts in your code:
    - Final data structures
    - Side-effect-free functions
    - Use of higher-order functions
    - Functions as parameters and return values
    - Closures/anonymous functions

### Final Deliverables:
- Complete documentation must be publicly available on GitHub (or another system you use).
- Provide a checklist for each of the **13 points** mentioned above, with links to the relevant parts of your project (e.g., code, diagrams, CCD files, or test files).
- Write 1-2 paragraphs for each point to explain your solution, linking to the appropriate sections of your code or documentation.

### Submission:
Submit the GitHub link in the comment section on Moodle. Make sure your repository is public for grading, and you can make it private again after the evaluation.

### Final Remark:
Include your personal experiences with screenshots and personalized text. **Do not** submit generic or AI-generated content such as "a DSL is blah blah blah." This will result in course failure.
