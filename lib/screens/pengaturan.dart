import 'package:flutter/material.dart';

class PengaturanScreen extends StatefulWidget {
  const PengaturanScreen({Key? key}) : super(key: key);

  @override
  _PengaturanScreenState createState() => _PengaturanScreenState();
}

class _PengaturanScreenState extends State<PengaturanScreen> {
  bool _darkMode = false;
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Pengaturan Tema
            ListTile(
              title: const Text('Tema Gelap'),
              trailing: Switch(
                value: _darkMode,
                onChanged: (bool value) {
                  setState(() {
                    _darkMode = value;
                  });
                },
              ),
              onTap: () {
                setState(() {
                  _darkMode = !_darkMode;
                });
              },
            ),

            const Divider(),

            // Pengaturan Bahasa
            ListTile(
              title: const Text('Bahasa'),
              subtitle: Text(_selectedLanguage),
              onTap: () async {
                String? newLanguage = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Pilih Bahasa'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'English');
                          },
                          child: const Text('English'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context, 'Indonesia');
                          },
                          child: const Text('Indonesia'),
                        ),
                      ],
                    );
                  },
                );
                if (newLanguage != null) {
                  setState(() {
                    _selectedLanguage = newLanguage;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
