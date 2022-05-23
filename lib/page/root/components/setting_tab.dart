import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/theme_provider.dart';
import '../../../theme.dart';

class SettingTab extends StatefulWidget {
  final BottomNavigationBar bottomNavigationBar;
  const SettingTab({required this.bottomNavigationBar, Key? key})
      : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
  String _isSelected = 'true';
  String dropdownValue = '日本語';
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
                      }),
              DropDownListTile(
                  label: '言語',
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  value: dropdownValue,
                  items: ['日本語', 'English'].map((String item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item),
                    );
                  }).toList())
            ]))
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}

class DropDownListTile extends StatelessWidget {
  DropDownListTile({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    required this.items,
  }) : super(key: key);

  final String label;
  String value;
  final List<DropdownMenuItem> items;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: anyaDefaultPadding),
      child: Row(children: <Widget>[
        Expanded(child: Text(label)),
        DropdownButton(
            value: value,
            items: items,
            onChanged: (dynamic? newValue) {
              if (newValue == null) return;
              onChanged(newValue);
            }),
        const SizedBox(width: anyaDefaultPadding / 2)
      ]),
    ));
  }
}
