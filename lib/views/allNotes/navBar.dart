import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/theme/SharedPreferences.dart';

class MyAppBar extends AppBar {
  final bool isListLayout;
  final Function setIsListLayout;
  final TextEditingController searchController;

  MyAppBar(this.isListLayout, this.setIsListLayout, this.searchController,
      {Key? key})
      : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBar();
}

class _MyAppBar extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    final dropdownOptions = [
      {'value': 'logout', 'text': 'Log out'},
      {
        'value': 'darkMode',
        'text': themeChange.darkTheme ? "Dark Off" : "Dark On"
      }
    ];

    return AppBar(
        title: Container(
          width: double.infinity,
          height: 40,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon:
                      Icon(Icons.search, color: Theme.of(context).focusColor),
                  suffixIcon: IconButton(
                    icon:
                        Icon(Icons.clear, color: Theme.of(context).focusColor),
                    onPressed: () {
                      widget.searchController.text = "";
                    },
                  ),
                  hintText: 'Search...',
                  hintStyle: TextStyle(
                    color: Theme.of(context).hintColor
                  ),
                  focusColor: Theme.of(context).primaryColor,
                  border: InputBorder.none),
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: widget.searchController,
              autofocus: false,
            ),
          ),
        ),
        leading: Row(children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 1, 0, 1),
            child: SvgPicture.asset(
              'assets/images/keep.svg',
              width: 20.0,
              height: 20.0,
            ),
          )
        ]),
        actions: [
          IconButton(
            icon: Icon(
              widget.isListLayout
                  ? Icons.grid_view_outlined
                  : Icons.list_outlined,
            ),
            onPressed: () => widget.setIsListLayout(!widget.isListLayout),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButton<String>(
                value: dropdownOptions[0]['value'],
                selectedItemBuilder: (BuildContext c) => dropdownOptions
                    .map((e) => const Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Icon(Icons.account_circle)))
                    .toList(),
                items: dropdownOptions.map((item) {
                  return DropdownMenuItem(
                    value: item['value'],
                    child: Text(item['text'] ?? ""),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value == "logout") {
                    print("log out clicked");
                    return;
                  }
                  if (value == "darkMode") {
                    themeChange.darkTheme = !themeChange.darkTheme;
                  }
                },
              )),
        ]);
  }
}
