#  Test App Using Unit Test

A Flutter project demonstrating the implementation of unit testing for an application using API calls and a simple counter feature.

---

## Overview

This project is designed to showcase the following:

1. **API Integration:**
   - Fetch data from an API (`https://jsonplaceholder.typicode.com/users`).
   - Parse JSON responses to Dart models.

2. **Unit Testing:**
   - Validate the functionality of the repository classes.
   - Mock HTTP responses to simulate API calls.
   - Test core business logic such as incrementing and decrementing a counter.

3. **Flutter UI Integration:**
   - Display data fetched from the API using `FutureBuilder`.
   - Implement a counter application with increment and decrement functionality.

---

## Folder Structure

```
lib/
├── controllers/
│   ├── counter.dart         # Counter logic for increment and decrement.
├── models/
│   ├── user_model.dart      # User model for API data parsing.
├── repository/
│   ├── user_repository.dart # Repository for handling API calls.
├── screens/
│   ├── counter_page.dart    # UI for counter app.
│   ├── home_page.dart       # UI for displaying user data.
├── main.dart                # Entry point of the application.

test/
├── counter_test.dart        # Unit tests for counter logic.
├── user_repository_test.dart# Unit tests for user repository (API testing).
```

---

## Features

### 1. API Integration
- **Repository Pattern:** The `UserRepository` class is responsible for handling API calls.
- **Model Parsing:** JSON data is parsed into a `UserModel` object.

### 2. Counter Logic
- Simple counter logic implemented in the `Counter` class with increment and decrement functionality.
- Prevents the counter from going below zero.

### 3. Unit Testing

#### a. Testing API Calls (`user_repository_test.dart`)
- Uses `mocktail` to mock the HTTP client.
- Simulates both success (status code 200) and failure (status code 500) scenarios.

#### b. Testing Counter Logic (`counter_test.dart`)
- Verifies that the counter increments, decrements, and does not go below zero.

---

## How to Run the Project

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/DeepakStark123/unit_testing
   cd api_test_using_unit_test
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

---

## Running Unit Tests

1. **Run All Tests:**
   ```bash
   flutter test
   ```

2. **Run Specific Test:**
   To run a specific test file:
   ```bash
   flutter test test/<test-file-name>.dart
   ```

Example:
   ```bash
   flutter test test/user_repository_test.dart
   ```

---

## Sample Test Cases

### a. API Testing
**File:** `test/user_repository_test.dart`

- **Test Success Scenario:**
   Verifies that the `UserRepository` returns a list of `UserModel` objects when the API responds with a 200 status code.

- **Test Failure Scenario:**
   Validates that an exception is thrown when the API responds with a non-200 status code.

**Example Test Code:**
```dart
    test("should return a list of UserModel when status code is 200", () async {
      // Arrange
      when(() => mockHTTPClient.get(any())).thenAnswer((_) async {
        return Response('[{"id":1,"name":"John Doe","email":"john.doe@example.com","website":"example.com"}]', 200);
      });

      // Act
      final users = await userRepository.getUsers();

      // Assert
      expect(users, isA<List<UserModel>>());
      expect(users.first.name, "John Doe");
    });
```

---

### b. Counter Testing
**File:** `test/counter_test.dart`

- **Test Increment:** Verifies that calling `increment` increases the counter value by 1.
- **Test Decrement:** Ensures that calling `decrement` decreases the counter value but never below zero.

**Example Test Code:**
```dart
    test("Initial value should be 0", () {
      expect(counter.count, 0);
    });

    test("Increment method should increase the counter by 1", () {
      counter.increment();
      expect(counter.count, 1);
    });

    test("Decrement method should not decrease the counter below 0", () {
      counter.decrement();
      expect(counter.count, 0);
    });
```

## Libraries Used

1. **http:** For making API calls.
2. **flutter_test:** For writing unit tests.
3. **mocktail:** For mocking HTTP responses in tests.

---

## Contributing
Feel free to fork this repository and contribute to enhance its functionality.

---

## License
This project is licensed under the MIT License.
# unit_testing
