# 📰 Flutter News App

A Flutter application that displays the latest news articles using the **Clean Architecture** approach and **SOLID** principles.

The app fetches news from a public API and displays them in a list view with titles, thumbnails, and publish dates. Clicking on an article opens a detailed page showing the full content and a link to the original source.

---

## 📂 Folder Structure

lib/
├── core/                # Shared helpers, constants, and utilities
├── data/                # Data layer: API services, DTOs, repository implementations
│    ├── models/         # Data Transfer Objects (DTOs)
│    ├── repositories/   # Concrete repository classes
│    └── services/       # API client (singleton)
├── domain/              # Domain layer: entities, repository interfaces, and use cases
│    ├── entities/       # Core app models
│    ├── repositories/   # Abstract repository definitions
│    └── usecases/       # Application-specific business logic
├── presentation/        # UI layer
│    ├── pages/          # Screens for list view and details view
│    ├── widgets/        # Reusable UI components
│    └── state/          # State management (Bloc/Provider)
└── main.dart            # App entry point

## 🛠 How SOLID and Clean Architecture Were Applied

### SOLID Principles

- **Single Responsibility (S)**  
  Each class handles one responsibility. Example:
    - `NewsApiService` → Handles API calls only.
    - `NewsRepositoryImpl` → Manages data retrieval logic.
    - `HomePage` → Handles only UI rendering.

- **Open/Closed (O)**  
  Adding a new data source (e.g., local database) doesn’t require changing existing classes just create a new implementation of `NewsRepository`.
  —j
- **Liskov Substitution (L)**  
  Any implementation of `NewsRepository` can replace another without breaking the app.

- **Interface Segregation (I)**  
  Interfaces like `NewsRepository` are small and focused.

- **Dependency Inversion (D)**  
  The presentation layer depends on abstract `NewsRepository` instead of a concrete API implementation.

---

## 🏗 Clean Architecture

- **Domain Layer**
    - Core business logic: Entities (`Article`), Use Cases (`GetNewsArticles`), Repository interfaces.
- **Data Layer**
    - Handles fetching data from the API, mapping JSON to models, and implementing the repository interface.
- **Presentation Layer**
    - Contains UI pages, widgets, and state management. Fully decoupled from the data source.


