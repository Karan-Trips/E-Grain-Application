import 'package:get/get.dart';

class Mcontroller extends GetxController {
  var o = 0.obs;
  var v;
  incre() {
    o.value++;

    return v;
  }

  // tot() {
  //   var tota = 0;
  //   tota = v * 80;
  //   return tota;
  // }

  decre() {
    if (o.value <= 0) {
    } else {
      o.value--;
    }
  }
}
