import 'package:flutter/material.dart';
import 'package:news_app/shared/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawerWidget extends StatelessWidget {
  final Function(DrawerOptions) selectedOption;
  const DrawerWidget({super.key, required this.selectedOption});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          alignment: Alignment.center,
          color: MyAppTheme.primaryColor,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Text(
            '${AppLocalizations.of(context)?.news ?? ''} !',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.04,
        ),
        InkWell(
          onTap: () {
            selectedOption(DrawerOptions.categories);
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.menu,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)?.categories ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            selectedOption(DrawerOptions.settings);
          },
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              const Icon(
                Icons.settings,
                size: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                AppLocalizations.of(context)?.settings ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

enum DrawerOptions {
  categories,
  settings;
}
