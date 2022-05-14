import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    const dropdownOptions = ['logout'];
    return AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    widget.searchController.text = "";
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
            controller: widget.searchController,
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
          splashColor: Colors.white,
          onPressed: () => widget.setIsListLayout(!widget.isListLayout),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: dropdownOptions[0],
              selectedItemBuilder: (BuildContext c) => dropdownOptions
                  .map((e) => const Padding(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Icon(Icons.account_circle)))
                  .toList(),
              items: dropdownOptions.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue == "logout") {
                  print("log out clicked");
                }
              },
            )),
      ],
      backgroundColor: Colors.black,
    );
  }
}
