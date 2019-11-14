import 'package:awesome_list/model/model.dart';
import 'package:awesome_list/pages/main/bloc.dart';
import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildingCategories(TagData _graph, Wave<List<SelectedIDS>> items,
    void Function(String id, int column) selectRowAtColumn) {
  return $$ >> (context) {
    final allItems = $(() => items);

    final _items = allItems.map((a) {
      return a.ids.values.map((node) {
        return Text(node.name);
      }).toList();
    }).toList();

    return _categories(
      items: _items,
      selectedItemAtColumn: (item) => allItems[item].selectedIndex,
      onSelectedRowAtColumn: (row, column) {
        return selectRowAtColumn(
          allItems[column].ids.values.getAtOrNone(row).map((a) => a.id) | null,
          column,
        );
      },
    );
  };
}

Widget _categories({
  /// each entry in this list is a column.
  @required List<List<Widget>> items,
  @required Option<int> Function(int column) selectedItemAtColumn,
  @required void Function(int row, int column) onSelectedRowAtColumn,
}) =>
    alignToCenterLeft()
    & padding(horizontal: 18.0)
    & singleChildScrollViewH()
        > onRowMinCenterCenter() >> items
        .asMap()
        .entries
        .map((entry) {
      final _items = entry.value;
      final column = entry.key;
      return apply
      & width(150.0)
      & height(150)
          > CupertinoPicker(
            backgroundColor: Colors.transparent,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
              initialItem: selectedItemAtColumn(column) | 0,
            ),
            onSelectedItemChanged: (item) =>
                onSelectedRowAtColumn(item, column),
            children: _items.map((item) {
              return apply
              & center()
              & textAsBody1()
              & textColor(Colors.white)
              & textAlignC()
                  > item;
            }).toList(),
          );
    }).intersperse(opacity(0.4) > Icon(Icons.arrow_right, size: 18.0));
