import 'package:e_commerce/controllers/auth_controller.dart';
import 'package:e_commerce/utilities/enums.dart';
import 'package:e_commerce/views/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit(AuthController auth) async {
    try {
      await auth.submit();
      // ignore: use_build_context_synchronously
      //Navigator.of(context).pushNamed(AppRoutes.bottomNavbarPageRoute);
    } catch (e) {
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                title:
                    Text('error', style: Theme.of(context).textTheme.headline4),
                content: Text(
                  e.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('close')),
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AuthController>(
        // ignore: avoid_types_as_parameter_names
        builder: (_, model, __) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Builder(builder: (context) {
          return SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 46.0, horizontal: 32.0),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.authFormType == AuthFormType.login
                          ? 'Login'
                          : 'Register',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(
                      height: 64.0,
                    ),
                    TextFormField(
                      controller: _emailController,
                      focusNode: _emailFocusNode,
                      onEditingComplete: () => FocusScope.of(context)
                          .requestFocus(_passwordFocusNode),
                      textInputAction: TextInputAction.next,
                      onChanged: model.updateEmail,
                      validator: (val) =>
                          val!.isEmpty ? 'please enter your email' : null,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your Email',
                      ),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      focusNode: _passwordFocusNode,
                      onChanged: model.updatePass,
                      obscureText: true,
                      validator: (val) =>
                          val!.isEmpty ? 'Please enter your password' : null,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter your Password',
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    if (model.authFormType == AuthFormType.login)
                      Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          child: const Text('Forgot your password?'),
                          onTap: () {},
                        ),
                      ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    MainButton(
                        text: model.authFormType == AuthFormType.login
                            ? 'Login'
                            : 'Register',
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            _submit(model);
                          }
                        }),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                          child: Text(model.authFormType == AuthFormType.login
                              ? 'Don\'t have an account? Register'
                              : 'Have an account? Login'),
                          onTap: () {
                            _formkey.currentState!.reset();
                            model.toggleFormType();
                          }),
                    ),
                    const Spacer(),
                    /* SizedBox(
                      height: size.height * 0.15,
                    ),*/
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                          model.authFormType == AuthFormType.login
                              ? 'or login with'
                              : 'or   register with',
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white),
                          child: const Icon(Icons.facebook),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: Colors.white),
                          child: const Icon(Icons.email),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }),
      );
    });
  }
}
