/// SnapUI - A modern Flutter component library
///
/// SnapUI provides a collection of beautiful, customizable components that follow
/// modern design principles and best practices. The library is designed to be
/// easy to use while maintaining flexibility and extensibility.
///
/// ## Getting Started
///
/// Add SnapUI to your `pubspec.yaml`:
///
/// ```yaml
/// dependencies:
///   snap_ui: ^1.0.0-beta
/// ```
///
/// Import the package:
///
/// ```dart
/// import 'package:snap_ui/snap_ui.dart';
/// ```
///
/// ## Components
///
/// SnapUI includes the following components:
///
/// * [SnapButton] - Customizable buttons with various styles and states
/// * [SnapCard] - Flexible card containers with interactive states
/// * [SnapInput] - Form input fields with validation support
/// * [SnapList] - List components with various layouts
/// * [SnapDialog] - Modal dialogs and popups
/// * [SnapChip] - Compact elements for tags and filters
/// * [SnapBadge] - Small status indicators
/// * [SnapAvatar] - User avatar components
/// * [SnapProgress] - Progress indicators
/// * [SnapTooltip] - Hover tooltips
/// * [SnapDivider] - Visual separators
/// * [SnapAccordion] - Expandable content sections
///
/// ## Theming
///
/// SnapUI uses a theme-based approach for consistent styling. You can customize
/// the appearance of all components by providing a [SnapUiTheme].
///
/// Example:
/// ```dart
/// SnapUiThemeProvider(
///   theme: SnapUiTheme(
///     primaryColor: Colors.blue,
///     // ... other theme properties
///   ),
///   child: MyApp(),
/// )
/// ```
///
/// ## Contributing
///
/// We welcome contributions! Please see our [GitHub repository](https://github.com/adarsh-mamgain/snap_ui)
/// for more information.
library;

// Export configuration
export 'src/config/snap_config.dart';
export 'src/config/snap_constants.dart';

// Export themes
export 'src/themes/theme.dart';

// Export components
export 'src/components/buttons/buttons.dart';
export 'src/components/inputs/inputs.dart';
export 'src/components/cards/cards.dart';
export 'src/components/lists/lists.dart';
export 'src/components/dialogs/dialogs.dart';
export 'src/components/chips/chips.dart';
export 'src/components/badges/badges.dart';
export 'src/components/avatars/avatars.dart';
export 'src/components/progress/progress.dart';
export 'src/components/tooltips/tooltips.dart';
export 'src/components/dividers/dividers.dart';
export 'src/components/accordions/accordions.dart';
