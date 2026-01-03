import 'package:flutter/material.dart';
import 'package:ola_mundo/app_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

int counter = 0;

class HomePageState extends State<HomePage> {
  // int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.network(
                  'https://media.licdn.com/dms/image/v2/D4D03AQEqmTpw91Ph_Q/profile-displayphoto-shrink_200_200/B4DZY5cB6QGwAY-/0/1744720372895?e=1769040000&v=beta&t=yosclHxF8rrZw9dOAkaE_93ZDPk_y2aQHHbx7DYvWGM',
                ),
              ),
              accountName: Text('Henrique Salazar'),
              accountEmail: Text('email@email.com'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              subtitle: Text('tela inicial'),
              onTap: () {
                print('Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Logout'),
              subtitle: Text('Finalizar sessão'),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('/');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('HomePage'), actions: [CustomSwitch()]),

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            Text('Contador: $counter'),
            Container(height: 10),
            CustomSwitch(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(width: 50, height: 50, color: Colors.black),
                Container(width: 50, height: 50, color: Colors.black),
                Container(width: 50, height: 50, color: Colors.black),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: appController.instance.isDarkTheme,
      onChanged: (value) {
        appController.instance.changeTheme();
      },
    );
  }
}
