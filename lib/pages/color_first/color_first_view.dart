import 'package:dynamic_color/main.dart';
import 'package:dynamic_color/pages/color_first/scale_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:styled_widget/styled_widget.dart';
import 'color_first_logic.dart';

class ColorFirstPage extends StatefulWidget {
  const ColorFirstPage({Key? key}) : super(key: key);

  @override
  State<ColorFirstPage> createState() => _ColorFirstPageState();
}

class _ColorFirstPageState extends State<ColorFirstPage> with SingleTickerProviderStateMixin {

  ColorFirstLogic  controller = Get.put(ColorFirstLogic());

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);
  }

  Widget _typeItem(int index) {
    final titles = ['Normal', 'SOS', 'Flashing'];
    return Expanded(
      child: Container(
        height: 60,
        alignment: Alignment.center,
        child: Text(
          titles[index],
          style: const TextStyle(color: Colors.white),
        ),
      )
          .decorated(
          border: controller.type == index
              ? Border.all(color: const Color(0xffff9d00))
              : null,
          borderRadius: BorderRadius.circular(8),
          color: controller.type == index
              ? const Color(0xff644d28)
              : const Color(0xff5d5d5d))
          .gestures(onTap: () {
        controller.type = index;
        controller.typeName = titles[index];
        controller.update();
      }),
    );
  }

  Widget _typeWidget(int index) {
    Widget result = SizedBox();
    if (index == 0) {
      result = Obx(() {
        return Container(
          width: 168,
          height: 168,
        ).decorated(
          borderRadius: BorderRadius.circular(84),
          color: accentColors[controller.colorIndex]
              .withOpacity(controller.progress.value / 100.0),
        );
      });
    } else if (index == 1) {
      result = Obx(() {
        return RippleAnimation(
          child: Container(
            width: 168,
            height: 168,
          ).decorated(
            borderRadius: BorderRadius.circular(84),
            color: accentColors[controller.colorIndex]
                .withOpacity(controller.progress.value / 100.0),
          ),
          color: accentColors[controller.colorIndex]
              .withOpacity(controller.progress.value / 100.0),
          delay: const Duration(milliseconds: 300),
          repeat: true,
          minRadius: 40,
          ripplesCount: 12,
          duration: const Duration(milliseconds: 6 * 300),
        );
      });
    } else if (index == 2) {
      result = ScalableWidget(
        duration:const Duration(milliseconds: 500),
        minScale: 0.8,
        maxScale: 1.2,
        child: Obx((){
          return Container(
            width: 168,
            height: 168,
          ).decorated(
            borderRadius: BorderRadius.circular(84),
            color: accentColors[controller.colorIndex]
                .withOpacity(controller.progress.value / 100.0),
          );
        }),
      );
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: GetBuilder<ColorFirstLogic>(
            init: ColorFirstLogic(), builder: (_) {
          return SafeArea(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: <Widget>[
                Obx(() {
                  return Text(
                    '${controller.typeName} - ${controller.progress.value}%',
                    style: const TextStyle(fontSize: 15, color: Colors.white),
                  );
                }),
                const SizedBox(
                  height: 15,
                ),
                _typeWidget(controller.type),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: <Widget>[
                    const Text(
                      'Function setting',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    <Widget>[
                      _typeItem(0),
                      const SizedBox(
                        width: 10,
                      ),
                      _typeItem(1),
                      const SizedBox(
                        width: 10,
                      ),
                      _typeItem(2)
                    ].toRow(),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Brightness setting',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return Slider(
                          value: controller.progress.value.toDouble(),
                          min: 0,
                          max: 100,
                          onChanged: (value) {
                            controller.progress.value = value.toInt();
                          });
                    }),
                    const Text(
                      'Color',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6, crossAxisSpacing: 10,mainAxisSpacing: 10),
                        itemCount: accentColors.length,
                        itemBuilder: (_, index) {
                          return Container()
                              .decorated(
                              border: controller.colorIndex == index
                                  ? Border.all(
                                  color: const Color(0xffff9d00))
                                  : null,
                              color: accentColors[index],
                              borderRadius: BorderRadius.circular(8))
                              .gestures(onTap: () {
                            controller.colorIndex = index;
                            controller.update();
                          });
                        })
                  ].toColumn(),
                ).decorated(
                    color: const Color(0xff4e4e4e),
                    borderRadius: BorderRadius.circular(15)),
              ].toColumn(),
            ),
          );
        }).marginAll(15),
      ),
    );
  }
}

