import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {"location": "Berlin", "flag": "uk.png", "url": "Europe/London",
              "isDayTime": true, "time": "18:00"};

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    setState(() {
      Map? aux = ModalRoute.of(context)?.settings.arguments as Map?;
      data = aux ?? data;
    });
  }

  @override
  Widget build(BuildContext context) {

    print(data);

    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color bgColor = data['isDayTime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0,120.0, 0.0, 0.0),
          child: SafeArea(
              child: Column(
                children: <Widget>[
                  TextButton(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');

                        setState(() {
                          data = {
                            'time': result['time'],
                            'flag': result['flag'],
                            'isDayTime': result['isDayTime'],
                            'location': result['location']
                          };
                        });
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
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                         data['location'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    data['time'] ?? "12",
                    style: const TextStyle(
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
