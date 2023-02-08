import 'package:flutter/material.dart';

import 'package:componentes_flutter/themes/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sladerEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider && Checks'),
      ),
      body: Column(
        children: [
          Slider.adaptive(  //adaptive para que se adapte el estilo segun la plataforma IOS o Android
            min: 50, max: 400,
            value: _sliderValue, 
            activeColor: AppTheme.primaryColor,
            onChanged: _sladerEnabled 
              ? (value) => setState(() => _sliderValue = value)
              : null
          ),

          Checkbox(
            value: _sladerEnabled, 
            onChanged: (value) => setState(() => _sladerEnabled = value ?? true)
          ),

          CheckboxListTile(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primaryColor,
            value: _sladerEnabled, 
            onChanged: (value) => setState(() => _sladerEnabled = value ?? true)
          ),

          Switch(
            value: _sladerEnabled, 
            onChanged: (value) => setState(() => _sladerEnabled = value)
          ),

          SwitchListTile.adaptive(
            title: const Text('Habilitar Slider'),
            activeColor: AppTheme.primaryColor,
            value: _sladerEnabled, 
            onChanged: (value) => setState(() => _sladerEnabled = value)
          ),

          const AboutListTile(applicationName: 'Components App'),

          Expanded(  //expande el widget que contiene este expanded para que el widget child entre, en este caso, expande el column para que la imagen pueda entrar y asi hacer scroll
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage('https://static.wikia.nocookie.net/p__/images/c/c2/HWAoC_Zelda_Artwork.png/revision/latest?cb=20201102173619&path-prefix=protagonist'),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),

          const SizedBox(height: 50)
        ],
      )
    );
  }
}