import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:hr_product/DrawerFile.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:table_calendar/table_calendar.dart';

class HrDashboardScreen extends StatefulWidget {
  const HrDashboardScreen({super.key});

  @override
  State<HrDashboardScreen> createState() => _HrDashboardScreenState();
}

class _HrDashboardScreenState extends State<HrDashboardScreen> {

  Map<String, double> dataMap = {
    "Applied": 50,
    "Interview 1": 30,
    "Interview 2": 20,
    "Offer": 15,
  };

  List<OrdinalData> pieDataList = [
    OrdinalData(
      domain: 'Completed',
      measure: 65,
      color: Colors.deepPurple,
    ),
    OrdinalData(
      domain: 'Uncompleted',
      measure: 35,
      color: Colors.deepPurple.shade50,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        bool isMobile = constraints.maxWidth<600;
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
         drawer: isMobile? DrawerScreen() : null,
         body: SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Container(
             width: screenWidth,
             height: isMobile? null : screenHeight,
             child: isMobile
                 ?Padding(
               padding: EdgeInsets.all(10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       HRProfile(screenWidth,isMobile),
                       SizedBox(height: 20,),
                      _DashBoardCards(isMobile),
                       SizedBox(height: 10,),
                       Text("Applicants by interview stage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                       SizedBox(height: 10,),
                       DataWithPieChart(screenWidth,isMobile),
                       SizedBox(height: 10,),
                       Data_Calendar(),
                     ],
                   ),
                 )
                 : Row(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 if(!isMobile) SizedBox(
                   width: 250,
                     height: screenHeight,
                     child: DrawerScreen(),
                 ),
                 Expanded(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
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
                       SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                         child: Padding(
                           padding: EdgeInsets.only(left: 30,top: 15,right: 30),
                           child: SingleChildScrollView(
                             scrollDirection: Axis.horizontal,
                             child: Container(
                               child: Row(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                    Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                        Container(
                                           height: screenHeight * 0.46,
                                           width: screenWidth * 0.5,
                                           child: _DashBoardCards(isMobile),
                                         ),
                                       Text("Applicants by interview stage",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                       SizedBox(height: 5),
                                       DataWithPieChart(screenWidth,isMobile),
                                     ],
                                   ),
                                    SizedBox(width:18),
                                    Column(
                                     mainAxisAlignment: MainAxisAlignment.start,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [
                                       HRProfile(screenWidth,isMobile),
                                       SizedBox(height: 18),
                                       Data_Calendar(),
                                     ],
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
        );
        },
      );
    }
  Widget Infotmation_DoughNut(String title, int count){
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1,color: Colors.white),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.5,
            blurRadius: 10,
            offset: Offset(1,3),
          )]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(title),
              Spacer(),
              Text("All"),
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 97,
                width: 97,
                child: DChartPieO(
                  animate: true,
                  animationDuration: Duration(milliseconds: 1200),
                  data: pieDataList,
                  configRenderPie: ConfigRenderPie(
                    arcWidth: 10,
                    strokeWidthPx: 0,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '65%',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _DashBoardCards(bool isMobile){
    return  GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childAspectRatio: isMobile? 1.25: 2.4,
      physics: NeverScrollableScrollPhysics(),

      children: [
        Infotmation_DoughNut('Resumes', 65),
        Infotmation_DoughNut('Active Applicants', 50),
        Infotmation_DoughNut('Scheduled Interviews', 30),
        Infotmation_DoughNut('Pending Feedback', 10),
      ],
    );
  }
  Widget HRProfile(double screenWidth,bool isMobile){
    return Container(
      width: isMobile? screenWidth:screenWidth*0.25,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1,color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0.5,
                    blurRadius: 10,
                    offset: Offset(1,3),
                  )]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mr. Taruk",style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold)),
                    Text("HR Manager",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500))
                  ],
                ),
                Spacer(),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/images/hr_manager.jpg"),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50,
              width: isMobile?screenWidth*0.46:screenWidth*0.121,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  onPressed: (){},
                  child: Text("New Applicant",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
            SizedBox(
              height: 50,
              width:  isMobile?screenWidth*0.46:screenWidth*0.121,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                    backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),

                  onPressed: (){},
                  child: Text("New Interview",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 14),)),
            ),
          ],
        )
          
        ],
      ),
    );
  }
  Widget DataWithPieChart(double screenWidth,bool isMobile){
    return Container(
      width: isMobile? 340: screenWidth*0.5,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1,color: Colors.white),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.5,
                blurRadius: 10,
                offset: Offset(1,3),
              )]
        ),
      child: PieChart(
          dataMap: dataMap,
        chartRadius: isMobile? screenWidth*0.35:screenWidth*0.14,
        colorList: [Colors.deepPurpleAccent,Colors.deepPurpleAccent.shade700,
          Colors.deepPurpleAccent.shade400,Colors.deepPurpleAccent.shade100],
        legendOptions: LegendOptions(
          legendPosition: LegendPosition.right,
          legendShape: BoxShape.rectangle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValues: false,
        ),
      )
    );
  }
  Widget Data_Calendar(){
    return Container(
      width: 347,
      height: 375,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,color: Colors.white),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.5,
              blurRadius: 10,
              offset: Offset(1,3),
            )]
      ),
      child: TableCalendar(
        calendarFormat: CalendarFormat.month,
          rowHeight: 35.0,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
    );
  }
}
