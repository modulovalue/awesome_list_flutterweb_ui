import 'package:awesome_list_flutterweb_ui/pages/main/bloc.dart';
import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildingCategories(Wave<List<SelectedIDS>> items,
    void Function(String id, int column) selectRowAtColumn) {
  return $$ >> (context) {
    final allItems = $(() => items);

    String supercategory = "";
    final _items = allItems.map((SelectedIDS selectedIDs) {
      final result = MapEntry(supercategory, selectedIDs.ids.values.map((node) {
        if ((selectedIDs.selectedItem | null) == node.id) {
          return textColor(Colors.blue) & textWeight900() > Text(node.name);
        } else {
          return Text(node.name);
        }
      }).toList());
      supercategory = selectedIDs.selectedItem | null;
      return result;
    }).toList();

    return _categories(
      items: _items,
      selectedIndexAtColumn: (item) => allItems[item].selectedIndex,
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
  /// each entry in this list is a column and its supercategory.
  @required List<MapEntry<String, List<Widget>>> items,
  @required Option<int> Function(int column) selectedIndexAtColumn,
  @required void Function(int row, int column) onSelectedRowAtColumn,
}) =>
    alignToCenterLeft()
    & padding(horizontal: 18.0)
    & singleChildScrollViewH()
        > onRowMinCenterCenter() >> items
        .asMap()
        .entries
        .map((entry) {
      final supercategory = entry.value.key;
      final _items = entry.value.value;
      final column = entry.key;

      return apply
      & width(150.0)
      & height(90)
          > CupertinoPicker(
            key: ValueKey(supercategory),
            backgroundColor: Colors.transparent,
            itemExtent: 32,
            scrollController: FixedExtentScrollController(
              initialItem: selectedIndexAtColumn(column) | 0,
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
