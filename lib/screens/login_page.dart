import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_screen/models/user_repository.dart';
import 'package:login_screen/providers/app_provider.dart';
import 'package:login_screen/providers/login_provider.dart';
import 'package:login_screen/screens/custom/custom_dialog.dart';
import 'package:login_screen/screens/custom/custom_iconbutton.dart';
import 'package:login_screen/screens/home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _taxCodeController =
      TextEditingController(text: UserRepository.taxCode);
  final _accountController =
      TextEditingController(text: UserRepository.account);
  final _passwordController =
      TextEditingController(text: UserRepository.password);

  late final _loginProvider = context.read<LoginProvider>();
  final _appProvider = AppProvider();

  
  @override
  void initState() {
    super.initState();
    _appProvider.addListener(() {
      if (_appProvider.isLoggedIn) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));
      }
    });
  }

  //ElevatedButton
  void _login() {
    _loginProvider.validateChanged();
    if (_formKey.currentState!.validate()) {
      _loginProvider.login();
      _appProvider.setLoggedIn(true);
    } else {
      showDialog(context: context, builder: (context) => const CustomDialog());
    }
  }

  //Dispose
  @override
  void dispose() {
    _taxCodeController.dispose();
    _accountController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = context.watch<LoginProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        autovalidateMode: loginProvider.validateMode,
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
                    controller: _taxCodeController,
                    decoration: InputDecoration(
                      counterText: "",
                      suffixIcon: loginProvider.showCloseIcon
                          ? IconButton(
                              icon: SvgPicture.asset(
                                  'assets/images/icon_close.svg'),
                              onPressed: () {
                                _taxCodeController.clear();
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
                    onChanged: loginProvider.setTaxCode,
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
                    controller: _accountController,
                    decoration: InputDecoration(
                      hintText: 'Tài khoản',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Color(0xFFF24E1E))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF24E1E))),
                    ),
                    onChanged: loginProvider.setAccount,
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
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    onChanged: loginProvider.setPassword,
                    validator: (value) {
                      if (value == null ||
                          value.length < 8 ||
                          value.length > 50) {
                        return 'Mật khẩu phải từ 8 đến 50 ký tự';
                      }
                      return null;
                    },
                    obscureText: loginProvider.isObscure,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Mật khẩu',
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide:
                              const BorderSide(color: Color(0xFFF24E1E))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFF24E1E))),
                      suffixIcon: loginProvider.showEyeIcon
                          ? IconButton(
                              onPressed: loginProvider.toggleEyeIcon,
                              icon: Icon(
                                loginProvider.isObscure
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
                    onPressed: _login,
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
