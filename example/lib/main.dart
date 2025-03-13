import 'package:flutter/material.dart';
import 'package:snap_ui/snap_ui.dart';
import 'package:snap_ui/src/themes/theme.dart';
import 'package:snap_ui/src/components/buttons/buttons.dart';
import 'package:snap_ui/src/components/inputs/inputs.dart';
import 'package:snap_ui/src/components/cards/cards.dart';
import 'package:snap_ui/src/components/lists/lists.dart';
import 'package:snap_ui/src/components/dialogs/dialogs.dart';

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
        title: 'SnapUI Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SnapUI Components',
          style: theme.typography.titleLarge,
        ),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: theme.spacing.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Typography Section
            Container(
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Typography Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),

                  // Display styles
                  Text(
                    'Display Large',
                    style: theme.typography.displayLarge,
                  ),
                  SizedBox(height: theme.spacing.four),
                  Text(
                    'Display Medium',
                    style: theme.typography.displayMedium,
                  ),
                  SizedBox(height: theme.spacing.four),
                  Text(
                    'Display Small',
                    style: theme.typography.displaySmall,
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Headline styles
                  Text(
                    'Headline Large',
                    style: theme.typography.headlineLarge,
                  ),
                  SizedBox(height: theme.spacing.four),
                  Text(
                    'Headline Medium',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.four),
                  Text(
                    'Headline Small',
                    style: theme.typography.headlineSmall,
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Title styles
                  Text(
                    'Title Large',
                    style: theme.typography.titleLarge,
                  ),
                  SizedBox(height: theme.spacing.three),
                  Text(
                    'Title Medium',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.three),
                  Text(
                    'Title Small',
                    style: theme.typography.titleSmall,
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Body styles
                  Text(
                    'Body Large',
                    style: theme.typography.bodyLarge,
                  ),
                  SizedBox(height: theme.spacing.two),
                  Text(
                    'Body Medium',
                    style: theme.typography.bodyMedium,
                  ),
                  SizedBox(height: theme.spacing.two),
                  Text(
                    'Body Small',
                    style: theme.typography.bodySmall,
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Label styles
                  Text(
                    'Label Large',
                    style: theme.typography.labelLarge,
                  ),
                  SizedBox(height: theme.spacing.two),
                  Text(
                    'Label Medium',
                    style: theme.typography.labelMedium,
                  ),
                  SizedBox(height: theme.spacing.two),
                  Text(
                    'Label Small',
                    style: theme.typography.labelSmall,
                  ),
                ],
              ),
            ),

            // Spacing section
            SizedBox(height: theme.spacing.twelve),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spacing Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Container(
                    padding: theme.spacing.all(4),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: theme.borderRadius.md,
                    ),
                    child: Text('Padding: 4 units'),
                  ),
                  SizedBox(height: theme.spacing.six),
                  Container(
                    padding: theme.spacing.all(8),
                    decoration: BoxDecoration(
                      color: theme.primaryColor.withOpacity(0.1),
                      borderRadius: theme.borderRadius.md,
                    ),
                    child: Text('Padding: 8 units'),
                  ),
                ],
              ),
            ),

            // Border Radius section
            SizedBox(height: theme.spacing.twelve),
            Container(
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Border Radius Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: theme.borderRadius.sm,
                        ),
                        child: Center(child: Text('sm')),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: theme.borderRadius.md,
                        ),
                        child: Center(child: Text('md')),
                      ),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: theme.primaryColor.withOpacity(0.1),
                          borderRadius: theme.borderRadius.lg,
                        ),
                        child: Center(child: Text('lg')),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Shadow section
            SizedBox(height: theme.spacing.twelve),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shadow Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Container(
                    padding: theme.spacing.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: theme.borderRadius.md,
                      boxShadow: theme.shadows.sm,
                    ),
                    child: Text('Small Shadow'),
                  ),
                  SizedBox(height: theme.spacing.sixtyFour),
                  Container(
                    padding: theme.spacing.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: theme.borderRadius.md,
                      boxShadow: theme.shadows.md,
                    ),
                    child: Text('Medium Shadow'),
                  ),
                  SizedBox(height: theme.spacing.sixtyFour),
                  Container(
                    padding: theme.spacing.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: theme.borderRadius.md,
                      boxShadow: theme.shadows.lg,
                    ),
                    child: Text('Large Shadow'),
                  ),
                ],
              ),
            ),

            // Button section
            SizedBox(height: theme.spacing.twentyFour),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Button Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Primary Buttons
                  Text(
                    'Primary Buttons',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    children: [
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Small'),
                        size: ButtonSize.small,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Medium'),
                        size: ButtonSize.medium,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Large'),
                        size: ButtonSize.large,
                      ),
                    ],
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Secondary Buttons
                  Text(
                    'Secondary Buttons',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    children: [
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Small'),
                        variant: ButtonVariant.secondary,
                        size: ButtonSize.small,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Medium'),
                        variant: ButtonVariant.secondary,
                        size: ButtonSize.medium,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Large'),
                        variant: ButtonVariant.secondary,
                        size: ButtonSize.large,
                      ),
                    ],
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Outlined Buttons
                  Text(
                    'Outlined Buttons',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    children: [
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Small'),
                        variant: ButtonVariant.outlined,
                        size: ButtonSize.small,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Medium'),
                        variant: ButtonVariant.outlined,
                        size: ButtonSize.medium,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Large'),
                        variant: ButtonVariant.outlined,
                        size: ButtonSize.large,
                      ),
                    ],
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Text Buttons
                  Text(
                    'Text Buttons',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    children: [
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Small'),
                        variant: ButtonVariant.text,
                        size: ButtonSize.small,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Medium'),
                        variant: ButtonVariant.text,
                        size: ButtonSize.medium,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Large'),
                        variant: ButtonVariant.text,
                        size: ButtonSize.large,
                      ),
                    ],
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // States
                  Text(
                    'Button States',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  Row(
                    children: [
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Normal'),
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Disabled'),
                        isDisabled: true,
                      ),
                      SizedBox(width: theme.spacing.six),
                      SnapButton(
                        onPressed: () {},
                        child: const Text('Loading'),
                        isLoading: true,
                      ),
                    ],
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Full Width
                  Text(
                    'Full Width Button',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapButton(
                    onPressed: () {},
                    child: const Text('Full Width Button'),
                    isFullWidth: true,
                  ),
                ],
              ),
            ),

            // Text Input section
            SizedBox(height: theme.spacing.twentyFour),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Text Input Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Basic Inputs
                  Text(
                    'Basic Inputs',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Label',
                    hint: 'Placeholder text',
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Required Input',
                    hint: 'This field is required',
                    isRequired: true,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Disabled Input',
                    hint: 'This input is disabled',
                    isDisabled: true,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Input Variants
                  Text(
                    'Input Variants',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Outlined Input',
                    hint: 'Default outlined style',
                    variant: InputVariant.outlined,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Filled Input',
                    hint: 'Filled style input',
                    variant: InputVariant.filled,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Input Sizes
                  Text(
                    'Input Sizes',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Small Input',
                    hint: 'Small size input',
                    size: InputSize.small,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Medium Input',
                    hint: 'Medium size input (default)',
                    size: InputSize.medium,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Large Input',
                    hint: 'Large size input',
                    size: InputSize.large,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Input States
                  Text(
                    'Input States',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Error Input',
                    hint: 'This input has an error',
                    error: 'This field is required',
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Helper Text Input',
                    hint: 'This input has helper text',
                    helper: 'This is a helper message',
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Input Types
                  Text(
                    'Input Types',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Password Input',
                    hint: 'Enter your password',
                    isPassword: true,
                    suffix: IconButton(
                      icon: const Icon(Icons.visibility),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Email Input',
                    hint: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Phone Input',
                    hint: 'Enter your phone number',
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Input with Icons
                  Text(
                    'Input with Icons',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Search Input',
                    hint: 'Search...',
                    prefix: const Icon(Icons.search),
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'User Input',
                    hint: 'Enter username',
                    prefix: const Icon(Icons.person),
                    suffix: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Multiline Input
                  Text(
                    'Multiline Input',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapTextInput(
                    label: 'Text Area',
                    hint: 'Enter multiple lines of text',
                    maxLines: 3,
                    minLines: 3,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapTextInput(
                    label: 'Character Limited Input',
                    hint: 'Enter text (max 100 characters)',
                    maxLength: 100,
                    showCounter: true,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Number Input
                  Text(
                    'Number Input',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapNumberInput(
                    label: 'Integer Input',
                    hint: 'Enter a whole number',
                    allowDecimal: false,
                    allowNegative: false,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapNumberInput(
                    label: 'Decimal Input',
                    hint: 'Enter a decimal number',
                    allowDecimal: true,
                    decimalPlaces: 2,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapNumberInput(
                    label: 'Negative Numbers',
                    hint: 'Enter a negative number',
                    allowNegative: true,
                    allowDecimal: false,
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapNumberInput(
                    label: 'Range Input',
                    hint: 'Enter a number between 0 and 100',
                    min: 0,
                    max: 100,
                    step: 1,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Search Input
                  Text(
                    'Search Input',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapSearchInput(
                    label: 'Basic Search',
                    searchHint: 'Search items...',
                    onSearch: (value) {
                      // Handle search
                    },
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapSearchInput(
                    label: 'Custom Search',
                    searchHint: 'Search with custom icon',
                    showSearchIcon: false,
                    prefix: const Icon(Icons.search),
                    variant: InputVariant.filled,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Date Input
                  Text(
                    'Date Input',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapDateInput(
                    label: 'Basic Date Picker',
                    hint: 'Select a date',
                    onDateSelected: (date) {
                      // Handle date selection
                    },
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapDateInput(
                    label: 'Date Range Picker',
                    hint: 'Select date between 2020 and 2030',
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                    initialDate: DateTime.now(),
                    dateFormat: 'dd/MM/yyyy',
                  ),
                  SizedBox(height: theme.spacing.six),
                  SnapDateInput(
                    label: 'Disabled Date Picker',
                    hint: 'This date picker is disabled',
                    isDisabled: true,
                    showCalendarIcon: false,
                  ),
                ],
              ),
            ),

            // Card section
            SizedBox(height: theme.spacing.twentyFour),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Basic Card
                  Text(
                    'Basic Card',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapCard(
                    child: Text('This is a basic card with default styling'),
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Interactive Card
                  Text(
                    'Interactive Card',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapCard(
                    isInteractive: true,
                    onTap: () {},
                    child: Text('Tap me!'),
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Custom Card
                  Text(
                    'Custom Card',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapCard(
                    backgroundColor: theme.primaryColor.withOpacity(0.1),
                    padding: theme.spacing.all(8),
                    margin: theme.spacing.all(2),
                    elevation: 8,
                    borderRadius: theme.borderRadius.xl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Custom Styled Card',
                          style: theme.typography.titleMedium,
                        ),
                        SizedBox(height: theme.spacing.four),
                        Text(
                          'This card has custom padding, margin, elevation, and border radius.',
                          style: theme.typography.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // List Tile section
            SizedBox(height: theme.spacing.twentyFour),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List Tile Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Basic List Tile
                  Text(
                    'Basic List Tile',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapListTile(
                    leading: const Icon(Icons.person),
                    title: Text('John Doe'),
                    subtitle: Text('Software Engineer'),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Interactive List Tile
                  Text(
                    'Interactive List Tile',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapListTile(
                    leading: const Icon(Icons.settings),
                    title: Text('Settings'),
                    subtitle: Text('App configuration'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  SizedBox(height: theme.spacing.six),

                  // Custom List Tile
                  Text(
                    'Custom List Tile',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapListTile(
                    leading: CircleAvatar(
                      backgroundColor: theme.primaryColor,
                      child:
                          const Icon(Icons.notifications, color: Colors.white),
                    ),
                    title: Text(
                      'Notifications',
                      style: theme.typography.titleMedium,
                    ),
                    subtitle: Text(
                      'Manage your notification preferences',
                      style: theme.typography.bodyMedium,
                    ),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                      activeColor: theme.primaryColor,
                    ),
                    showDivider: false,
                    backgroundColor: theme.primaryColor.withOpacity(0.05),
                  ),
                ],
              ),
            ),

            // Dialog section
            SizedBox(height: theme.spacing.twentyFour),
            Container(
              width: double.infinity,
              padding: theme.spacing.all(6),
              decoration: BoxDecoration(
                color: theme.primaryColor.withOpacity(0.05),
                borderRadius: theme.borderRadius.lg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dialog Examples',
                    style: theme.typography.headlineMedium,
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Basic Dialog
                  Text(
                    'Basic Dialog',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SnapDialog(
                          title: Text(
                            'Basic Dialog',
                            style: theme.typography.titleLarge,
                          ),
                          content: Text(
                            'This is a basic dialog with a title and content.',
                            style: theme.typography.bodyMedium,
                          ),
                          actions: [
                            SnapButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            SizedBox(width: theme.spacing.four),
                            SnapButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Confirm'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show Basic Dialog'),
                  ),
                  SizedBox(height: theme.spacing.sixteen),

                  // Custom Dialog
                  Text(
                    'Custom Dialog',
                    style: theme.typography.titleMedium,
                  ),
                  SizedBox(height: theme.spacing.eight),
                  SnapButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SnapDialog(
                          title: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: theme.primaryColor,
                              ),
                              SizedBox(width: theme.spacing.four),
                              Text(
                                'Custom Dialog',
                                style: theme.typography.titleLarge,
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'This is a custom dialog with:',
                                style: theme.typography.bodyMedium,
                              ),
                              SizedBox(height: theme.spacing.four),
                              SnapListTile(
                                leading: const Icon(Icons.check_circle),
                                title: Text('Custom title with icon'),
                                showDivider: false,
                              ),
                              SnapListTile(
                                leading: const Icon(Icons.check_circle),
                                title: Text('Custom content layout'),
                                showDivider: false,
                              ),
                              SnapListTile(
                                leading: const Icon(Icons.check_circle),
                                title: Text('Custom action buttons'),
                                showDivider: false,
                              ),
                            ],
                          ),
                          actions: [
                            SnapButton(
                              onPressed: () => Navigator.pop(context),
                              variant: ButtonVariant.text,
                              child: const Text('Cancel'),
                            ),
                            SizedBox(width: theme.spacing.four),
                            SnapButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Save Changes'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text('Show Custom Dialog'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
