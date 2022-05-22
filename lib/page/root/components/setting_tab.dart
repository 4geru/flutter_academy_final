import 'package:flutter/material.dart';

class SettingTab extends StatefulWidget {
  final BottomNavigationBar bottomNavigationBar;
  const SettingTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 50.0,
              title: Text('ANYA in setting'),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(title: Text('設定画面')),
              SwitchListTile(
                  title: const Text('Lights'),
                  value: _isSelected,
                  onChanged: (bool value) {
                    setState(() {
                      _isSelected = value;
                    });
                  })
            ]))
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}
