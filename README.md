 **# Masala Headlines News App**

** A Flutter application that fetches and displays top news headlines in India.**

## ⚡️ Features

- Fetches top news headlines from India using the News API (https://newsapi.org/)
- Clean and user-friendly interface for browsing news articles
- State management using Provider for efficient data handling

##  Getting Started

### Prerequisites

- Flutter SDK: (https://flutter.dev/docs/get-started/install)
- Android Studio (for Android development): (https://developer.android.com/studio)
- Xcode (for iOS development): (https://developer.apple.com/xcode/)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/news-app.git
   ```
2. Navigate to the project directory:
   ```bash
   cd news-app
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```

### API Key

1. Obtain a free API key from News API: [https://newsapi.org/](https://newsapi.org/)
2. Open the `services` directory in the `lib` directory.
3. Open a file named `news_data.dart` in the `services` directory.
4. Add your API key to the variable `apiKey`, replacing the default API key:
   ```dart
   final apiKey = 'YOUR_API_KEY';
   ```

### Running the App

1. Connect an Android device or start an emulator.
2. Run the app:
   ```bash
   flutter run
   ```

##  Built With

- Flutter
- Provider (state management)
- News API ([https://newsapi.org/](https://newsapi.org/))
