 import 'package:d_chart/d_chart.dart';
import 'package:d_chart/ordinal/pie.dart';
import 'package:flutter/material.dart';
 import 'package:hr_product/resume.dart';


import 'package:table_calendar/table_calendar.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> _titles = [
    'Dashboard',
    ' Resumes  ',
    'Applicant Tracking',
    'Interview Scheduling',
    'Interview Assignment',
    'Reports'
  ];
  List<OrdinalData> ordinalDataList = [
    OrdinalData(domain: 'Applied', measure: 40, color: Colors.purple),
    OrdinalData(domain: 'Interview 1', measure: 30, color: Colors.purple.shade200),
    OrdinalData(domain: 'Interview 2', measure: 20, color: Colors.purple.shade400),
    OrdinalData(domain: 'Offer', measure: 10, color: Colors.purple.shade800),
  ];
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .sizeOf(context)
        .height;
    double screenWidth = MediaQuery
        .sizeOf(context)
        .width;

    return LayoutBuilder(builder: (context, constraints)
    {
      bool isMobile = constraints.maxWidth < 800;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: isMobile ?
        AppBar(
          backgroundColor: Colors.white,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Taruk",
                style:
                TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                "Welcome back, Have a good day",
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_outlined),
            ),
  
          ],
        )
            : null,

        drawer: isMobile ? Appdrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isMobile
                ? Column(
              children: [
                _buildMrTarukContainer(),
                const SizedBox(height: 16),
                _buildDashboardCards(isMobile),
                const SizedBox(height: 16),
                _buildPieChartContainer(ordinalDataList),
                const SizedBox(height: 16),
                _buildCalendarContainer(),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMobile)
                  SizedBox(
                      width: 250,
                      height: screenHeight,
                      child: Appdrawer()
                  ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: Colors.white,
                        title: Column(
                          children: [
                            Text(
                              "Hello Taruk",
                              style:
                              TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Welcome back, Have a good day",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.notifications_outlined),
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: _buildDashboardCards(isMobile),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: _buildMrTarukContainer(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: _buildPieChartContainer(ordinalDataList),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: _buildCalendarContainer(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),

                  // body: SingleChildScrollView(
                  //     scrollDirection: Axis.vertical,
                  //     child: Container(
                  //       child: isMobile
                  //           ? Column(
                  //         children: [
                  //           _buildMrTarukContainer(),
                  //           SizedBox(height: 15,),
                  //           _buildDashboardCards(isMobile),
                  //
                  //           SizedBox(height: 15,),
                  //           _buildPieChartContainer(ordinalDataList),
                  //           SizedBox(height: 15,),
                  //           _buildCalendarContainer(),
                  //         ],
                  //       )
                  //           : Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           if (!isMobile)
                  //             SizedBox(
                  //                 width: 250,
                  //                 height: screenHeight,
                  //                 child: Appdrawer()
                  //             ),
                  //           Expanded(
                  //             child: Column(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             crossAxisAlignment: CrossAxisAlignment.start,
                  //             children: [
                  //               AppBar(
                  //                 backgroundColor: Colors.white,
                  //                 title: Column(
                  //                   children: [
                  //                     Text(
                  //                       "Hello Taruk",
                  //                       style:
                  //                       TextStyle(
                  //                           fontSize: 17, fontWeight: FontWeight.bold),
                  //                     ),
                  //                      Text(
                  //                           "Welcome back, Have a good day",
                  //                       style: TextStyle(
                  //                         fontSize: 12,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 actions: [
                  //                   IconButton(
                  //                     onPressed: () {},
                  //                     icon: Icon(Icons.search_rounded),
                  //                   ),
                  //                   IconButton(
                  //                     onPressed: () {},
                  //                     icon: Icon(Icons.notifications_outlined),
                  //                   ),
                  //
                  //                 ],
                  //               ),
                  //
                  //
                  //
                  //           Row(
                  //             children: [
                  //               _buildDashboardCards(isMobile),
                  //               SizedBox(width: 10,),
                  //             Row(
                  //               children: [
                  //                 _buildMrTarukContainer()
                  //               ],
                  //             ),
                  //               SizedBox(height: 10,),
                  //               Column(
                  //                 children: [
                  //                   _buildPieChartContainer(ordinalDataList)
                  //                 ],
                  //               ),
                  //               SizedBox(width: 10,),
                  //               Row(
                  //                 children: [
                  //                   _buildCalendarContainer()
                  //                 ],
                  //               ),
                  //             ],
                  //           )
                  //             ],
                  //           ),
                  //           ),
                  //
                  //
                  //         ],
                  //
                  //
                  //       ),
                  //
                  //
                  //     ),
                  // ),
                )

              ],
            ),
          ),
        ),

      );

    }
    );
  }
  Widget Appdrawer()   {
    return Drawer(

      shape: RoundedRectangleBorder(),
      backgroundColor: Colors.deepPurple,
      child:
      ListView(
        children: [
          ListTile(
            title: Text(
              ' HR Admin ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
            title: Text(
              "Dashboard",
              style: TextStyle(color: Colors.yellow),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.white,
            ),
            title: Text(
              "Resumes",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Resume()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            title: Text(
              "Applicant Tracking",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.analytics,
              color: Colors.white,
            ),
            title: Text(
              "Interview Scheduling",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading:
            Icon(Icons.calendar_today_rounded, color: Colors.white),
            title: Text(
              "Interviewer Assignment",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: Text(
              "Reports",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
  Widget _buildDashboardCards(bool isMobile) {
    return GridView.count(
      crossAxisCount: isMobile ? 2 : 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 18,
      childAspectRatio: isMobile ? 2.0 : 3.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildDashboardCard("Resumes", "180"),
        _buildDashboardCard("Active Applicants", "20"),
        _buildDashboardCard("Scheduled Interviews", "10"),
        _buildDashboardCard("Pending Feedback", "50/100"),
      ],
    );
  }
  Widget _buildDashboardCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: 0.5,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.purple),
                  ),
                ),
                Text(
                  count,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildMrTarukContainer() {
    return Container(
      height: 150,
      width: 500,
      color: Colors.white,

      child: Card(
        elevation: 5,
        color: Colors.white,
        child:
        Padding(padding: EdgeInsets.all(5),
          child:
          Column(

            children: [
              Row(
                children: [
                  CircleAvatar(
                       backgroundImage: AssetImage('images/img_11.png'),
                    radius: 25,
                  ),
                  SizedBox(width: 5,),
                  Column(
                    children: [

                      Text("Mr.Taruk",
                        style: TextStyle(fontSize: 17,
                            fontWeight: FontWeight.bold),

                      ),
                      SizedBox(width: 5,),
                      Text("HR Manager"),


                    ],
                  ),


                ],
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  minimumSize: Size(double.infinity, 35),
                  ),
                  child: Text(
                    "New Applicant", style: TextStyle(color: Colors.grey),)
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
minimumSize: Size(double.infinity, 35),
                  ),
                  child: Text(
                    "New Interview", style: TextStyle(color: Colors.grey),)
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildPieChartContainer(List<OrdinalData> ordinalDataList)   {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Applicants by Interview Stage",
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: 190,
            child: DChartPieO(
              data: ordinalDataList,
              customLabel: (ordinalData, index) => '',
              configRenderPie: ConfigRenderPie(
                strokeWidthPx: 2,
                arcLabelDecorator: ArcLabelDecorator(),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCalendarContainer() {
    return Container (
      height: 400,
      width: 500,
      color: Colors.white,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: TableCalendar(
          focusedDay: today,
          firstDay: DateTime.utc(2010, 10, 16), // coordinated universal time
          lastDay: DateTime.utc(2025, 12, 26),
        ),
      ),
    );
  }
}


