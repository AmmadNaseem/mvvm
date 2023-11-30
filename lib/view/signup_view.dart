import 'package:flutter/material.dart';
import 'package:mvvm/res/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                focusNode: emailFocusNode,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email),
                ),
                onFieldSubmitted: (value) {
                  Utils.fieldFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                }),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword.value,
                  obscuringCharacter: "*",
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: const Icon(Icons.lock_open_rounded),
                      suffixIcon: InkWell(
                        onTap: () {
                          _obscurePassword.value = !_obscurePassword.value;
                        },
                        child: Icon(_obscurePassword.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      )),
                );
              },
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: 'SignUp',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please enter 6 digit password", context);
                } else {
                  Map data = {
                    'email': _emailController.text.toString(),
                    'password': _passwordController.text.toString(),
                  };
                  authViewModel.registerApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.login);
              },
              child: const Text(
                'Already have an account? Login',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
