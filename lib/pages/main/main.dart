import 'dart:html';

import 'package:awesome_list/model/categories.dart';
import 'package:awesome_list/model/data.dart';
import 'package:awesome_list/util.dart';
import 'package:awesome_list/pages/main/bloc.dart';
import 'package:awesome_list/pages/main/widget_category_selector.dart';
import 'package:awesome_list/pages/main/widget_footer.dart';
import 'package:awesome_list/pages/main/widget_title.dart';
import 'package:awesome_list/pages/main/widget_various.dart';
import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget mainWidget() {
  return $$ >> (context) {
    final bloc = $$$(() =>
        MainBloc([
          "community",
          "community_news",
        ], root));

    final mainDivider = padding(vertical: 8.0) > divider();

    final data = allData;

    final aaa = $(() => bloc.selectedCategories);
    print(aaa);

    final foundData = optionOf(data[aaa.entries.last.value]) | [];
    return apply
    & scaffold(color: Colors.grey[900])
    & textColor(Colors.white)
    & fluidByMarginH2(1000)
        > onListView(
          padding: const EdgeInsets.symmetric(vertical: 42),
        ) >> [
          ...padding(horizontal: 18) * title(),
          padding(horizontal: 18) > mainDivider,
          alignToCenterLeft() > buildingCategories(
              root, bloc.allItems, bloc.selectRowAtColumn),
          padding(horizontal: 18) > mainDivider,
          ...padding(horizontal: 36.0) * [
            apply
            & center()
            & textSize(12.0)
            & opacity(0.3)
                > Text("Awesome Items: ${foundData.length}"),

            ...optionOf(data[aaa.entries.last.value]).fold(() => <Widget>[], (
                listOfData) {
              return listOfData.map((entry) {
                return contentTile(
                  title: entry.title,
                  description: entry.description,
                  trailing: null,
                  tap: () => window.open(entry.link, entry.link),
                );
              });
            }),

//            verticalSpace(24.0),
//
//            apply
//            & height(38.0)
//            & center()
//                > RaisedButton(
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(0.0)),
//              color: Colors.white,
//              child: textColor(Colors.black)
//                  > const Text("Get notified"),
//              onPressed: () {},
//            ),
//
//            verticalSpace(12.0),
//
//            apply
//            & center()
//            & opacity(0.20)
//                > const Text("Last change: 4 minutes ago."),

            verticalSpace(12.0),
          ],
          mainDivider,
          footer(),
        ];
  };
}
