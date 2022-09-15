import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RowTileWidget extends StatelessWidget {
  RowTileWidget(
      {Key? key, required this.icon, required this.text, required this.onTap})
      : super(key: key);
  void Function()? onTap;
  Icon icon;
  Text text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              width: 30,
            ),
            text
          ],
        ),
      ),
    );
  }
}
