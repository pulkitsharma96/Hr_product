import 'package:flutter/material.dart';

class HrDashboardScreen extends StatefulWidget {
  const HrDashboardScreen({super.key});

  @override
  State<HrDashboardScreen> createState() => _HrDashboardScreenState();
}

class _HrDashboardScreenState extends State<HrDashboardScreen> {

  int _selectedItem =-1;

  List<Map<String,dynamic>> sidebar_data = [
    {'text' : 'Dashboard','icon':Icons.home_outlined},
    {'text' : 'Resumes','icon': Icons.contact_page_outlined},
    {'text' : 'Applicant Tracking','icon':Icons.spatial_tracking_outlined},
    {'text' : 'Interview Scheduling','icon':Icons.calendar_month_outlined},
    {'text' : 'Interview Assignment','icon':Icons.assignment_outlined},
    {'text' : 'Report','icon':Icons.report_gmailerrorred_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        bool isMobile = constraints.maxWidth<800;
        return  Scaffold(
          backgroundColor: Colors.white,

          appBar: isMobile? AppBar(
            backgroundColor: Colors.white,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello Taruk,",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Text("Welcome back,have a good day",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),),
              ],
            ),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: (){}, icon: Icon(Icons.notifications_outlined)),
            ],
          )
          : null,
         drawer: isMobile? AppDrawer() : null,
         body: SingleChildScrollView(
           child: Container(
             child: isMobile
                 ?Column()
                 : Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if(!isMobile) SizedBox(
                   width: 250,
                     height: screenHeight,
                     child: AppDrawer()
                 ),
                 Expanded(
                   child: Column(
                     children: [
                       AppBar(
                         automaticallyImplyLeading: false,
                         backgroundColor: Colors.white,
                         title: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text("Hello Taruk,",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                             Text("Welcome back,have a good day",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                           ],
                         ),
                         actions: [
                           IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
                           IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined)),
                         ],
                       ),
                       Text("jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj"),
                     ],
                   ),
                 ),
               ],)
           ),
         ),

        );
        }
    );
  }
  Widget AppDrawer(){
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
           leading: Icon(item['icon'],color: _selectedItem == index
               ? Colors.amber
               : Colors.white,),
             title: Text(item['text'],style: TextStyle(
               color: _selectedItem == index
                 ? Colors.amber
                 : Colors.white,
             fontWeight: FontWeight.w500),),
             onTap: (){
             setState(() {
               _selectedItem = index;
             });

             },
           );
    }).toList(),
       ],
      ),
    );
  }

}
