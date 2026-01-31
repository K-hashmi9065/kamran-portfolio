# Portfolio - Kamran Hashmi

Welcome to my personal portfolio! This Flutter-based cross-platform application showcases my projects, skills, and experience as a mobile app developer. It is designed to run seamlessly on Android, iOS, the Web, and Windows, featuring a responsive and modern UI.

## 🚀 Overview

This portfolio serves as a central hub to demonstrate my expertise in Flutter development. It includes sections for my professional background, showcased projects with image galleries, technical skills, and ways to contact me. The app emphasizes clean architecture, responsive design, and smooth animations.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **State Management**: [Riverpod](https://riverpod.dev/)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router)
- **UI & Styling**:
  - Custom Themes (Light & Dark Mode support ready)
  - [Flutter ScreenUtil](https://pub.dev/packages/flutter_screenutil) for responsiveness
  - [FontAwesome](https://pub.dev/packages/font_awesome_flutter) for icons
  - [Flutter Animate](https://pub.dev/packages/flutter_animate) for UI transitions
- **Architecture**: Clean Architecture (Feature-first structure)

## ✨ Features

- **Responsive Design**: Optimized for Mobile, Tablet, and Desktop screens.
- **Dynamic Navigation**: Smooth routing with GoRouter.
- **Project Showcase**:
  - Interactive carousel for project screenshots.
  - **Full-Screen Image Viewer**: Zoomable image gallery for detailed views.
  - Direct links to GitHub repositories for each project.
- **Skills & Experience**: vividly presented using Chips and Timelines.
- **Animations**: Engaging entry animations for a polished user experience.
- **Premium UI**: Custom "Premium Blue" gradient themes and glassmorphism effects.

## 📂 Project Structure

The project follows a scalable **Feature-based** folder structure:

```
lib/
├── core/                   # Core utilities, constants, theme, and shared widgets
│   ├── constants/
│   ├── router/
│   ├── theme/
│   └── widgets/            # Reusable widgets (MainLayout, FullScreenImageViewer)
├── features/               # distinct features (About, Home, Projects, Skills, etc.)
│   ├── about/
│   ├── experience/
│   ├── home/
│   ├── projects/
│   │   ├── domain/         # Entities
│   │   ├── presentation/   # Pages & Providers (Riverpod)
│   └── skills/
├── main.dart               # Entry point
```

## 📸 Screenshots

|        Home        |        Projects        |        Skills        |
| :----------------: | :--------------------: | :------------------: |
| _(Add Home Image)_ | _(Add Projects Image)_ | _(Add Skills Image)_ |

## 🚀 Getting Started

Follow these steps to run the project locally.

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
- An IDE (VS Code, Android Studio) with Flutter extensions.

### Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/K-hashmi9065/portfolio_mkh.git
    cd portfolio_mkh
    ```

2.  **Install dependencies:**

    ```bash
    flutter pub get
    ```

3.  **Run the app:**

    ```bash
    # For Chrome (Web)
    flutter run -d chrome

    # For Windows
    flutter run -d windows

    # For Android
    flutter run -d <device_id>
    ```

## 📬 Contact

Feel free to reach out to me!

- **Email**: kamranhashmi9065@gmail.com
- **GitHub**: [K-hashmi9065](github.com/K-hashmi9065)
- **LinkedIn**: [Kamran Hashmi](linkedin.com/in/k-hashmi9065)

---

_Built with 💙 using Flutter._
