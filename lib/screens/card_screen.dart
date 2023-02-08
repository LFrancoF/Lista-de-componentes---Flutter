import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarjetas'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCard1(),
          SizedBox(height: 20),
          CustomCard2(
            imageUrl: 'https://static0.gamerantimages.com/wordpress/wp-content/uploads/2022/07/assasins-creed-logo.jpg',
            title: 'Assassins Creed',
          ),
          SizedBox(height: 20),
          CustomCard2(
            imageUrl: 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/styles/hc_1440x810/public/media/image/2018/03/super-smash-bros.png?itok=kzDMPFxB',
            title: 'Super Smash Bros',
          ),
          SizedBox(height: 20),
          CustomCard2(
            imageUrl: 'https://cdn.alfabetajuega.com/alfabetajuega/abj_public_files/multimedia/imagenes/201607/156091.alfabetajuega-god-of-war-logo-090616.jpg',
            title: 'God of War',
          ),
          SizedBox(height: 20),
          CustomCard2(
            imageUrl: 'https://i.pinimg.com/originals/56/7c/c4/567cc4f86e28e11138b58903690ed8cd.jpg',
            title: 'Grand Theft Auto V',
          ),
          SizedBox(height: 100),
        ],
      )
    );
  }
}