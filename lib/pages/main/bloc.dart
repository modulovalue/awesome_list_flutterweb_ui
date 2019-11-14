import 'package:awesome_list_flutterweb_ui/model/model.dart';
import 'package:bird/bird.dart';
import 'package:flutter/material.dart';

// ignore_for_file: close_sinks
class MainBloc extends HookBloc {
  /// <column index, tag id>
  Signal<Map<int, String>> _selectedCategories;

  /// <column index, tag id>
  Wave<Map<int, String>> selectedCategories;
  Wave<List<SelectedIDS>> allItems;

  TagData _root;

  MainBloc(List<String> _initSelectedCats, this._root) {
    _selectedCategories = Signal(_initSelectedCats.asMap());
    disposeLater(_selectedCategories.close);
    selectedCategories = _selectedCategories.wave;

    allItems = selectedCategories.map((_selectedCats) =>
            () sync* {
          var current = SelectedIDS(
            selectedItem: optionOf(_selectedCats[0]),
            ids: _root.child,
          );
          int currentColumn = 0;
          yield current;
          while (current.ids.isNotEmpty) {
            currentColumn++;
            current = SelectedIDS(
              selectedItem: optionOf(_selectedCats[currentColumn]),
              ids: current
                  .selectedItemOrFirst
                  .bind((id) => optionOf(current.ids[id]))
                  .map((a) => a.child) | {},
            );
            if (current.ids.isNotEmpty) {
              yield current;
            }
          }
        }().toList());
  }

  void selectRowAtColumn(String row, int column) {
    assert(row != null);
    assert(column != null);
    _selectedCategories.add(() {
      // Select the row at the passed column
      final _new = Map<int, String>.from(_selectedCategories.value)
        ..[column] = row;

      // Remove all column selections behind the newly set column.
      _new.keys.where((_oldColumn) => column < _oldColumn)
          .toList()
          .forEach(_new.remove);

      return _new;
    }());

    // find last node
    TagData currentNode = _selectedCategories.value.entries.fold(
        _root, (TagData currentNode, entry) {
      if (currentNode != null) {
        return currentNode.child[entry.value];
      } else {
        return null;
      }
    });

    // Set the columns subcategory to the first category recursively
    if (currentNode != null) {
      final categories = currentNode.child.entries;
      if (categories.isNotEmpty) {
        selectRowAtColumn(categories.first.key, column + 1);
      }
    }
  }
}

class SelectedIDS {
  final Option<String> selectedItem;

  Option<String> get selectedItemOrFirst {
    return selectedItem.orElse(() {
      return ids.values.toList().getAtOrNone(0).map((a) => a.id);
    });
  }

  final Map<String, TagData> ids;

  const SelectedIDS({
    @required this.selectedItem,
    @required this.ids,
  });

  Option<int> get selectedIndex {
    return selectedItem.map((a) {
      return ids
          .values
          .toList()
          .asMap()
          .entries
          .firstWhere((inner) => inner.value.id == a)
          .key;
    });
  }
}

extension IterableGetAtOrNone<T> on Iterable<T> {
  Option<T> getAtOrNone(int i) {
    if (length > i) {
      return some(this.toList()[i]);
    } else {
      return none();
    }
  }
}
