import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
   
  const Listview2Screen({Key? key}) : super(key: key);

  final options = const['Assassins Creed', 'God of War', 'Elden Ring', 'Dark Souls'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Tipo 2')
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(options[i]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo),
          onTap: () {
            final opt = options[i];
            print(opt);
          },
        ),
        separatorBuilder: ( _ , __ ) => const Divider(),
        ),
    );
  }
}