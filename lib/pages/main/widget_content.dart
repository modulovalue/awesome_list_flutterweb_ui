import 'package:awesome_list_flutterweb_ui/model/model.dart';
import 'package:bird_flutter/bird_flutter.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as ta;

Widget contentTile({
  @required EntryData data,
  @required void Function() tap,
}) =>
    apply
    & padding(vertical: 2.0)
    & card(color: Color.lerp(Colors.grey[800], Colors.grey[900], 0.7))
        > ListTile(
      onTap: tap,
      title: onWrap(
        spacing: 8.0,
        runSpacing: 8.0,
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.end,
      ) >> [
        apply
        & padding(top: 4.0)
        & textSize(18.0)
        & textWeight700()
        & textColor(Colors.white)
            > Text(data.title),

        apply
        & textColor(Colors.white.withOpacity(0.3))
        & textSize(12.0)
            > Text(ta.format(DateTime.fromMillisecondsSinceEpoch(
            data.createdOnMillisecondsSinceEpoch))),
      ],
      subtitle: apply
      & padding(bottom: 4.0)
          > onColumnMinStartStart()
              >> textColor(Colors.white) * [
                verticalSpace(8.0),
                divider(),
                verticalSpace(8.0),
                textColor(Colors.white.withOpacity(0.8))
                    > Text(data.description),
                verticalSpace(12.0),
                onWrapCenterCenter(allSpacing: 8.0) >> [
                  Icon(Icons.link, size: 12.0),
                  textColor(Colors.blue) > Text(data.link),
                ],
                verticalSpace(6.0),
              ],
    );

Widget divider() =>
    apply
    & bgColor(Colors.white.withOpacity(0.1))
    & height(1)
    & width(200000)
        > nothing;
