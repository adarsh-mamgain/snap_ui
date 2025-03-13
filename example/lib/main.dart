import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

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
          ],
        ),
      ),
    );
  }
}
