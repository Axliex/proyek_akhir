import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/currency_dropdown.dart';
import 'component/setting_app_bar.dart';
import 'component/time_zone_dropdown.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  String? _selectedCurrency = 'Rupiah';
  String? _selectedTimeZone = 'UTC+7:00 Jogja';

  Future<void> _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedTimeZone', _selectedTimeZone!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar( // gunakan SettingAppBar di sini
        onPressed: () {
          _savePreferences();
          Navigator.of(context).pop();
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CurrencyDropdown(
              selectedCurrency: _selectedCurrency,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCurrency = newValue;
                });
              },
            ),
            SizedBox(height: 24),
            TimeZoneDropdown(
              selectedTimeZone: _selectedTimeZone,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTimeZone = newValue;
                });
              },
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple,
    );
  }
}