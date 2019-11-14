import 'package:awesome_list_flutterweb_ui/model/model.dart';

final TagData root = TagData(
  id: "root",
  name: "Root",
  nodes: [
    TagData(id: "packages", name: "Packages", nodes: [
      TagData(id: "flutter_specific", name: "Flutter", nodes: [
        TagData(id: "drawers", name: "Drawers", nodes: []),
        TagData(id: "bottom_bars", name: "Bottom Bars", nodes: []),
        TagData(id: "sliders", name: "Sliders", nodes: []),
        TagData(id: "lists", name: "Lists", nodes: []),
        TagData(id: "effect", name: "Effect", nodes: []),
        TagData(id: "calendar", name: "Calendar", nodes: []),
        TagData(id: "image", name: "Image", nodes: []),
        TagData(id: "map", name: "Map", nodes: []),
        TagData(id: "charts", name: "Charts", nodes: []),
        TagData(id: "navigation", name: "Navigation", nodes: []),
        TagData(id: "text", name: "Text & Rich Content", nodes: []),
        TagData(id: "auth", name: "Authentication", nodes: []),
        TagData(id: "analytics", name: "Analytics", nodes: []),
        TagData(id: "i18n", name: "Internationalization", nodes: []),
        TagData(id: "design_langugage", name: "Design System", nodes: [
          TagData(id: "dl_md", name: "Material Design", nodes: []),
          TagData(id: "dl_cupertino", name: "Cupertino", nodes: []),
          TagData(id: "dl_eva", name: "Eva", nodes: []),
        ]),
        TagData(id: "multimedia", name: "Multimedia", nodes: [
          TagData(id: "audio", name: "Audio", nodes: []),
          TagData(id: "video", name: "Video", nodes: []),
          TagData(id: "voice", name: "Voice", nodes: []),
        ]),
        TagData(id: "animation", name: "Animation", nodes: []),
        TagData(id: "game_engine", name: "Game Engine", nodes: []),
      ]),
      TagData(id: "math", name: "Math", nodes: []),
      TagData(id: "state_management", name: "State Management", nodes: []),
      TagData(id: "fp", name: "Functional Programming", nodes: []),
    ]),
    TagData(id: "os_apps", name: "Open Source Apps", nodes: [
      TagData(id: "games", name: "Games", nodes: []),
      TagData(id: "social_apps", name: "Social Apps", nodes: []),
      TagData(id: "multimedia_apps", name: "Multimedia Apps", nodes: []),
      TagData(id: "widget_showcase", name: "Widget Showcase", nodes: []),
      TagData(id: "os_templates", name: "Templates", nodes: []),
      TagData(id: "other_apps", name: "Other", nodes: []),
    ]),
    TagData(id: "community", name: "Community", nodes: [
      TagData(id: "community_communication", name: "Communication", nodes: []),
      TagData(id: "community_news", name: "News", nodes: []),
      TagData(id: "community_other", name: "Other", nodes: []),
    ]),
    TagData(id: "education", name: "Education", nodes: [
      TagData(id: "education_beginner", name: "Beginner", nodes: []),
      TagData(id: "education_intermediate", name: "Intermediate", nodes: []),
      TagData(id: "education_advanced", name: "Advanced", nodes: []),
    ]),
    TagData(id: "entertainment", name: "Entertainment", nodes: [
      TagData(id: "memes", name: "Memes", nodes: []),
    ]),
  ],
);