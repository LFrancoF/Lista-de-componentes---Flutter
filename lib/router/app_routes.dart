import 'package:flutter/material.dart';

import 'package:componentes_flutter/models/models.dart';
import '../screens/screens.dart';

class AppRoute {

  static const initialRoute = 'home';

  // Metodo alternativo con una clase modelo para crear las rutas y armar el mapa
  static final menuOptions = <MenuOption>[
    //Home no necesario mostrar en el menu
    //MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home_rounded),
    MenuOption(route: 'listview1', name: 'ListView Tipo 1', screen: const Listview1Screen(), icon: Icons.list_alt),
    MenuOption(route: 'listview2', name: 'ListView Tipo 2', screen: const Listview2Screen(), icon: Icons.list),
    MenuOption(route: 'alert', name: 'Alertas - Alerts', screen: const AlertScreen(), icon: Icons.warning_amber),
    MenuOption(route: 'card', name: 'Tarjetas - Cards', screen: const CardScreen(), icon: Icons.credit_card),
    MenuOption(route: 'avatar', name: 'Circle Avatar', screen: const AvatarScreen(), icon: Icons.supervised_user_circle_outlined),
    MenuOption(route: 'animated', name: 'Animated Container', screen: const AnimatedScreen(), icon: Icons.play_circle_outline_rounded),
    MenuOption(route: 'inputs', name: 'Text Inputs', screen: const InputsScreen(), icon: Icons.input_rounded),
    MenuOption(route: 'slider', name: 'Slider && Checks', screen: const SliderScreen(), icon: Icons.slow_motion_video_rounded),
    MenuOption(route: 'listviewbuilder', name: 'Infinite Scroll & Pull to refresh', screen: const ListViewBuilderScreen(), icon: Icons.build_circle_outlined)
  ];

  static Map<String, Widget Function(BuildContext context)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes = {};
    //primero añadimos el mapa de Home a nuestro mapa de rutas, porque si no el home no existiria
    appRoutes.addAll({'home' : (context) => const HomeScreen()});

    for (var opt in menuOptions) {
      appRoutes.addAll({ opt.route : (context) => opt.screen });
    }
    return appRoutes;

  }

  /* Metodo normal para crear el mapa de rutas
  static Map<String, Widget Function(BuildContext)> routes = {
        'home'      : (context) => const HomeScreen(),
        'listview1' : (context) => const Listview1Screen(),
        'listview2' : (context) => const Listview2Screen(),
        'alert'     : (context) => const AlertScreen(),
        'card'      : (context) => const CardScreen(),
  }; */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) => MaterialPageRoute(
          builder: (context) => const AlertScreen(),
        );

}