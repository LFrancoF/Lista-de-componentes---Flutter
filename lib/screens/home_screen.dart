import 'package:flutter/material.dart';

import 'package:componentes_flutter/router/app_routes.dart';
import 'package:componentes_flutter/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menu = AppRoute.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          //leading: Icon(menu[index].icon, color: Theme.of(context).primaryColor), otra forma de obtener el color
          leading: Icon(menu[index].icon, color: AppTheme.primaryColor),
          title: Text(menu[index].name),
          onTap: () {
            
            /* final route = MaterialPageRoute(
              builder: (context) => const Listview1Screen()
              );
            Navigator.push(context, route); */

            Navigator.pushNamed(context, menu[index].route);
            
          },
        ),
        separatorBuilder: ( _ , __ ) => const Divider(),
        itemCount: menu.length
        )
    );
  }
}