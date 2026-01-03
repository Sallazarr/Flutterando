import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';

  Widget _body() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 125,
                height: 125,
                child: Image.asset('assets/images/logo.png'),
              ),
              Container(height: 20),
              Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 20.0,
                    bottom: 12.0,
                  ),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (text) {
                          email = text;
                        },
                        // keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          border: OutlineInputBorder(),
                        ),
                      ),

                      SizedBox(height: 10),
                      TextField(
                        onChanged: (text) {
                          password = text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 15),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (email == 'email@email.com' && password == '123') {
                            // método sem o "routes" estabelecido
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(builder: (context) => HomePage()),
                            // );
                            Navigator.of(context).pushReplacementNamed('/home');
                          } else {
                            print('Invalid credentials');
                          }
                        },
                        child: Container(
                          width: double.infinity,
                          child: Text('Entrar', textAlign: TextAlign.center),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      //Stack empilha na ordem que for criado, se container red estiver antes do body ele dará aspecto de background, se não, cobrirá a frente
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset('assets/images/background.jpg', fit: BoxFit.cover),
        ),
        Container(color: Colors.black.withOpacity(0.15)),
        Scaffold(backgroundColor: Colors.transparent, body: _body()),
      ],
    );
  }
}
