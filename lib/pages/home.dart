import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {"location": "Berlin"};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)?.settings.arguments as Map;
    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/${bgImage}'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0, 0.0, 0.0),
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/location');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.edit_location,
                            color: Colors.grey[300],
                          ),
                          Text(
                              "Edit Location",
                            style: TextStyle(
                              color: Colors.grey[300],
                            ),
                          ),
                        ],
                      ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                         data['location'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 66.0
                    ),
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}
