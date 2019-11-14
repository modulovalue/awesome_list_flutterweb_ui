import 'package:bird/bird.dart';
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

  List<TagData> getAllChildren() {
    return child.values.toList();
  }

  Option<TagData> getChildren(String id) {
    return optionOf(child[id]);
  }

  @override
  String toString() {
    return 'TagData{id: $id, name: $name}';
  }
}

class EntryData {
  final String title;
  final String description;
  final int createdOnMillisecondsSinceEpoch;

  final String link;

//  final Option<String> githubUserRepoForStarsBadge;
//  final Option<String> githubUserRepoForLicenseBadge;
  final Option<String> pubdevPackageNameForBadge;
//  final Option<String> twitterUserForFollowBadge;
//  final Option<String> githubUserForFollowBadge;

  const EntryData({
    @required this.title,
    @required this.description,
    @required this.createdOnMillisecondsSinceEpoch,
    @required this.link,
//    this.githubUserRepoForStarsBadge = const None(),
//    this.githubUserRepoForLicenseBadge = const None(),
    this.pubdevPackageNameForBadge = const None(),
//    this.twitterUserForFollowBadge = const None(),
//    this.githubUserForFollowBadge = const None(),
  });
}