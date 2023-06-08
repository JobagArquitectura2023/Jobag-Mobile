import 'package:flutter/material.dart';
import 'package:mi_proyecto/providers/company/company_provider.dart';
import 'package:mi_proyecto/screens/screens.dart';
import 'package:provider/provider.dart';

import '../../providers/postulant/postulant_provider.dart';


class CompanySideBar extends StatelessWidget {
  const CompanySideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          _Account(),

          _SideBarOption(
            icon: Icons.home,
            title: 'Home',
            navigateFunction: () => Navigator.pushNamed(context, 'home_screen')
          ),
          Divider(),
          
          //_SideBarOption(
          //  icon: Icons.person,
          //  title: 'Mi Perfil',
          //  navigateFunction: () => Navigator.pushNamed(context, 'employee_profile')
          //),
          //Divider(),

          _SideBarOption(
            icon: Icons.man,
            title: 'Perfil de Trabajo',
            navigateFunction: () => Navigator.pushNamed(context, 'employee_job_profile')
          ),
          Divider(),

          _SideBarOption(
            icon: Icons.work,
            title: 'Mis trabajos',
            navigateFunction: () => Navigator.pushNamed(context, 'employee_saved_jobs')
          ),
          Divider(),
          
          _SideBarOption(
            icon: Icons.notifications,
            title: 'Notificaciones',
            navigateFunction: () => Navigator.pushNamed(context, 'employee_notifications')
          ),
          Divider(),
          
          _SideBarOption(
            icon: Icons.settings,
            title: 'Configuraciones',
            navigateFunction: () => Navigator.pushNamed(context, 'employee_settings')
          ),
          Divider(),

          _SideBarOption(
            icon: Icons.logout,
            color: Colors.red,
            title: 'Salir',
            navigateFunction: () { Navigator.pushReplacementNamed(context, 'login_screen'); PostulantServiceProvider.deleteToken(); }
          ),
        ],
      ),
    );
  }
}

class _SideBarOption extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String title;
  final VoidCallback navigateFunction;

  const _SideBarOption({
    Key? key,
    required this.icon,
    this.color = Colors.indigo,
    required this.title,
    required this.navigateFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.icon),
      iconColor: this.color,
      textColor: this.color,
      title: Text(this.title),
      onTap: () => navigateFunction(),
    );
  }
}

class _Account extends StatelessWidget {

  const _Account({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CompanyServiceProvider>(context);
    return UserAccountsDrawerHeader(
      accountName: Text(user.company.companyName),
      currentAccountPicture: CircleAvatar(
        child: ClipOval(
          child: Image.network(
            user.company.profilePicture,
            width: 90,
            height: 90,
            fit: BoxFit.cover
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        image: DecorationImage(
          image: NetworkImage(
            user.company.bannerPicture,
          ),
          fit: BoxFit.cover,
        )
      ), accountEmail: null,
    );
  }
}