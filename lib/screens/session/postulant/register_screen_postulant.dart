import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/postulant/postulant_provider.dart';
import '../../../ui/input_decoration.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Registrarse'),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView
      (
        child: Column(
          children: [
            
            
          ]
        )
      )
    );
  }
}

 class _RegisterForm extends StatelessWidget {
   
   @override
   Widget build(BuildContext context) {
     final user = Provider.of<PostulantServiceProvider>(context);

     return Form(
       autovalidateMode: AutovalidateMode.onUserInteraction,
       child: Container(
         margin: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
         child: Column(
           children: [
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'John',
                   labelText: 'Nombre',
                 ),
                 onChanged: ( value ) {
                  }
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Doe',
                   labelText: 'Apellido',
                 ),
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: '987654321',
                   labelText: 'Número telefónico',
                 ),
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Esta foto será tu perfil',
                   labelText: 'Foto de perfil',
                 ),
             ),
             TextFormField(
                 autocorrect: false,
                 decoration: InputDecorations.authInputDecoration(
                   hintText: 'Esta foto será tu portada',
                   labelText: 'Foto de portada',
                 ),
             ),
             DropdownButtonFormField<String>(
               decoration: InputDecorations.authInputDecoration(hintText: 'Empleador', labelText: 'Rol'),
               items: [
                 DropdownMenuItem(value: 'empleador', child: Text('Empleador')),
                 DropdownMenuItem(value: 'postulante', child: Text('Postulante')),
               ],
               onChanged: ( value ) {
               },
             ),
             SizedBox(height: 50),
             SizedBox(
                 width: 350,
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.indigo,
                   ),
                   child: Text(
                     'Registrarse',
                     style: TextStyle(
                       color: Colors.white
                     ),
                     ),
                   onPressed: () async {
                     user.updatePostulant(user.postulant);
                   },
                 ),
               )
           ],
         ),
       ),
     );
   }
 }