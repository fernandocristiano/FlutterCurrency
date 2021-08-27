import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController filterController;
  final void Function(String) onSearchClick;

  SearchWidget({required this.onSearchClick, required this.filterController});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey.withOpacity(0.25),
        child: Padding(
          padding: EdgeInsets.fromLTRB(50.0, 0.0, 10.0, 0.0),
          child: Row(children: [
            Expanded(
                child: TextField(
                    controller: filterController,
                    decoration: InputDecoration(labelText: "Search", labelStyle: TextStyle(color: Colors.grey), border: InputBorder.none),
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                    onSubmitted: (text) {
                      onSearchClick(text);
                    })),
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  onSearchClick(filterController.text);
                })
          ]),
        ));
  }
}
