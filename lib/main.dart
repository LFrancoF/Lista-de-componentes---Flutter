import 'package:flutter/material.dart';

import 'package:componentes_flutter/router/app_routes.dart';
import 'package:componentes_flutter/themes/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: const Listview2Screen(),
      initialRoute: AppRoute.initialRoute,
      routes: AppRoute.getAppRoutes(),
      // onGenerateRoute: (settings) => AppRoute.onGenerateRoute(settings)   Para no enviar 2 veces el mismo parametro 'settings' podemos obviarlo como esta en la sgte linea
      onGenerateRoute: AppRoute.onGenerateRoute,  //solo mandamos la referencia a la funcion
      theme: AppTheme.lightTheme
    );
  }
}