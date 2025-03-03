import 'package:flutter/material.dart';
import 'package:snap_ui/src/components/button.dart';
import 'package:snap_ui/src/components/card.dart';
import 'package:snap_ui/src/themes/theme.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a custom theme based on Tailwind CSS colors
    final customTheme = SnapUiTheme.custom(
      primaryColor: TailwindColors.purple[600],
      secondaryColor: TailwindColors.purple[100],
      backgroundColor: TailwindColors.gray[50],
      textColor: TailwindColors.gray[900],
      borderColor: TailwindColors.purple[200],
      borderRadius: TailwindBorderRadius.xl2,
    );

    return SnapUiThemeProvider(
      theme: customTheme,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('SnapUI Theme Example'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Default card with theme
                  SnapCard(
                    child: Column(
                      children: [
                        Text(
                          'This is a card with the custom theme',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'The theme is using Tailwind CSS colors and can be customized',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // Elevated card
                  SnapElevatedCard(
                    child: Column(
                      children: [
                        Text(
                          'This is an elevated card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'It has a different shadow effect',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24),
                  
                  // Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SnapPrimaryButton(
                        onPressed: () {},
                        child: Text('Primary'),
                      ),
                      SnapSecondaryButton(
                        onPressed: () {},
                        child: Text('Secondary'),
                      ),
                      SnapTextButton(
                        onPressed: () {},
                        child: Text('Text Button'),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  
                  // Example of overriding theme for a specific component
                  SnapCard(
                    backgroundColor: TailwindColors.amber[100],
                    borderRadius: TailwindBorderRadius.xl3,
                    padding: EdgeInsets.all(TailwindSpacing.xl3),
                    child: Column(
                      children: [
                        Text(
                          'This card overrides the theme',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: TailwindColors.amber[800],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          'You can override specific properties for individual components',
                          style: TextStyle(
                            color: TailwindColors.amber[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Example of creating a completely custom theme
class CustomThemeExample extends StatelessWidget {
  const CustomThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a completely custom theme
    final darkTheme = SnapUiTheme(
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

    return SnapUiThemeProvider(
      theme: darkTheme,
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Custom Dark Theme Example'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SnapCard(
                    child: Text(
                      'This is a completely custom dark theme',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  SnapPrimaryButton(
                    onPressed: () {},
                    child: Text('Custom Button'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
} 