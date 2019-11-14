import 'package:flutter/material.dart';

class TagData {
  final String id;
  final String name;
  final Map<String, TagData> child;

  TagData({
    @required this.id,
    @required this.name,
    @required List<TagData> nodes,
  }) : this.child = Map.fromEntries(nodes.map((a) => MapEntry(a.id, a)));

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is TagData &&
              runtimeType == other.runtimeType &&
              id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'TagData{id: $id, name: $name}';
}

class EntryData {
  final String title;
  final String description;
  final int createdOnMillisecondsSinceEpoch;

  final String link;

  const EntryData({
    @required this.title,
    @required this.description,
    @required this.createdOnMillisecondsSinceEpoch,
    @required this.link,
  });
}