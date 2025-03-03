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

# SnapUI for Flutter

SnapUI is a Flutter UI component library that provides a set of beautiful, customizable components with a theming system inspired by Tailwind CSS.

## Features

- 🎨 **Tailwind CSS-inspired theming**: Use familiar color palettes and spacing values from Tailwind CSS
- 🔄 **Extendable themes**: Create custom themes or extend the default ones
- 🧩 **Reusable components**: A growing collection of UI components
- 📱 **Flutter-native**: Built specifically for Flutter applications
- 🔄 **Tailwind CSS class conversion**: Convert Tailwind CSS class names to Flutter values

## Installation

Add SnapUI to your `pubspec.yaml` file:

```yaml
dependencies:
  snap_ui: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Usage

Wrap your app with the `SnapUiThemeProvider` to provide a theme to all components:

```dart
import 'package:flutter/material.dart';
import 'package:snap_ui/snap_ui.dart';

void main() {
  runApp(
    SnapUiThemeProvider(
      theme: SnapUiTheme.lightTheme, // Use the default light theme
      child: MyApp(),
    ),
  );
}
```

### Using Components

Once you've set up the theme provider, you can use SnapUI components throughout your app:

```dart
import 'package:flutter/material.dart';
import 'package:snap_ui/snap_ui.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnapUI Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SnapCard(
              child: Text('This is a card'),
            ),
            SizedBox(height: 16),
            SnapButton(
              onPressed: () {
                print('Button pressed!');
              },
              child: Text('Click me'),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Theming

### Using the Default Themes

SnapUI comes with two default themes:

- `SnapUiTheme.lightTheme`: A light theme with blue as the primary color
- `SnapUiTheme.darkTheme`: A dark theme with blue as the primary color

### Creating a Custom Theme

You can create a custom theme in two ways:

#### 1. Using the `custom` factory method:

```dart
final myTheme = SnapUiTheme.custom(
  primaryColor: TailwindColors.purple[600],
  secondaryColor: TailwindColors.purple[100],
  backgroundColor: TailwindColors.gray[50],
  borderRadius: TailwindBorderRadius.xl2,
);
```

#### 2. Creating a completely custom theme:

```dart
final myTheme = SnapUiTheme(
  primaryColor: TailwindColors.red[500]!,
  secondaryColor: TailwindColors.red[900]!,
  backgroundColor: TailwindColors.gray[900]!,
  textColor: TailwindColors.gray[100]!,
  borderColor: TailwindColors.red[800]!,
  shadowColor: Colors.black.withOpacity(0.5),
  padding: EdgeInsets.all(TailwindSpacing.xl2),
  margin: EdgeInsets.all(TailwindSpacing.xl),
  borderRadius: TailwindBorderRadius.lg,
  border: Border.all(color: TailwindColors.red[800]!),
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(0, 4),
      blurRadius: 8,
      spreadRadius: 0,
    ),
  ],
);
```

#### 3. Using Tailwind CSS class names:

```dart
final myTheme = TailwindUtils.themeFromTailwindClasses(
  primaryColorClass: 'bg-green-600',
  secondaryColorClass: 'bg-green-100',
  backgroundColorClass: 'bg-gray-50',
  textColorClass: 'text-gray-900',
  borderColorClass: 'border-green-200',
  borderRadiusClass: 'rounded-xl',
  paddingClass: 'p-6',
);
```

### Tailwind CSS Colors

SnapUI includes all Tailwind CSS color palettes as Flutter colors:

```dart
// Using Tailwind colors
final primaryColor = TailwindColors.blue[500]; // Blue 500
final secondaryColor = TailwindColors.gray[200]; // Gray 200
```

Available color palettes:
- `slate`
- `gray`
- `zinc`
- `red`
- `orange`
- `amber`
- `green`
- `blue`
- `indigo`
- `purple`
- `pink`

Each palette includes shades from 50 to 950.

### Tailwind CSS Spacing

SnapUI includes Tailwind CSS spacing values:

```dart
// Using Tailwind spacing
final padding = EdgeInsets.all(TailwindSpacing.xl);
final margin = EdgeInsets.symmetric(
  horizontal: TailwindSpacing.xl2,
  vertical: TailwindSpacing.xl,
);
```

### Tailwind CSS Border Radius

SnapUI includes Tailwind CSS border radius values:

```dart
// Using Tailwind border radius
final borderRadius = TailwindBorderRadius.lg;
```

### Tailwind CSS Class Conversion

SnapUI includes a utility class to convert Tailwind CSS class names to Flutter values:

```dart
// Convert a Tailwind CSS color class name to a Flutter color
final color = TailwindUtils.colorFromTailwindClass('bg-red-500');

// Convert a Tailwind CSS spacing class name to a Flutter EdgeInsets
final padding = TailwindUtils.paddingFromTailwindClass('p-4');

// Convert a Tailwind CSS border radius class name to a Flutter BorderRadius
final borderRadius = TailwindUtils.borderRadiusFromTailwindClass('rounded-lg');
```

## Components

SnapUI includes the following components:

### Buttons

- `SnapButton`: Base button component
- `SnapPrimaryButton`: Button with primary color
- `SnapSecondaryButton`: Button with secondary color
- `SnapTextButton`: Text-only button

### Cards

- `SnapCard`: Base card component
- `SnapElevatedCard`: Card with elevated appearance
- `SnapFlatCard`: Card with no border or shadow

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
