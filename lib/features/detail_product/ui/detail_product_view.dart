import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/detail_product/controller/detai_product_controller.dart';

class DetailProductView extends GetView<DetaiProductController> {
  const DetailProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new_sharp),
        ),
      ),
      body: Center(
        child: ElevatedButton(onPressed: () {  },
        child: 
        const Text('Xóa'),),
      ),
    );
  }
}
