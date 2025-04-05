import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/providers/theme_provider.dart';
import '../../core/providers/language_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          _buildSection(
            context,
            title: 'Appearance',
            children: [
              ListTile(
                title: const Text('Dark Mode'),
                trailing: Consumer<ThemeProvider>(
                  builder: (context, themeProvider, child) {
                    return Switch(
                      value: themeProvider.isDarkMode,
                      onChanged: (value) async {
                        await themeProvider.toggleTheme();
                      },
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          ),
          _buildSection(
            context,
            title: 'Language',
            children: [
              ListTile(
                title: const Text('English'),
                trailing: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Radio(
                      value: 'en',
                      groupValue: languageProvider.locale.languageCode,
                      onChanged: (value) async {
                        await languageProvider.setLanguage('en');
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text('Spanish'),
                trailing: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Radio(
                      value: 'es',
                      groupValue: languageProvider.locale.languageCode,
                      onChanged: (value) async {
                        await languageProvider.setLanguage('es');
                      },
                    );
                  },
                ),
              ),
              ListTile(
                title: const Text('French'),
                trailing: Consumer<LanguageProvider>(
                  builder: (context, languageProvider, child) {
                    return Radio(
                      value: 'fr',
                      groupValue: languageProvider.locale.languageCode,
                      onChanged: (value) async {
                        await languageProvider.setLanguage('fr');
                      },
                    );
                  },
                ),
              ),
              const Divider(),
            ],
          ),
          _buildSection(
            context,
            title: 'About',
            children: [
              ListTile(
                title: const Text('Version'),
                subtitle: const Text('1.0.0'),
              ),
              ListTile(
                title: const Text('Privacy Policy'),
                onTap: () {
                  // TODO: Navigate to privacy policy
                },
              ),
              ListTile(
                title: const Text('Terms of Service'),
                onTap: () {
                  // TODO: Navigate to terms of service
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ),
        ...children,
      ],
    );
  }
} 