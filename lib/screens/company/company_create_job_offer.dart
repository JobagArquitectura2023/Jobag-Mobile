import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mi_proyecto/providers/company/company_provider.dart';
import 'package:mi_proyecto/providers/job_offer/job_offers_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/mostrar_alerta.dart';
import '../../models/job_offer/job_offer_model.dart';

class CreateJobOffer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _Form(),
              ],
            ),
          ),
        ),
      )
   );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {

  final titleCtrl         = TextEditingController();
  final descriptionCtrl   = TextEditingController();
  final wageCtrl          = TextEditingController();
  final snippetCtrl       = TextEditingController();
  final bannerPictureCtrl = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final companyService = Provider.of<CompanyServiceProvider>( context );
    final jobOfferService = Provider.of<JobOfferProvider>( context );

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric( horizontal: 50 ),
       child: Column(
         children: <Widget>[
           
           CustomInput(
             placeholder: 'Título',
             keyboardType: TextInputType.emailAddress, 
             textController: titleCtrl,
           ),

           CustomInput(
             placeholder: 'Descripción',
             textController: descriptionCtrl,
           ),

           CustomInput(
             placeholder: 'Salario',
             textController: wageCtrl,
           ),

           CustomInput(
             placeholder: 'Snippet',
             textController: snippetCtrl,
           ),

           CustomInput(
             placeholder: 'Foto de portada',
             textController: bannerPictureCtrl,
           ),
           

           BotonAzul(
             text: 'Ingrese',
             onPressed: () {
              JobOffer newJobOffer = new JobOffer(
                title         : titleCtrl.text.trim(),
                description   : descriptionCtrl.text.trim(),
                wage          : int.parse(wageCtrl.text.trim()),
                snippet       : snippetCtrl.text.trim(),
                bannerPicture : bannerPictureCtrl.text.trim(),
                hasHired      : false,
                companyId     : companyService.company.id
                ); 
              jobOfferService.createJobOffer(newJobOffer);
             }
           )
         ],
       ),
    );
  }
}

class BotonAzul extends StatelessWidget {

  final String text;
  final Function onPressed;

  const BotonAzul({
    Key? key, 
    required this.text, 
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(Colors.indigo)
      ),
        // elevation: 2,
        // highlightElevation: 5,
        // color: Colors.blue,
        // shape: StadiumBorder(),
        onPressed: () => this.onPressed(),
        child: Container(
          width: double.infinity,
          height: 55,
          child: Center(
            child: Text( this.text , style: TextStyle( color: Colors.white, fontSize: 17 )),
          ),
        ),
    );
  }
}

class CustomInput extends StatelessWidget {

  final IconData? icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput({
    Key? key, 
    this.icon, 
    required this.placeholder, 
    required this.textController, 
    this.keyboardType = TextInputType.text, 
    this.isPassword = false
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only( top: 5, left: 5, bottom: 5, right: 20 ),
      margin: EdgeInsets.only( bottom: 20 ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, 5),
            blurRadius: 5
          )
        ]
      ),
      child: TextField(
        controller: this.textController,
        autocorrect: false,
        keyboardType: this.keyboardType,
       obscureText: this.isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon( this.icon, color: Colors.indigo,),
        focusedBorder: InputBorder.none,
        border: InputBorder.none,
        hintText: this.placeholder
      ),
      ),
    );
  }
}