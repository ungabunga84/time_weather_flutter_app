import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {
    
    data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    print(data);


    //set background
    String bgImage = data['isDayTime'] ? 'day3.jpg' : 'night2.jpg';
    Color? bgColor = data['isDayTime'] ? Colors.blue : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  TextButton.icon(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': result['time'],
                            'date': result['date'],
                            'location': result['location'],
                            'isDayTime': result['isDayTime'],
                            'flag': result['flag']
                          };
                        });},
                      icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                      label: Text('Edit Location', style: TextStyle(color: Colors.grey[300]),)),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),)
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(data['date'],
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                          )),
                      SizedBox(height: 20),
                      Text(data['time'],
                        style: TextStyle(
                          fontSize: 60.0,
                          color: Colors.white,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ))
    );
  }
}
