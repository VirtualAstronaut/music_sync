# YT Sync

A powerful Flutter application for searching and streaming YouTube audio, built with a modern tech stack and type-safe state management.

## ✨ Features

- **Dynamic YouTube Search**: Search for videos by keywords or direct URLs using `youtube_explode_dart`.
- **Backend-Powered Extraction**: Seamless integration with a local API extractor for high-quality audio streaming.
- **Modern Audio Player**: Full-featured player with progress tracking, state handling, and play/pause controls using `just_audio`.
- **Type-Safe Navigation**: Declarative and type-safe routing powered by `go_router` and `go_router_builder`.
- **Robust State Machine**: Uses sealed classes (`SearchState`, `AudioPlayerState`) for clean, predictable UI states.

## 🏗️ Architecture

The project follows a **Feature-First** structure for modularity and scalability:

```text
lib/
├── src/
│   ├── app.dart                # Main App Widget (GoRouter integration)
│   ├── theme/                  # Theme definitions and providers
│   ├── routing/                # Typed navigation and route manifest
│   ├── utils/                  # Global utilities (Dio, YoutubeExplode)
│   └── features/               # Feature-based organization
│       ├── search/             # Video discovery logic
│       └── player/             # Audio playback engine
└── main.dart                   # Entry point (ProviderScope)
```

## 🛠️ Tech Stack

- **Framework**: [Flutter 3.38.5](https://flutter.dev)
- **State Management**: [Riverpod](https://riverpod.dev) (Generators & Notifiers).
- **Audio**: [just_audio](https://pub.dev/packages/just_audio) & [audio_session](https://pub.dev/packages/audio_session).
- **Networking**: [Dio](https://pub.dev/packages/dio) & [fpdart](https://pub.dev/packages/fpdart) (Functional Error Handling).
- **YouTube Client**: [youtube_explode_dart](https://pub.dev/packages/youtube_explode_dart).
- **Code Gen**: [Freezed](https://pub.dev/packages/freezed), [JSON Serializable](https://pub.dev/packages/json_serializable), [GoRouter Builder](https://pub.dev/packages/go_router_builder).

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: `3.38.5`
- **Backend**: A local API server running at `http://localhost:5011` for video metadata extraction.

### Installation

1. Clone the repository.
2. Run command:
   ```bash
   flutter pub get
   ```

### Running the App

1. Start your local extraction server.
2. Run code generation:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```
3. Launch the app:
   ```bash
   flutter run
   ```

## 📦 Deployment

The project includes a **GitHub Actions** workflow for automated deployment to GitHub Pages.

- **Config**: `.github/workflows/deploy.yml`
- **Manual Build**:
  ```bash
  flutter build web --base-href "/yt_sync/" --release
  ```

## 🧪 Development Rules

- **Sealed Classes**: Always use sealed classes for state definitions (`XState`).
- **Imports**: Use package imports where possible.
- **Linting**: Follow `flutter_lints` and specific `riverpod_lint` rules.
