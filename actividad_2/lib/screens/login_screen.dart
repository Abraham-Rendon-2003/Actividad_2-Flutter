import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rflutter_alert/rflutter_alert.dart'; // Importar rflutter_alert

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Método para mostrar alertas con rflutter_alert
  void _showAlert(String title, String message, AlertType type) {
    Alert(
      context: context,
      type: type,
      title: title,
      desc: message,
      buttons: [
        DialogButton(
          child: Text(
            "OK",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

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
              controller: emailController,
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Contraseña'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;

                if (email.isEmpty || password.isEmpty) {
                  _showAlert('Error', 'Por favor completa todos los campos', AlertType.error);
                  return;
                }

                try {
                  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  if (userCredential.user != null) {
                    print('Inicio de sesión exitoso: ${userCredential.user!.email}');
                    _showAlert('Éxito', 'Inicio de sesión exitoso', AlertType.success);

                    Navigator.pushNamed(context, '/restaurant_list');
                  } else {
                    print('No se pudo iniciar sesión, el usuario es nulo.');
                    _showAlert('Error', 'Error al iniciar sesión', AlertType.error);
                  }
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No se encontró un usuario con ese correo.');
                    _showAlert('Error', 'No se encontró un usuario con ese correo.', AlertType.error);
                  } else if (e.code == 'wrong-password') {
                    print('Contraseña incorrecta.');
                    _showAlert('Error', 'Contraseña incorrecta.', AlertType.error);
                  } else {
                    print('OOOOOps: ${e.message}');
                    _showAlert('Error', 'Ooooooooops: ${e.message}', AlertType.error);
                  }
                } catch (e) {
                  print('Error desconocido: $e');
                  _showAlert('Error', 'Ha ocurrido un error desconocido.', AlertType.error);
                }
              },
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
