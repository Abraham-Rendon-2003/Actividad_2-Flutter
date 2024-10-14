import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/login_image.jpg'),
            SizedBox(height: 20),
            TextField(
              controller: emailController, // Asigna el controlador
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController, // Asigna el controlador
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica de inicio de sesión
              },
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () async {
                String emailAddress = emailController.text;
                String password = passwordController.text;

                try {
                  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: emailAddress,
                    password: password,
                  );
                  print('Usuario creado: ${credential.user!.email}');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('La contraseña es muy débil.');
                  } else if (e.code == 'email-already-in-use') {
                    print('La cuenta ya existe con ese correo.');
                  }
                } catch (e) {
                  print(e);
                }

                Navigator.pushNamed(context, '/forgot_password');
              },
              child: Text('¿Olvidaste tu contraseña?'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Limpia los controladores cuando la pantalla se destruya
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
