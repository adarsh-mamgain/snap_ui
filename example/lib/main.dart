import 'package:flutter/material.dart';
import 'package:snap_ui/snap_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SnapUI Demo',
      home: MyHomePage(title: 'SnapUI Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SnapUiTheme _currentTheme = SnapUiTheme.lightTheme;
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
      _currentTheme =
          _isDarkMode ? SnapUiTheme.darkTheme : SnapUiTheme.lightTheme;
    });
  }

  void _showCustomThemeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TailwindColors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text('Custom Theme Example'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This dialog demonstrates a custom theme'),
              const SizedBox(height: 16),
              SnapCard(
                theme: SnapUiTheme.custom(
                  primaryColor: TailwindColors.purple[600],
                  secondaryColor: TailwindColors.purple[100],
                  backgroundColor: TailwindColors.gray[50],
                  borderRadius: TailwindBorderRadius.xl2,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Custom themed card'),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showTailwindUtilsDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TailwindColors.white,
        surfaceTintColor: Colors.transparent,
        title: const Text('Tailwind Utils Example'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('This dialog demonstrates the TailwindUtils class'),
              const SizedBox(height: 16),
              SnapCard(
                theme: TailwindUtils.themeFromTailwindClasses(
                  primaryColorClass: 'bg-green-600',
                  secondaryColorClass: 'bg-green-100',
                  backgroundColorClass: 'bg-gray-50',
                  textColorClass: 'text-gray-900',
                  borderColorClass: 'border-green-200',
                  borderRadiusClass: 'rounded-xl',
                  paddingClass: 'p-2',
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'Theme from Tailwind Classes',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This card uses a theme created from Tailwind CSS class names',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: TailwindUtils.paddingFromTailwindClass('p-2'),
                        decoration: BoxDecoration(
                          color: TailwindUtils.colorFromTailwindClass(
                              'bg-green-800'),
                          borderRadius:
                              TailwindUtils.borderRadiusFromTailwindClass(
                                  'rounded-lg'),
                        ),
                        child: const Text('Container with Tailwind classes'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SnapUiThemeProvider(
      theme: _currentTheme,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
              onPressed: _toggleTheme,
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SnapCard(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'SnapUI Card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This card uses the current theme: ${_isDarkMode ? "Dark" : "Light"}',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                SnapElevatedCard(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'SnapUI Elevated Card',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'This card has elevation',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
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
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SnapTextButton(
                      onPressed: _showCustomThemeDialog,
                      child: Text('Custom Theme'),
                    ),
                    SnapTextButton(
                      onPressed: _showTailwindUtilsDialog,
                      child: Text('Tailwind Utils'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
