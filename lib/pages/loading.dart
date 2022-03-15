import 'package:flutter/material.dart';
import 'package:worldweather/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';




class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void setupWorldTime() async {

    WorldTime instance = WorldTime(location: 'New York', flag: 'usa.png', url: 'America/New_York');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDayTime': instance.isDayTime,

    });


  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitPulse(
          color: Colors.white,
          size: 200.0,
        ),

      ),
      );
      }
}
