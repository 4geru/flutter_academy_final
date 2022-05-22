import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/theme_provider.dart';

class SettingTab extends StatefulWidget {
  final BottomNavigationBar bottomNavigationBar;
  const SettingTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
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
                  title: const Text('ダークモード'),
                  value: Provider.of<ThemeProvider>(context).isDark == true,
                  onChanged: (v) => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggle()
                      })
            ]))
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}
