import 'package:flutter/material.dart';
import 'package:hr_product/Applicant_Info.dart';
import 'package:hr_product/DrawerFile.dart';

class ResumemanageScreen extends StatefulWidget {
  const ResumemanageScreen({super.key});

  @override
  State<ResumemanageScreen> createState() => _ResumemanageScreenState();
}

class _ResumemanageScreenState extends State<ResumemanageScreen> {

  List<Map<String, dynamic>> data = [
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",     "AGE": "24", "GENDER": "Male" , },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "GENDER": "Male", },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "GENDER": "Male", },
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22", "GENDER": "Female",},
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "GENDER": "Male",},
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
              title: Text("Resume Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined,size: 27,)),
              ],
            ) : null,
            drawer: isMobile? DrawerScreen() : null,
            body: SingleChildScrollView(
              child: Container(
                  child: isMobile
                      ?Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        BulkDataManage(),
                        SizedBox(height: 20,),
                        Person_data()
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
                              backgroundColor: Colors.white,
                              title: Text("Resume Screen",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                              actions: [
                                IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined,size: 27,)),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20,top: 15,right: 20),
                                  child: BulkDataManage(),
                                ),
                                SizedBox(height: 20,),
                                Person_data(),
                              ],
                            )
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

  Widget BulkDataManage(){
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              prefixIcon: Icon(Icons.search_sharp,color: Colors.grey,size: 27,),
              hintText: "Search by job title,status...",
              hintStyle: TextStyle(fontWeight: FontWeight.w400),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(28),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text("Applicants List",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,

                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: PopupMenuTheme(
                data: PopupMenuThemeData(
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: PopupMenuButton<String>(
                  color: Colors.white,
                  offset:  Offset(0, 35),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.fromLTRB(10,0, 7,0),
                      child: Text('Rejection Email',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    PopupMenuDivider(),
                    PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.fromLTRB(10,0, 7,0),
                      child: Text('Interview Invite',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                  ],
                  child: Row(
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'serif',color: Colors.white),
                      ),
                      Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(width: 20),
            Container(
              height: 35,
              child: ElevatedButton(
                   onPressed: (){},
                  style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                      ),
                   ),
                   child: Text("Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),)
                         ),
            ),
         ],
        )
      ],
    );
  }

  Widget Person_data(){
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(Colors.grey.shade100),
        dividerThickness: 0,
        border: TableBorder(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
          horizontalInside: BorderSide(color: Colors.grey.shade300),
        ),
        columns: [
          DataColumn(label: Text('SELECT',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
          DataColumn(label: Text('APPLICANT ID',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
          DataColumn(label: Text('APPLICANT NAME',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
          DataColumn(label: Text('AGE',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
          DataColumn(label: Text('GENDER',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
         ],
        rows: data.map((row) {
          return DataRow(
            onSelectChanged: (selected){
              if(selected==true){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ApplicantInfoScreen() ));
              }
            },
            cells: [
              DataCell(Checkbox(value: false, onChanged: (value) {})),
              DataCell(Text(row['APPLICANT ID'])),
              DataCell(Text(row['APPLICANT NAME'])),
              DataCell(Text(row['AGE'])),
              DataCell(Text(row['GENDER'])),
            ],
          );
        }).toList(),
      ),
    );
  }
}
