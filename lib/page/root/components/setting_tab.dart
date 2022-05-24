import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/repo/locale_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final l10n = Provider.of<LocaleProvider>(context).load();
    final List<DropdownMenuItem> items = Locales.values.map((l10n) {
      return DropdownMenuItem(
        value: l10n.locale,
        child: Text(l10n.language),
      );
    }).toList();
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: false,
              snap: false,
              floating: false,
              expandedHeight: 50.0,
              title: Text(l10n.setting_title),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              ListTile(title: Text(l10n.top_setting_tab)),
              SwitchListTile(
                  title: Text(l10n.setting_darkmode),
                  value: Provider.of<ThemeProvider>(context).isDark == true,
                  onChanged: (v) => {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .toggle()
                      }),
              DropDownListTile(
                  label: l10n.setting_language,
                  onChanged: (newValue) {
                    Provider.of<LocaleProvider>(context, listen: false)
                        .setLocale(Locale(newValue));
                  },
                  value: l10n.locale,
                  items: items)
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
      padding: const EdgeInsets.symmetric(horizontal: anyaDefaultPadding),
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
