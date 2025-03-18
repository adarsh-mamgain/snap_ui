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

A modern, customizable Flutter UI component library that provides a comprehensive set of pre-built components following Material Design principles.

## Features

- 🎨 Modern and clean design
- 🎯 Highly customizable components
- 📱 Responsive and adaptive
- 🎭 Dark mode support
- 🎨 Consistent theming system
- 📦 Zero dependencies on other UI libraries

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  snap_ui:
    git:
      url: https://github.com/yourusername/snap_ui.git
      ref: main
```

## Quick Start

```dart
import 'package:snap_ui/snap_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SnapUiThemeProvider(
      theme: SnapUiTheme.lightTheme,
      child: MaterialApp(
        home: Scaffold(
          body: SnapButton(
            onPressed: () {},
            child: const Text('Click me'),
          ),
        ),
      ),
    );
  }
}
```

## Components

### Basic Components

- Buttons
- Text Inputs
- Cards
- List Tiles
- Dialogs

### Advanced Components

- Chips
- Badges
- Avatars
- Progress Indicators
- Tooltips
- Dividers
- Accordions

## Theming

SnapUI provides a flexible theming system that allows you to customize the look and feel of all components:

```dart
final customTheme = SnapUiTheme(
  primaryColor: Colors.blue,
  secondaryColor: Colors.green,
  // ... other theme properties
);

SnapUiThemeProvider(
  theme: customTheme,
  child: MaterialApp(...),
)
```

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please file an issue on the GitHub repository.

## Star History

<a href="https://www.star-history.com/#adarsh-mamgain/snap_ui&Date">
 <picture>
   <source media="(prefers-color-scheme: dark)" srcset="https://api.star-history.com/svg?repos=adarsh-mamgain/snap_ui&type=Date&theme=dark" />
   <source media="(prefers-color-scheme: light)" srcset="https://api.star-history.com/svg?repos=adarsh-mamgain/snap_ui&type=Date" />
   <img alt="Star History Chart" src="https://api.star-history.com/svg?repos=adarsh-mamgain/snap_ui&type=Date" />
 </picture>
</a>
