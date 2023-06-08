import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:mi_proyecto/helpers/mostrar_alerta.dart';
import 'package:mi_proyecto/providers/company/company_provider.dart';
import 'package:mi_proyecto/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../../models/company/company_model.dart';
import '../../models/company/company_response.dart';
import '../../models/company/company_response_login.dart';
import '../../models/job_offer/job_offer_model.dart';
import 'package:http/http.dart' as http;

class JobDetailsScreen extends StatefulWidget {

  JobDetailsScreen({
    super.key,
    });

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> {
  late Future<CompanyResponse> details;

  Future<CompanyResponse> getCompany(int id) async {
    var url = Uri.parse('https://jobagdb.azurewebsites.net/api/Company/Get?companyId=$id');
    print(url);
    final response = await http.get(url);
    print(response.body);
    final companyResponse = CompanyResponse.fromJson(response.body);
    return companyResponse;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final JobOffer jobOffer = ModalRoute.of(context)!.settings.arguments as JobOffer;
    details = getCompany(jobOffer.companyId);
    print(details);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final JobOffer jobOffer = ModalRoute.of(context)!.settings.arguments as JobOffer;


    return FutureBuilder<CompanyResponse>(
      future: details,
      builder: (context, snapshot) {
        if (snapshot.hasError) 
        {
          final error = snapshot.error;
          return Text('$error');
        }
        else if (snapshot.hasData) {
          CompanyResponse respuesta = snapshot.data!;
            return Scaffold(
              body: CustomScrollView(
                  slivers: [
                    _CustomAppBar(jobOffer),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        _CompanyPicture( company: respuesta.data),
                        _Overview(jobOffer)
                      ]
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                            title: 'Postular',
                            action: () {
                              mostrarAlerta(context, 'Mensaje', 'Has postulado a este trabajo');
                            },
                          ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return const CircularProgressIndicator();
            }
          }
        );
      }
    }

class _CustomAppBar extends StatelessWidget {
  final JobOffer jobOffer;
  const _CustomAppBar(this.jobOffer);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only( bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            jobOffer.title,
            style: TextStyle( fontSize: 16 ),
            textAlign: TextAlign.center,
          ),
        ),

        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(jobOffer.bannerPicture),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  final JobOffer jobOffer;

  const _Overview(this.jobOffer);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sueldo: S/. ${jobOffer.wage}',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(
            jobOffer.description,
            textAlign: TextAlign.justify,
            style: Theme.of(context).textTheme.subtitle1,
        ),

        ]
      )
    );
  }
}

class _CompanyPicture extends StatelessWidget {
  final Company company;

  const _CompanyPicture({Key? key, required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of( context ).size;
    return Container(
      margin: EdgeInsets.only( top: 20 ),
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(company.profilePicture),
              height: 100,
              width: 110,
            ),
          ),
          SizedBox(width: 20),

          ConstrainedBox(
            constraints: BoxConstraints( maxWidth: size.width-190 ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company.companyName, maxLines: 2),
                Text(company.description, maxLines: 2)
              ],
            ),
          )
        ],
      ),
    );
  }
}
