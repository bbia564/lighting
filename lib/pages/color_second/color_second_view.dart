import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'color_second_logic.dart';

class ColorSecondPage extends GetView<ColorSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Privacy agreement', 'About us'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index],style: TextStyle(color: Colors.white),),
        index == 0 ? const Icon(
          Icons.keyboard_arrow_right,
          size: 20,
          color: Colors.white,
        ) : const Text('1.0.0',style: TextStyle(color: Colors.white),).paddingOnly(right: 8)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.aboutColorPrivacy(context);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Setting",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.grey[600], borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
