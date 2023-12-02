import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagePerfil extends StatefulWidget {
  const PagePerfil({
    super.key,
  });

  @override
  State<PagePerfil> createState() => _PagePerfilState();
}

class _PagePerfilState extends State<PagePerfil> {
  bool _stateSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/batman.png'),
                radius: 100,
              ),
              SizedBox(height: 30),
              Text(
                'Wanderson',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "20 anos",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 32,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Configurações",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.notifications_outlined,
                        size: 32,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Notificações",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: _stateSwitch,
                            onChanged: (newValue) {
                              setState(() {
                                _stateSwitch = newValue;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  side: BorderSide(width: 1, color: Colors.black),
                ),
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 32,
                        color: Colors.black,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
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
}
