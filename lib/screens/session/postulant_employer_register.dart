import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          const _RoleCard(
            description: 'Empleador',
            imageUrl: 'https://www.nicepng.com/png/detail/674-6741279_employer-icon.png',
            route: 'home_screen'
            ),
          const _RoleCard(
            description: 'Postulante',
            imageUrl: 'https://www.kindpng.com/picc/m/255-2553833_employee-icon-png-white-employee-icon-png-transparent.png',
            route: 'home_screen'
            )
          ],
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String description;
  final String imageUrl;
  final String route;
  
  const _RoleCard({
    Key? key,
    required this.route,
    required this.description,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, route),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
         child: Column(
           children: <Widget>[
            Row(
               children: <Widget>[
                Container(
                           width: 140.0,
                           height: 140.0,
                           decoration: BoxDecoration(
                             shape: BoxShape.circle,
                             image: DecorationImage(
                               image: NetworkImage(
                                   imageUrl),
                               fit: BoxFit.cover,
                             ),
                           )),
                Container(
                  width: 200,
                   child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.indigo,
                      fontWeight: FontWeight.bold,
                    ),
                    
                    ),
                 ),
               ],
             ),
           ],
         ),
       ),
    );
  }
}