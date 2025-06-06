# Dot AI - Flutter Chat UI Prototype

This repository showcases a **Flutter-based chat interface** designed to simulate user interactions
with an AI assistant. The focus is on **UI/UX design and input handling**, rather than implementing
a fully functional AI backend.

---

## 🎯 Project Overview

This project serves as a **UI prototype** inspired by an existing AI chat application. It aims to
replicate the look and feel of the original app's interface, without access to its design files. The
primary goal is to demonstrate:

- **Interactive chat interface** with voice and text input modes
- **Rich text rendering** for AI responses
- **Custom animations** and transitions
- **Minimalistic design system** tailored for the chat experience

<div style="display: flex; justify-content: center; gap: 10px;">
  <img src="https://github.com/sye-13/dot_ai_app/blob/main/screenshots/voice-mode.png?raw=true" width="45%" alt="chat screen with voice mode"/>
  <img src="https://github.com/sye-13/dot_ai_app/blob/main/screenshots/text-mode.png?raw=true" width="45%" alt="chat screen with text mode"/>
</div>

---

## ⚙️ Features

- **Dual Input Modes**: Toggle between voice and text input panels.
- **Dynamic TextField**: In text mode, the input field supports up to 5 visible lines. The voice input
  toggle disappears when the text input is focused.
- **Rich Text Rendering**: AI messages support Markdown formatting.
- **Simulated AI Responses**: Predefined AI responses to simulate conversation flow.
- **Minimal Design System**: Basic components like buttons, typography, and color schemes.
- **Typing Animation**: AI responses appear letter by letter, mimicking typing.
- **Custom Icons**: All icons are from [tabler.io](tabler.io/icons) and bundled within the app. A package is also available on [pub.dev](https://pub.dev/packages/flutter_tabler_icons).

---

## 🛠️ Technology Stack

- **Flutter**: Framework for building natively compiled applications.
- **Dart**: Programming language used for Flutter development.
- **Minimal External Packages**: To keep the project lightweight and focused on core
  functionalities.

---

## 🚀 Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- A compatible IDE (e.g., Visual Studio Code, Android Studio).

### Clone the Repository

```bash
git clone https://github.com/sye-13/dot_ai_app.git
cd dot_ai_app
```

## 🚀 Running the App

```bash
flutter pub get
```

Execute the following command to run the app:

```bash
flutter run
```

This command compiles and launches the app on the connected device or emulator.

## 🎬 Demo

![App Demo](screenshots/demo.mov)
