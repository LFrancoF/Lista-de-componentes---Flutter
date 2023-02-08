import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
   
  const AvatarScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar'),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CircleAvatar(
              backgroundColor: Colors.indigo[900],
              child: const Text('LM'),
            ),
          )
        ],
      ),
      body: const Center(
         child: CircleAvatar(
          maxRadius: 100,
          backgroundImage: NetworkImage('https://www.diez.hn/binrepository/1200x675/0c0/0d0/none/3014757/GCJF/campeon-1_3340404_20221229162945.jpg'),
         ),
      ),
    );
  }
}