# ToDosApp-usingFlutterWithHydratedBloc

 A simple multi-platform Flutter application for iOS and Android that helps users manage daily tasks efficiently using BLoC (Business Logic Component) with Hydrated BLoC for automatic state persistence.

This project was built as a learning-focused app to practice Flutter architecture, event-driven state management, and scalable project structure while implementing a real-world To-Do workflow.

In this version, Hydrated BLoC was added to persist application data locally, allowing tasks to remain saved even after closing or restarting the app — without using a database.

The app allows users to add, update, and remove tasks with smooth UI updates powered by reactive state management using the BLoC pattern.

## Features

• Add new tasks
• Mark tasks as completed
• Delete tasks from the list
• Real-time UI updates using BLoC
• Event-driven state management
• Automatic state persistence using Hydrated BLoC
• Tasks remain saved after app restart
• Clean and responsive user interface
• Organized and scalable project structure
• Smooth state transitions
• Lightweight and fast performance


## Technologies Used

• Flutter — Cross-platform mobile development framework
• Dart — Main programming language
• BLoC (flutter_bloc) — Event-driven state management
• Hydrated BLoC — Local state persistence
• Equatable — Efficient state comparison
• Material Design — UI components and layout


## Architecture

The app follows a layered architecture to keep the code maintainable and scalable:

Presentation Layer

• Screens
• Widgets
• UI rendering
• User interaction handling using BlocBuilder and BlocListener

Business Logic Layer

• BLoC for state management
• Hydrated BLoC for automatic state restoration
• Separates logic into:
• Events (user actions)
• States (UI representation)
• Bloc (business logic)

Handles:
• Adding tasks
• Removing tasks
• Updating task status
• Persisting tasks automatically between app sessions

Data Layer

• Task model with JSON serialization for persistence


## Installation

1. Clone the repository

HTTPS

https://github.com/heshamabdelhamead/ToDosApp-usingFlutterWithHydratedBloc.git

SSH
git@github.com:heshamabdelhamead/ToDosApp-usingFlutterWithHydratedBloc.git


2. Navigate to the project folder

cd flutter_todo_hydrated_bloc

3. Install dependencies

flutter pub get


## Requirements

• Flutter 3.x or later
• Dart SDK
• Android Studio or VS Code with Flutter plugin
• iOS Simulator or Android Emulator


# Author

Hesham Abdelhamid
Mobile Developer (iOS & Flutter)

Flutter | BLoC | Hydrated BLoC

