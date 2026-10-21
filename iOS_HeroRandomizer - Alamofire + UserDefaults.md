# Assignment 11 — Superhero Randomizer App (via Packages)

## Objective

Create an iOS application that fetches and displays random superhero information from the SuperHero API.  
This project will help you understand networking in iOS, JSON parsing, UI design, and basic data persistence.  
You **must** use external libraries for making network requests and handling image loading.

## Project Description

Your task is to develop an app that:

- Fetches a random superhero when a button is tapped.
- Displays detailed information about the superhero, using **at least 10 attributes** from the API response.
- Stores the **last selected superhero** locally using `UserDefaults` and restores it when the app is launched again.
- Provides a user-friendly interface that is visually appealing and easy to navigate.

## Requirements

### 1. Networking

- Use **Alamofire** package to make network requests.
- Use **Kingfisher** package to load and display the superhero image in `UIImageView`.
- Fetch data from the SuperHero API:  
  `https://akabab.github.io/superhero-api/api/`
- Ensure proper error handling for all network requests.

### 2. Random Superhero Functionality

- Implement a **“Randomize”** button that fetches and displays a random superhero each time it’s tapped.
- Ensure randomness by selecting from the **full list of superheroes** provided by the API.

### 3. Display Superhero Information

- Show **at least 10 attributes** from the superhero’s data, for example:
  - Name
  - Full Name
  - Intelligence
  - Strength
  - Speed
  - Power
  - Durability
  - Combat
  - Race
  - Gender
  - Place of Birth
  - Alignment
  - Image
- Include the superhero’s **image** in the display using Kingfisher.

### 4. Persisting the Last Selected Superhero (UserDefaults)

- After successfully loading and displaying a superhero, **save the last selected superhero** to local storage using `UserDefaults`.  
  You can store, for example:
  - Superhero **ID**, and/or
  - Any other minimal set of fields needed to restore the last hero.
- On app launch:
  - Check `UserDefaults` for a previously saved hero.
  - If found, **display this hero first** instead of fetching a new random one.
  - If not found, you may fetch a random hero as usual.
- Make sure your code for saving and loading from `UserDefaults` is **safe, well-structured, and testable**.

### 5. User Interface

- Design a clean and intuitive UI using **UIKit**.
- Use **Auto Layout** to ensure the app looks good on all device sizes and orientations.
- The main screen should contain at least:
  - Superhero image
  - Main info block (name, real name, etc.)
  - Stats/attributes section
  - “Randomize” button

### 6. Code Quality

- Write clean, maintainable, and well-documented code.
- Follow Swift coding conventions and best practices.
- Organize your code using appropriate structures such as:
  - Separate files for models, networking, and UI.
  - Use of `struct`/`class` models for decoding JSON.
  - Clear separation of responsibilities.

### 7. Error Handling

- Gracefully handle errors such as:
  - Failed network requests
  - Invalid or unexpected JSON data
  - Missing or invalid image URLs
- Provide user feedback in case of errors, for example:
  - Alert
  - Label with error text
  - Placeholder image

### 8. Bonus (Optional)

- Add **animations** when transitioning between superheroes, for example:
  - Fade-in / fade-out of the image
  - Smooth transitions between hero info blocks.
- Add a **loading indicator** while fetching data.

### 9. Submission Guidelines

- Submit your complete Xcode project in your **Git repository**.
- Include a **video demonstration** of your project that shows:
  - Random superhero fetching
  - Displaying hero details
  - Restoring the last selected hero after app relaunch
- Ensure all assets and dependencies are included, and the project builds successfully.

### 10. Tips

- **Start Early**: Give yourself plenty of time to work through challenges.
- **Test Thoroughly**: Regularly test your app on different devices or simulators.
- **Ask Questions**: If you’re unsure about any aspect of the assignment, reach out to your instructor.

### 11. Academic Integrity

This assignment must be completed **individually**.  
Plagiarism or copying code from others is strictly prohibited and will result in a failing grade.
