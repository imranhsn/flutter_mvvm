# Flutter MVVM test

The Flutter MVVM test is a simple application that showing some screen with bottom navigation. It showcases the
MVVM architecture pattern, where the business logic and state management are handled by the
ViewModel, and the UI is managed by the View. The app utilizes the provider package for managing
state and data flow between the ViewModel and the View.

## Architecture

The MVVM (Model-View-ViewModel) architecture pattern separates the concerns of the app into three
main components:

- Model: Represents the data and business logic of the app.
- View: Handles the UI rendering and user interactions.
- ViewModel: Acts as the intermediary between the Model and the View, providing data and - handling user actions.

The ViewModel retrieves data from the Model and exposes it to the View, ensuring a clear separation
between the UI and business logic. The View updates its UI based on the data provided by the
ViewModel and communicates user actions back to the ViewModel.

## SDK info

- Flutter sdk version: 3.3.9-stable
- Dart sdk version: 2.18.5

## Dependencies

The Flutter MVVM sample app utilizes several packages to enhance its functionality:

- **provider**: For state management and data flow between the ViewModel and the View.
- **flutter_markdown**: For rendering Markdown text in the app.
- **url_launcher**: For launching URLs in the device's browser.
- **image_picker**: For selecting images from the device's gallery.
- **http**: For making HTTP requests to a remote server.
- **intl**: For internationalization and localization of the app's content.

## Folder Structure

- assets: Contains image and json data that used throughout the app.
- data: Contains remote and local datasource that used for data management.
- models: Contains the models used for data management.
- repository: Contains the repositories used for data management.
- res: Contains the widget style, color and string that used throughout the app.
- utils: Contains utility functions and classes used throughout the app.
- view: Contains the screens and viewmodels used for the app's UI.
- main.dart: The entry point of the app.