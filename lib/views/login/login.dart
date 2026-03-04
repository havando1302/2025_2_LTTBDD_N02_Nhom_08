import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:musicbox/constants/app_colors.dart';
import 'package:musicbox/controllers/user_controller.dart';
import 'package:musicbox/models/user_model.dart';
import 'package:musicbox/providers/app_provider.dart';
import 'package:musicbox/translates/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final UserController userController = UserController();

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final localeProvider = context.watch<LocaleProvider>();
    final lang = localeProvider.locale.languageCode.toUpperCase();
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Color(MyColor.pr1),
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: Color(MyColor.pr4),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.music_note,
                        size: 36,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 24),
                    Text(
                      t.login,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(MyColor.se5),
                      ),
                    ),
                    const SizedBox(height: 6),

                    Text(
                      t.loginSubtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(MyColor.grey),
                      ),
                    ),

                    const SizedBox(height: 32),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        t.email,
                        style: const TextStyle(
                          color: Color(MyColor.white),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: "name@gmail.com",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        t.password,
                        style: const TextStyle(
                          color: Color(MyColor.white),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      controller: passwordController,
                      obscureText: obscurePassword,
                      decoration: InputDecoration(
                        hintText: t.enterPassword,
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              obscurePassword = !obscurePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          t.forgotPassword,
                          style: TextStyle(color: Color(MyColor.pr4)),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(MyColor.pr4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          final email = emailController.text.trim();
                          final pass = passwordController.text.trim();

                          if (email.isEmpty || pass.isEmpty) {
                            _showSnack(t.fillAll);
                            return;
                          }

                          final UserModel? user = userController.login(
                            email: email,
                            password: pass,
                          );

                          if (user != null) {
                            _showSnack("${t.welcome} ${user.name}");
                            context.go('/home');
                          } else {
                            _showSnack(t.invalidLogin);
                          }
                        },
                        child: Text(
                          t.login,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            t.orContinue,
                            style: TextStyle(color: Color(MyColor.grey)),
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),

                    const SizedBox(height: 16),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _social('assets/icons/google.png', false),
                        _social('assets/icons/facebook.svg', true),
                        _social('assets/icons/apple.svg', true),
                      ],
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          t.noAccount,
                          style: TextStyle(color: Color(MyColor.grey)),
                        ),
                        Text(
                          t.signUp,
                          style: TextStyle(
                            color: Color(MyColor.pr4),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: 12,
              right: 16,
              child: GestureDetector(
                onTap: () => context.read<LocaleProvider>().toggle(),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.language, size: 16),
                      const SizedBox(width: 6),
                      Text(lang),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _social(String path, bool svg) {
    return Container(
      width: 56,
      height: 44,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.center,
      child: svg
          ? SvgPicture.asset(path, width: 24)
          : Image.asset(path, width: 24),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          msg,
          style: TextStyle(color: Color(MyColor.black), fontSize: 24),
        ),
        backgroundColor: Color(MyColor.pr4),
      ),
    );
  }
}
