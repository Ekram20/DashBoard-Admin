import 'package:ekram_project_dashboardadmin/models/appColors.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/acountsManagementScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/clinicsManagementScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/powersManagementScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/advertisementManagementScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/requstesToJointScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/advertisementRequestsScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/monthlyIncomeScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/profileManagementScreen.dart';
import 'package:ekram_project_dashboardadmin/sideBarScreen/specialitesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';




class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  Widget _selectedItem = accountsManagementScreen();

  screenSellector(item){
    switch (item.route){
      case requsesToJointScreen.routName:
      setState(() {
        _selectedItem = requsesToJointScreen();
      });
      
      break;
      case Specialitesscreen.routName:
      setState(() {
        _selectedItem = Specialitesscreen();
      });

      break;
      case clinicsManagementScreen.routName:
      setState(() {
        _selectedItem = clinicsManagementScreen();
      });

      break;
      case monthlyIncomeScreen.routName:
      setState(() {
        _selectedItem = monthlyIncomeScreen();
      });

      break;
      case PowerManagementScreen.routName:
      setState(() {
        _selectedItem = PowerManagementScreen();
      });

      break;
      case advertisementManagementScreen.routName:
      setState(() {
        _selectedItem = advertisementManagementScreen();
      });

      break;
      case advertisementRequestsScreen.routName:
      setState(() {
        _selectedItem = advertisementRequestsScreen();
      });

      break;
      case profileManagementScreen.routName:
      setState(() {
        _selectedItem = profileManagementScreen();
      });

      break;
      case accountsManagementScreen.routName:
      setState(() {
        _selectedItem = accountsManagementScreen();
      });
      
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar:AppBar(
        backgroundColor: AppColors.primaryColor,
        title:Text('DashBoard for Admin') ,
      ) ,
      sideBar: SideBar(
        items: [
          AdminMenuItem(title: 'Account Management' ,
           icon :Icons.settings,
           route:accountsManagementScreen.routName,
           ),
           AdminMenuItem(title: 'Powers Management' ,
           icon :Icons.add_moderator_outlined,
           route: PowerManagementScreen.routName
           ),
          AdminMenuItem(title: 'Requests To Join ' ,
           icon :Icons.dashboard,
           route: requsesToJointScreen.routName
           ),
           AdminMenuItem(title: 'Clinic Management ' ,
           icon :CupertinoIcons.person_3,
           route: clinicsManagementScreen.routName
           ),
           AdminMenuItem(title: 'Specialization Management ' ,
           icon :Icons.medication_liquid_sharp,
           route: Specialitesscreen.routName
           ),
            AdminMenuItem(title: 'Advertisement Requests ' ,
           icon :Icons.branding_watermark,
           route: advertisementRequestsScreen.routName
           ),
            AdminMenuItem(title: 'Advertising Management ' ,
           icon :Icons.add_box_sharp,
           route: advertisementManagementScreen.routName
           ),
           AdminMenuItem(title: 'Monthly Profits ' ,
           icon :CupertinoIcons.money_dollar,
           route: monthlyIncomeScreen.routName
           ),
          
           AdminMenuItem(title: 'Profile Management  ' ,
           icon :Icons.account_box,
           route: profileManagementScreen.routName
           ),
        
        ], 
        selectedRoute: '',
        onSelected: (item){
          screenSellector(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: AppColors.greyColor.shade600,
          child: Center(
            child: Text(
              'header',
              style: TextStyle(
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
        footer: Container(
          height: 50,
          width: double.infinity,
          color: AppColors.greyColor.shade600,
          child: Center(
            child: Text('footer',
            style: TextStyle(
              color: AppColors.whiteColor
            ),
            ),
            
          ),
        ),
        ),
        
      body: _selectedItem
    );
  }
}