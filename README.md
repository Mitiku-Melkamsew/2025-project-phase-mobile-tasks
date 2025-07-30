# E-commerce Flutter Application

This is a simple e-commerce mobile application built with Flutter. It allows users to browse a list of products, view product details, add new products to the catalog, and delete and update products.

## Table of Contents

- [Features](#features)
- [Screenshots](#screenshots)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
- [Project Structure](#project-structure)
- [How It Works](#how-it-works)
  - [Data Model](#data-model)
  - [State Management](#state-management)
  - [Navigation and Data Passing](#navigation-and-data-passing)
  - [Modular UI Components](#modular-ui-components)

## Features

- **View Products**: A list of available products is displayed on the home screen.
- **Add New Products**: Users can add new products to the list through a form, which includes fields for name, category, price, and description.
- **View Product Details**: Tapping on a product card navigates to a detailed view of that product.
- **Search and Filter**: A search page allows users to find products. (Further filtering logic can be implemented).
- **Modular Design**: The UI is built with reusable widgets for consistency and maintainability.

## Screenshots

| Home Page                                                                              | Details Page                                                                                | Update Page                                                                              | Search Page                                                                              |
| -------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| ![Home Page](https://github.com/Mitiku-Melkamsew/2025-project-phase-mobile-tasks/mobile/mitiku_melkamsew/ecommerce/screen_shots/Home_page.png?raw=true) | ![Details Page](https://github.com/Mitiku-Melkamsew/2025-project-phase-mobile-tasks/blob/navigation/screen_shots/Details_page.png?raw=true) | ![Update Page](https://github.com/Mitiku-Melkamsew/2025-project-phase-mobile-tasks/blob/navigation/screen_shots/Update_page.png?raw=true) | ![Search Page](https://github.com/Mitiku-Melkamsew/2025-project-phase-mobile-tasks/blob/navigation/screen_shots/Search_page.png?raw=true) |


## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing.

### Prerequisites

- Flutter SDK: [Installation Guide](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.
- An emulator or a physical device to run the app.

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/Mitiku-Melkamsew/2025-project-phase-mobile-tasks.git
    ```
2.  **Navigate to the project directory:**
    ```sh
    cd 2025-project-phase-mobile-tasks/mobile/mitiku_melkamsew/ecommerce
    ```
3.  **Install dependencies:**
    ```sh
    flutter pub get
    ```
4.  **Run the app:**
    ```sh
    flutter run
    ```

## Project Structure

The project follows a standard Flutter structure. Key files and directories are located within the `lib/` folder.

```
lib/
├── data.dart                 # Defines the Product data model and the ProductManager class.
├── main.dart                 # The main entry point of the application.
├── pages/
│   ├── details.dart          # Screen to show details of a single product.
│   ├── home.dart             # The main screen, displays the list of all products.
│   ├── search.dart           # Screen for searching and filtering products.
│   └── update.dart           # Screen with a form to add/update products.
└── utils/
    ├── card.dart             # The UI widget for a single product card.
    └── product_list_view.dart  # A reusable widget to display a list of products.
```

## How It Works

### Data Model

The core of the application's data is the `Product` class, defined in `lib/data.dart`. It holds all the information for a single product item.

```dart
class Product {
  final String imageurl;
  final String name;
  final double price;
  final String category;
  final String description;
  // ... constructor
}
```

### State Management

The application's state (the list of products) is managed by the `ProductManager` class, also in `lib/data.dart`. This class holds a `Map` of products and provides methods to add new ones and delete.

For this project, state is managed by passing the `ProductManager` instance down the widget tree from the `Home` widget. The `Home` widget is a `StatefulWidget` that holds the instance of `ProductManager`. When a new product is added via the `Update` page, `Navigator.pop()` returns a signal, and the `Home` widget calls `setState()` to rebuild the UI with the updated product list.

### Navigation and Data Passing

The app uses named routes for navigation, which are defined in `lib/main.dart`.

-   **Passing Data on Navigation**: When navigating to a page that needs data (like the `Details` or `Search` page), the data is passed via the `arguments` parameter of `Navigator.pushNamed()`.

    *Example from `product_list_view.dart`:*
    ```dart
    Navigator.pushNamed(
      context,
      '/details',
      arguments: product, // The Product object is passed here
    );
    ```

-   **Receiving Data**: The destination page retrieves the data using `ModalRoute.of(context)!.settings.arguments`.

    *Example from `details.dart`:*
    ```dart
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    ```

### Modular UI Components

To promote code reuse and maintainability, the UI is broken down into smaller, modular widgets.

-   **`ProductCard` (`lib/utils/card.dart`)**: A stateless widget that displays a single product's information in a card format.
-   **`ProductListView` (`lib/utils/product_list_view.dart`)**: A reusable widget that takes a list of `Product` objects and displays them in a `ListView.builder`. This is used on both the `Home` and `Search` pages.
