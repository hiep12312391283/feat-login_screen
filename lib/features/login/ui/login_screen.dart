import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_screen/features/app/ui/custom/custom_iconbutton.dart';
import 'package:login_screen/features/login/controller/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Stack(
            children: [
              Form(
                  key: controller.formKey,
                  autovalidateMode: controller.validateMode.value,
                  child: SafeArea(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(height: 30),
                            SvgPicture.asset(
                              'assets/images/logo.svg',
                              width: 158,
                              height: 37,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            //Mã số thuế
                            const Text(
                              'Mã số thuế',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              controller: controller.taxCodeController,
                              decoration: InputDecoration(
                                counterText: "",
                                suffixIcon: controller.taxCode.value.isNotEmpty
                                    ? IconButton(
                                        icon: SvgPicture.asset(
                                            'assets/images/icon_close.svg'),
                                        onPressed: () {
                                          controller.taxCodeController.clear();
                                          controller.taxCode.value = '';
                                        },
                                      )
                                    : null,
                                hintText: 'Mã số thuế',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF24E1E))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFF24E1E))),
                              ),
                              onChanged: (value) {
                                controller.setTaxCode(
                                    controller.taxCodeController.text);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length != 10) {
                                  return 'Phải có đủ độ dài 10 số';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),

                            //Tài khoản
                            const Text(
                              'Tài khoản',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(height: 8),

                            TextFormField(
                              controller: controller.accountController,
                              decoration: InputDecoration(
                                hintText: 'Tài khoản',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF24E1E))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFF24E1E))),
                              ),
                              onChanged: (value) {
                                controller.accountController.text;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Tài khoản không được để trống';
                                }
                                return null;
                              },
                            ),

                            const SizedBox(height: 16),

                            //Mật khẩu
                            const Text(
                              'Mật khẩu',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              validator: (value) {
                                if (value == null ||
                                    value.length < 6 ||
                                    value.length > 50) {
                                  return 'Mật khẩu phải từ 8 đến 50 ký tự';
                                }
                                return null;
                              },
                              obscureText: controller.isObscure.value,
                              controller: controller.passwordController,
                              onChanged: (value) {
                                controller.setPassword(
                                    controller.passwordController.text);
                              },
                              decoration: InputDecoration(
                                hintText: 'Mật khẩu',
                                hintStyle: const TextStyle(
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(
                                        color: Color(0xFFF24E1E))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFF24E1E))),
                                suffixIcon: controller.password.value.isNotEmpty
                                    ? IconButton(
                                        onPressed: controller.toggleEyeIcon,
                                        icon: Icon(
                                          controller.isObscure.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.grey,
                                        ))
                                    : null,
                              ),
                            ),
                            const SizedBox(height: 20),

                            //Button đăng nhập
                            ElevatedButton(
                              onPressed: () {
                                controller.login();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFF24E1E),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xFFF24E1E)),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: Container(
                                alignment: Alignment.center,
                                height: 54,
                                width: double.infinity,
                                child: const Text(
                                  'Đăng nhập',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomIconbutton(
                                    iconPath:
                                        'assets/images/icon_headphone.svg',
                                    onPressed: () {}),
                                const Spacer(flex: 1),
                                CustomIconbutton(
                                    iconPath: 'assets/images/icon_facebook.svg',
                                    onPressed: () {}),
                                const Spacer(flex: 1),
                                CustomIconbutton(
                                    iconPath: 'assets/images/icon_search.svg',
                                    onPressed: () {})
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              if (controller.isLoading.value == true)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        }));
  }
}
