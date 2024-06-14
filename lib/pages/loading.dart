import 'package:flutter/material.dart';
import 'package:timezone/services/time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {



  void SetUpWorldTime() async
  {
    WorldTime instance = WorldTime(location : 'Berlin' , flag: 'germany.png' , urf: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home' , arguments: {
      'location' : instance.location,
      'flag' : instance.flag,
      'time' : instance.time,
      'isDaytime' : instance.isDaytime,
    }
    );
  }

  void initState()
  {
    super.initState();
    SetUpWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitThreeInOut(
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
