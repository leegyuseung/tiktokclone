import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _notificationsChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile.adaptive(
            value: _notifications,
            onChanged: _notificationsChanged,
            title: const Text(
              'Enable notifications',
            ),
            subtitle: const Text(
              'They will be cute',
            ),
          ),
          CheckboxListTile(
            // checkColor: Colors.black,
            activeColor: Colors.black,
            value: _notifications,
            onChanged: _notificationsChanged,
            title: const Text(
              "Enable notifications",
            ),
            subtitle: const Text(
              'We won`t spam you',
            ),
          ),
          ListTile(
            onTap: () async {
              final date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
              );
              final time = await showTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              final booking = await showDateRangePicker(
                context: context,
                firstDate: DateTime(1980),
                lastDate: DateTime(2030),
                builder: (context, child) {
                  return Theme(
                    data: ThemeData(
                      appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
            },
            title: const Text(
              'What is your birthday?',
            ),
            subtitle: const Text('I need to know!'),
          ),
          ListTile(
            title: const Text('Log out (IOS)'),
            textColor: Colors.red,
            onTap: () {
              showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                  title: const Text(
                    'are you sure?',
                  ),
                  content: const Text(
                    'Plx dont go',
                  ),
                  actions: [
                    CupertinoDialogAction(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'No',
                      ),
                    ),
                    const CupertinoDialogAction(
                      child: Text(
                        "Yes",
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Log out (Android)'),
            textColor: Colors.red,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  icon: const FaIcon(
                    FontAwesomeIcons.skull,
                  ),
                  title: const Text(
                    'are you sure?',
                  ),
                  content: const Text(
                    'Plx dont go',
                  ),
                  actions: [
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const FaIcon(
                        FontAwesomeIcons.car,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'Yes',
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          const AboutListTile(
            applicationVersion: "1.0",
            applicationLegalese: "Don`t copy me.",
          )
        ],
      ),
    );
  }
}
