import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'setting_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
        ),
        Padding(
          padding: EdgeInsetsDirectional.only(
              start: MediaQuery.of(context).size.width * 0.08),
          child: Text(
            AppLocalizations.of(context)?.lang ?? '',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.03,
        ),
        Container(
          padding: const EdgeInsetsDirectional.only(start: 15),
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.13),
          height: MediaQuery.of(context).size.height * 0.06,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: MyAppTheme.primaryColor, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                settingsProvider.appLanguage == 'en'
                    ? AppLocalizations.of(context)?.english ?? ''
                    : AppLocalizations.of(context)?.arabic ?? '',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: MyAppTheme.primaryColor),
              ),
              DropdownMenu(
                  menuStyle: const MenuStyle(
                      alignment: AlignmentDirectional.bottomStart),
                  initialSelection: settingsProvider.appLanguage,
                  onSelected: (value) {
                    settingsProvider.changeLanguage(value ?? '');
                    setState(() {});
                  },
                  textStyle: TextStyle(color: MyAppTheme.primaryColor),
                  inputDecorationTheme: InputDecorationTheme(
                    counterStyle: TextStyle(color: MyAppTheme.primaryColor),
                    alignLabelWithHint: true,
                    suffixIconColor: MyAppTheme.primaryColor,
                    border: InputBorder.none,
                  ),
                  dropdownMenuEntries: [
                    DropdownMenuEntry(
                      value: 'en',
                      label: AppLocalizations.of(context)?.english ?? '',
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(MyAppTheme.primaryColor),
                      ),
                    ),
                    DropdownMenuEntry(
                      value: 'ar',
                      label: AppLocalizations.of(context)?.arabic ?? '',
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStatePropertyAll(MyAppTheme.primaryColor),
                      ),
                    ),
                  ])
            ],
          ),
        ),
      ],
    );
  }
}
