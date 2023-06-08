import 'package:flutter/material.dart';
import 'package:mi_proyecto/screens/employee/postulant_sidebar_menu_screen.dart';
import 'package:mi_proyecto/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/job_offer/job_offers_provider.dart';
import '../../providers/postulant/postulant_provider.dart';

class EmployeeSavedJobs extends StatefulWidget {

  const EmployeeSavedJobs({Key? key}) : super(key: key);

  @override
  State<EmployeeSavedJobs> createState() => _EmployeeSavedJobs();
}

class _EmployeeSavedJobs extends State<EmployeeSavedJobs> {
  @override
  Widget build(BuildContext context) {
    final jobOffers = Provider.of<JobOfferProvider>(context);
    final user = Provider.of<PostulantServiceProvider>(context);
    
    return Scaffold(
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
                'Trabajos Guardados',
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