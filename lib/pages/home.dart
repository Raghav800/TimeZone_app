import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map da = {};

  @override
  Widget build(BuildContext context)
  {
  da = da.isNotEmpty ? da : ModalRoute.of(context)?.settings.arguments as Map ?? {};
  print(da);

  String bgImage = da['isDaytime'] ? 'day.png' : 'night.png';
  Color bgColor = da['isDaytime'] ? Colors.blue! : Colors.indigo[700]!;




  return Scaffold(
    backgroundColor: bgColor,
      body : SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: [
                OutlinedButton.icon(onPressed: () async {
                  dynamic result =  await Navigator.pushNamed(context, '/location');
                  setState(() {
                    da = {
                      'location' : result['location'],
                      'flag' : result['flag'],
                      'time' : result['time'],
                      'isDaytime' : result['isDaytime']
                    };
                  });



                },
                    icon: Icon(
                        Icons.edit_location,
                       color: Colors.grey[300],
                    ),
                    label: Text('edit location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      da['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  da['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
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
