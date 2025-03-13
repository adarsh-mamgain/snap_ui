<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# SnapUI

A modern Flutter UI components library inspired by Tailwind CSS v4, designed for building beautiful and consistent mobile applications.

## Features

- 🎨 Modern and clean design system
- 🌙 Built-in light and dark theme support
- 📱 Mobile-first components
- 🎯 Easy to use and customize
- 🎭 Consistent styling across components
- 📦 Zero dependencies on other UI libraries

## Installation

Add SnapUI to your `pubspec.yaml`:

```yaml
dependencies:
  snap_ui: ^0.1.0
```

## Quick Start

1. Wrap your app with `SnapUiThemeProvider`:

```dart
void main() {
  runApp(
    SnapUiThemeProvider(
      theme: SnapUiTheme.lightTheme,
      child: MyApp(),
    ),
  );
}
```

2. Use SnapUI components:

```dart
SnapButton(
  onPressed: () {},
  child: Text('Click me'),
)
```

## Theme System

SnapUI provides a comprehensive theme system:

```dart
SnapUiThemeProvider(
  theme: SnapUiTheme(
    primaryColor: Colors.blue,
    secondaryColor: Colors.blueAccent,
    backgroundColor: Colors.white,
    textColor: Colors.black,
    borderColor: Colors.grey,
    shadowColor: Colors.black,
    typography: SnapThemeTypography.defaultTypography,
    spacing: SnapThemeSpacing.defaultSpacing,
    borderRadius: SnapThemeBorderRadius.defaultBorderRadius,
    shadows: SnapThemeShadows.defaultShadows,
  ),
  child: MyApp(),
)
```

## Components

### Buttons

- Primary Button
- Secondary Button
- Text Button
- Icon Button
- Outlined Button

### Input Fields

- Text Input
- Password Input
- Search Input
- Number Input
- Date Input

### Cards

- Basic Card
- Elevated Card
- Interactive Card
- List Card

### Navigation

- Bottom Navigation Bar
- Tab Bar
- App Bar
- Drawer

### Feedback

- Snackbar
- Toast
- Dialog
- Modal Bottom Sheet

### Layout

- Container
- Row
- Column
- Stack
- Grid

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
