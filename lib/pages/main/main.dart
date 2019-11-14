import 'dart:html';

import 'package:awesome_list_flutterweb_ui/model/categories.dart';
import 'package:awesome_list_flutterweb_ui/model/data.dart';
import 'package:awesome_list_flutterweb_ui/pages/main/bloc.dart';
import 'package:awesome_list_flutterweb_ui/pages/main/widget_category_selector.dart';
import 'package:awesome_list_flutterweb_ui/pages/main/widget_footer.dart';
import 'package:awesome_list_flutterweb_ui/pages/main/widget_title.dart';
import 'package:awesome_list_flutterweb_ui/pages/main/widget_content.dart';
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

    final selectedCategories = $(() => bloc.selectedCategories);

    final foundData = optionOf(data[selectedCategories.entries.last.value]);

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
              bloc.allItems, bloc.selectRowAtColumn),

          padding(horizontal: 18) > mainDivider,

          breadcrumbs(selectedCategories, (foundData | []).length),

          ...padding(horizontal: 18.0) * [
            ...foundData.fold(() =>
            [
              center()
              & padding(vertical: 4.0)
                  > const Text("There are no entries for this category"),
            ], (listOfData) {
              return listOfData.map((entry) {
                return contentTile(
                  data: entry,
                  tap: () => window.open(entry.link, entry.link),
                );
              });
            }),
          ],
          mainDivider,
          footer(),
        ];
  };
}

Widget breadcrumbs(Map<int, String> selectedCategories, int dataCount) {
  return $$ >> (context) {
    return center()
    & padding(horizontal: 18.0, vertical: 6.0)
    & textColor(Colors.white.withOpacity(0.4))
    & textSize(12.0)
    & textAlignC()
        > Text(() {
          final texts = <String>[];
          var curNode = root;
          selectedCategories.values.forEach((category) {
            curNode = curNode.child[category];
            texts.add(curNode.name);
          });
          return texts.join(" • ");
        }() + " • $dataCount");
  };
}