import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login'),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
               TextFormField(
                 decoration: const InputDecoration(
                   labelText: 'Email',
                 ),
                 validator: (String? value) {
                   if (value == null || value.isEmpty) {
                     return 'Please, enter your email.';
                   }
                   return null;
                 },
                 controller: emailController,
               ),
                TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Password'
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please, enter your password.';
                      }
                      return null;
                    },
                  controller: passController,
                  obscureText: true,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passController.text);
                    }
                  },
                  child: const Text('Submit'),
                )
              ],
            )
          )
        ]
      ),
    );
  }
}
