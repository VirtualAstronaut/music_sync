# YT Sync

A Flutter application for synchronizing YouTube data, built with a simplified feature-first architecture and Riverpod.

## 🏗️ Architecture

The project follows a simplified feature-first structure to keep logic modular but easy to navigate:

```text
lib/
├── src/
│   ├── app.dart                # Main App Widget (MaterialApp, Theme)
│   ├── common_widgets/         # Reusable widgets across features
│   ├── constants/              # Global constants (colors, sizes, etc.)
│   ├── routing/                # App navigation and routing logic
│   ├── utils/                  # Helper functions and extensions
│   └── features/               # Feature-based organization
│       └── [feature_name]/
│           ├── view/           # Screens and UI components
│           ├── models/         # Data models and entities
│           └── providers/      # Riverpod providers and logic
└── main.dart                   # Entry point (ProviderScope)
```

## 🛠️ Tech Stack

- **State Management**: [Riverpod](https://riverpod.dev) with Generators.
- **Linting**: Strict lint rules using `riverpod_lint` and `custom_lint`.
- **Code Generation**: `build_runner` for generating providers.

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable)
- Dart SDK

### Installation
1. Clone the repository.
2. Run `flutter pub get`.

### Code Generation
Since we use Riverpod Generators, you need to run `build_runner`:

```bash
# One-time build
dart run build_runner build --delete-conflicting-outputs

# Watch mode (recommended during development)
dart run build_runner watch --delete-conflicting-outputs
```

## 🧪 Development

To add a new feature:
1. Create a new folder in `lib/src/features/`.
2. Add `view/`, `models/`, and `providers/` subfolders as needed.
3. Define your providers with `@riverpod` and include the `part` directive.
