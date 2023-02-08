import 'package:componentes_flutter/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCard2 extends StatelessWidget {

  final String imageUrl;
  final String title;
  
  const CustomCard2({super.key, required this.imageUrl, this.title='Videojuego'});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
      elevation: 10,
      shadowColor: AppTheme.primaryColor.withOpacity(0.5),
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(imageUrl),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),

          //if (title != 'Videojuego')  condicion por si no queremos mostrar ningun texto cuando no se envie como parametro
          Container(
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
            child: Text(title)
            //child: Text(title ?? 'Videojuego')    ->otra forma de colocar valor por defecto si es que no se envia el parametro y no esta definido en el constructor
          )

        ],
      ),
    );
  }
}