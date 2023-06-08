import 'package:flutter/material.dart';

import '../models/job_offer/job_offer_model.dart';


class JobOfferCard extends StatelessWidget {
 
 final VoidCallback saveFunction;
 final VoidCallback viewFunction;
 final Color? color;
 final IconData? icon1;
 final IconData? icon2;
 final List<JobOffer> jobOffersNow;

  const JobOfferCard({
    Key? key,
    required this.saveFunction,
    required this.viewFunction,
    required this.jobOffersNow,
    this.color = Colors.indigo,
    this.icon1 = Icons.share,
    this.icon2 = Icons.favorite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: jobOffersNow.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 20,
          margin: const EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Column(
            children: [
              Image(
                image: NetworkImage(jobOffersNow[index].bannerPicture),
                ),
  
              ListTile(
                title: Text(jobOffersNow[index].title),
                subtitle: Text(jobOffersNow[index].snippet),
              ),
  
              Padding(
                padding: const EdgeInsets.only( left: 10 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () { Navigator.pushNamed(context, 'job_details_screen', arguments: jobOffersNow[index]);},
                      child: Text(
                        'Ver más',
                        style: TextStyle(
                          color: color,
                        ),
                      ),
                    ),
                    Expanded(child: Container(),),
                    IconButton(onPressed: (){}, icon: Icon(icon1, color: color,)),
                    IconButton(onPressed: (){}, icon: Icon(icon2, color: color))
                  ],
                ),
              )
  
            ],
          )
    );    
  });
}
