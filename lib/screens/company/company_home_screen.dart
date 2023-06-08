import 'package:flutter/material.dart';
import 'package:mi_proyecto/screens/employee/postulant_sidebar_menu_screen.dart';
import 'package:mi_proyecto/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/job_offer/job_offers_provider.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final jobOffers = Provider.of<JobOfferProvider>(context);
    
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon( Icons.add),
        onPressed: () {
          
        },
      ),
      appBar: AppBar(
        title: const Text('Jobag'),
        backgroundColor: Colors.indigo,
      ),
      drawer: const SidebarMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                'Bolsa de Trabajo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.indigo
                ),
              ),
            ),
          ),
          JobOfferCard(
            jobOffersNow: jobOffers.currentJobOffers,
            saveFunction: (){},
            viewFunction: (){ Navigator.pushNamed(context, 'job_details_screen', arguments: jobOffers); },
            ),
        ],
        ),
      ),
    );
  }
}