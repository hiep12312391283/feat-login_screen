import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen/screens/custom/custom_dialog.dart';
import 'package:login_screen/screens/custom/custom_iconbutton.dart';
import 'package:login_screen/screens/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController taxCodeController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  AutovalidateMode validateMode = AutovalidateMode.disabled;

  @override
  void initState() {
    super.initState();

    taxCodeController.addListener(() {
      setState(() {});
    });
    passwordController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        autovalidateMode: validateMode,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: taxCodeController,
                    decoration: InputDecoration(
                      counterText: "",
                      suffixIcon: taxCodeController.text.isNotEmpty
                          ? IconButton(
                              icon: SvgPicture.asset(
                                  'assets/images/icon_close.svg'),
                              onPressed: () {
                                taxCodeController.clear();
                              },
                            )
                          : null,
                      hintText: 'Mã số thuế',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Color(0xFFF24E1E))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF24E1E))),
                    ),
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 8),

                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tài khoản không được để trống';
                      }
                      return null;
                    },
                    controller: accountController,
                    decoration: InputDecoration(
                      hintText: 'Mã số thuế',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Color(0xFFF24E1E))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF24E1E))),
                    ),
                  ),

                  const SizedBox(height: 16),

                  //Mật khẩu
                  const Text(
                    'Mật khẩu',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.length < 8 ||
                          value.length > 50) {
                        return 'Mật khẩu từ 8 đến 50 ký tự';
                      }
                      return null;
                    },
                    obscureText: _isObscure,
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Mật khẩu',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Color(0xFFF24E1E))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF24E1E))),
                      suffixIcon: passwordController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              icon: Icon(
                                _isObscure
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
                      setState(() {
                        validateMode = AutovalidateMode.always;
                      });
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => const CustomDialog(),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF24E1E),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xFFF24E1E)),
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
                          iconPath: 'assets/images/icon_headphone.svg',
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
        ),
      ),
    );
  }
}
