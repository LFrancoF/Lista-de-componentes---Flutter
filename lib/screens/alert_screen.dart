import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  
  //Mostrar Cuadro de dialogo de IOS
  void displayDialogIOS(BuildContext context){
    showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Dialogo', style: TextStyle(fontSize: 22)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const[
              Text('Ha abierto un cuadro de Dialogo con un logo de flutter :)', style: TextStyle(fontSize: 17)),
              SizedBox(height: 20),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.red),),
              onPressed: () => Navigator.pop(context)
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context)
            )
          ],
        );
      },
    );
  }
  
  //Mostrar Cuadro de dialogo de Android
  void displayDialogAndroid(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) 
          ),
          title: const Text('Dialogo', style: TextStyle(fontSize: 25)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const[
              Text('Ha abierto un cuadro de Dialogo con un logo de flutter :)', style: TextStyle(fontSize: 18)),
              SizedBox(height: 20),
              FlutterLogo(size: 100),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Colors.red),),
              onPressed: () => Navigator.pop(context)
            ),
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.pop(context)
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Mostrar Alerta', style: TextStyle(fontSize: 18),),
          ),
        //  onPressed: () => displayDialogAndroid(context)
          onPressed: () => Platform.isAndroid
            ? displayDialogAndroid(context)
            : displayDialogIOS(context)
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        onPressed: () => Navigator.pop(context)
      ),
    );
  }
}