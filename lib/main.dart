import 'package:flutter/material.dart';
import 'package:mi_proyecto/providers/company/company_provider.dart';
import 'package:mi_proyecto/providers/job_offer/job_offers_provider.dart';
import 'package:mi_proyecto/providers/postulant/postulant_provider.dart';
import 'package:mi_proyecto/screens/employee/postulant_job_profile.dart';
import 'package:mi_proyecto/screens/employee/postulant_notifications.dart';
import 'package:mi_proyecto/screens/employee/postulant_saved_jobs.dart';
import 'package:mi_proyecto/screens/employee/postulant_home_screen.dart';
import 'package:mi_proyecto/screens/screens.dart';
import 'package:mi_proyecto/screens/session/company/log_in_screen_company.dart';
import 'package:mi_proyecto/screens/session/postulant/log_in_screen_postulant.dart';
import 'package:mi_proyecto/screens/session/postulant_employer_register.dart';
import 'package:mi_proyecto/screens/session/postulant/register_screen_postulant.dart';
import 'package:mi_proyecto/widgets/widgets.dart';
import 'package:provider/provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => PostulantServiceProvider(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => JobOfferProvider(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => CompanyServiceProvider(), lazy: false)
      ],
      child: MyApp(),
      );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      initialRoute: 'login_screen',
      routes: {
        'login_screen'            : ( _ ) => LoginPostulant(),
        'register_screen'         : ( _ ) => RegisterScreen(),
        'home_screen'             : ( _ ) => HomeScreen(),
        'job_details_screen'      : ( _ ) => JobDetailsScreen(),
        'employee_profile'        : ( _ ) => ProfilePage(),
        'employee_settings'       : ( _ ) => SettingsPage(),
        'employee_job_profile'    : ( _ ) => JobProfilePage(),
        'employee_saved_jobs'     : ( _ ) => EmployeeSavedJobs(),
        'employee_notifications'  : ( _ ) => EmployeeNotifications(),
        'role_screen'             : ( _ ) => ChooseRoleScreen(),
        'company_login'           : ( _ ) => LoginCompany()
      }
    );
  }
}