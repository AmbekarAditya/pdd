# PDD App

Pre-Departure Detention (PDD) data collection and analysis app for Indian Railways.
Built with Flutter, Riverpod, and a Clean Architecture (Antigravity) approach.

## Getting Started

### Prerequisites
- Flutter SDK (Beta channel, as per current configuration)
- Android Studio or VS Code

### How to Run

#### Option 1: Via Android Studio
1. Open the project in Android Studio.
2. Select a device from the device dropdown in the toolbar (e.g., "macOS" or an Android Emulator).
3. Click the **Run** (green play) button.

#### Option 2: Via Terminal
To run on your Mac (Desktop):
```bash
flutter run -d macos
```

To run on Chrome:
```bash
flutter run -d chrome
```

### Project Structure
- `lib/features`: Contains all feature-specific code (UI, Logic, Data).
- `lib/core`: Shared utilities, theme, and constants.
- `lib/main.dart`: App entry point.
