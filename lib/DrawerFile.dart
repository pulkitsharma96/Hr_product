import 'package:flutter/material.dart';
import 'package:hr_product/hr_dashboard_screen.dart';
import 'package:hr_product/login_Screen.dart';
import 'package:hr_product/resumeManage_Screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {


  List<Map<String,dynamic>> sidebar_data = [
    {'text' : 'Dashboard','icon':Icons.home_outlined ,'screen': HrDashboardScreen()},
    {'text' : 'Resumes','icon': Icons.contact_page_outlined, 'screen': ResumemanageScreen()},
    {'text' : 'Applicant Tracking','icon':Icons.spatial_tracking_outlined,'screen': HrDashboardScreen()},
    {'text' : 'Interview Scheduling','icon':Icons.calendar_month_outlined,'screen': HrDashboardScreen()},
    {'text' : 'Interview Assignment','icon':Icons.assignment_outlined,'screen': HrDashboardScreen()},
    {'text' : 'Report','icon':Icons.report_gmailerrorred_rounded,'screen': HrDashboardScreen()},
    {'text' : 'Logout','icon':Icons.logout_rounded,'screen': LogIn_Screen()},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
      ),
      backgroundColor: Colors.deepPurpleAccent,
      child: ListView(
        children: [
          Container(
            height: 60,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.zero,
              ),
              child: Text(
                'HR Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          ...sidebar_data.asMap().entries.map((entry){
            int index = entry.key;
            var item = entry.value;
            return ListTile(
              leading: Icon(item['icon'],color: Colors.white,),
              title: Text(item['text'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context)=> item['screen'] ));
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
