import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:login_screen/controllers/login_controller.dart';
import 'package:login_screen/views/custom/custom_iconbutton.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Stack(
            children: [
              Form(
                  key: loginController.formKey,
                  autovalidateMode: loginController.validateMode.value,
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
                              controller: loginController.taxCodeController,
                              decoration: InputDecoration(
                                counterText: "",
                                suffixIcon:
                                    loginController.taxCode.value.isNotEmpty
                                        ? IconButton(
                                            icon: SvgPicture.asset(
                                                'assets/images/icon_close.svg'),
                                            onPressed: () {
                                              loginController.taxCodeController
                                                  .clear();
                                              loginController.setTaxCode(loginController.taxCodeController.text);
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
                                loginController.taxCode.value;
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
                              controller: loginController.accountController,
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
                                loginController.accountController.text;
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
                                    value.length < 8 ||
                                    value.length > 50) {
                                  return 'Mật khẩu phải từ 8 đến 50 ký tự';
                                }
                                return null;
                              },
                              obscureText: loginController.isObscure.value,
                              controller: loginController.passwordController,
                              onChanged: (value) {
                                loginController.setPassword(
                                    loginController.passwordController.text);
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
                                suffixIcon:
                                    loginController.password.value.isNotEmpty
                                        ? IconButton(
                                            onPressed:
                                                loginController.toggleEyeIcon,
                                            icon: Icon(
                                              loginController.isObscure.value
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
                              onPressed: loginController.login,
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
              if (loginController.isLoading.value == true)
                const Center(child: CircularProgressIndicator()),
            ],
          );
        }));
  }
}
