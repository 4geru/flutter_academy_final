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
  String _isSelected = 'true';
  String dropdownValue = 'One';
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: dropdownValue,
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
              )
            ]))
          ],
        ),
        bottomNavigationBar: widget.bottomNavigationBar);
  }
}

class DropDownListTile extends StatelessWidget {
  const DropDownListTile({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final String value;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Padding(
      padding: padding,
      child: Row(children: <Widget>[
        Expanded(child: Text(label)),
        DropdownButton(
            value: '日本語',
            items: ['日本語', 'English'].map((String item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (String? newValue) {
              print(' $newValue');
            }),
        const SizedBox(width: 10)
      ]),
    ));
  }
}
