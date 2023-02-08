import 'package:flutter/material.dart';
import 'package:componentes_flutter/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
    
    //un mapa con valores por defecto, que se asignaran valores del form para capturarlos al dar click en el boton
    final Map<String, String> formValues = {
      'first_name' : 'Gustavo',
      'last_name'  : 'Franco',
      'email'      : 'gustavo@gmail.com',
      'password'   : '123456',
      'rol'        : 'Admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs y Forms'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Nombre',
                  hintText: 'Nombre de Usuario', 
                  //helperText: 'Nombre de Usuario',
                  formProperty: 'first_name', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
          
                CustomInputField(
                  labelText: 'Apellido',
                  hintText: 'Apellido de Usuario',
                  //helperText: 'Apellido de Usuario',
                  formProperty: 'last_name', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
          
                CustomInputField(
                  labelText: 'Correo',
                  hintText: 'Correo del Usuario',
                  keyboardType: TextInputType.emailAddress,
                  formProperty: 'email', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),
          
                CustomInputField(
                  labelText: 'Contraseña',
                  hintText: 'Contraseña del Usuario',
                  obscureText: true,
                  formProperty: 'password', 
                  formValues: formValues,
                ),
                const SizedBox(height: 30,),

                DropdownButtonFormField(
                  items: const[
                    DropdownMenuItem(value: 'Admin', child: Text('Admin'),),
                    DropdownMenuItem(value: 'Super User', child: Text('Super User'),),
                    DropdownMenuItem(value: 'Developer', child: Text('Developer'),),
                    DropdownMenuItem(value: 'Tester', child: Text('Tester'),)
                  ], 
                  onChanged: (value) {
                    print(value);
                    formValues['rol'] = value ?? 'Admin';  //si value es nulo entonces se asigna 'Admin'
                  },
                ),
          
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Guardar'))
                  ),
                  onPressed: () {

                    FocusManager.instance.primaryFocus?.unfocus();

                    if (!myFormKey.currentState!.validate()) {
                      print('Form no valido');
                      return;
                    }

                    print(formValues);
                  },
                )
              ],
            ),
          ),
        ),
          
      )
    );
  }
}