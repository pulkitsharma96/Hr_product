import 'package:flutter/material.dart';
import 'package:hr_product/Applicant_Info.dart';
import 'package:hr_product/Drawer.dart';
import 'package:hr_product/screen/table_info.dart';


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
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",     "AGE": "24", "GENDER": "Male" , },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "GENDER": "Male", },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "GENDER": "Male", },
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22", "GENDER": "Female",},
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "GENDER": "Male",},
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",     "AGE": "24", "GENDER": "Male" , },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "GENDER": "Male", },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "GENDER": "Male", },
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22", "GENDER": "Female",},
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "GENDER": "Male",},
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",     "AGE": "24", "GENDER": "Male" , },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "GENDER": "Male", },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "GENDER": "Male", },
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22", "GENDER": "Female",},
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "GENDER": "Male",},
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
              title: const Text("Resume Screen",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined,size: 27,)),
              ],
            ) : null,
            drawer: isMobile? const DrawerScreen() : null,
            body: SingleChildScrollView(
              child: Container(
                  height: screenHeight,
                  child: isMobile
                      ?Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        BulkDataManage(),
                        const SizedBox(height: 20,),
                        Person_data(screenWidth,isMobile)
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
                        child: const DrawerScreen(),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppBar(
                              backgroundColor: Colors.white,
                              title: const Text("Resume Screen",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                              actions: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_outlined,size: 27,)),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20,top: 15,right: 20),
                                  child: BulkDataManage(),
                                ),
                                const SizedBox(height: 20,),
                                Person_data(screenWidth , isMobile),
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
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              prefixIcon: const Icon(Icons.search_sharp,color: Colors.grey,size: 27,),
              hintText: "Search by job title,status...",
              hintStyle: const TextStyle(fontWeight: FontWeight.w400),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(28),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.black),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const Text("Applicants List",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            const Spacer(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
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
                  offset:  const Offset(18,35),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.symmetric(horizontal: 6.5),
                      child: Text('Rejection Email',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 1,
                      padding:  EdgeInsets.symmetric(horizontal: 6.5),
                      child: Text('Interview Invite',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                  ],
                  child: const Row(
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
            const SizedBox(width: 10),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
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
                child:  PopupMenuButton<String>(
                  color: Colors.white,
                  offset:  const Offset(18,35),
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.fromLTRB(10,0, 0,0),
                      child: Text('In Progress',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.fromLTRB(10,0, 0,0),
                      child: Text('Rejected',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                    const PopupMenuDivider(),
                    const PopupMenuItem(
                      height: 1,
                      padding: EdgeInsets.fromLTRB(10,0, 0,0),
                      child: Text('Interview Scheduled',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    ),
                  ],
                  child: const Row(
                    children: [
                      Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'serif',color: Colors.white),
                      ),
                      Icon(Icons.keyboard_arrow_down,color: Colors.white,),
                    ],
                  ),
                ),
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget Person_data(screenWidth,isMobile){
    return  Container(
      height: 370,
      width: isMobile?null:screenWidth,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: DataTable(
          showCheckboxColumn: false,
          headingRowColor: WidgetStateProperty.all(Colors.grey.shade100),
          dividerThickness: 0,
          border: TableBorder(
            top: BorderSide(color: Colors.grey.shade300),
            bottom: BorderSide(color: Colors.grey.shade300),
            left: BorderSide(color: Colors.grey.shade300),
            right: BorderSide(color: Colors.grey.shade300),
            horizontalInside: BorderSide(color: Colors.grey.shade300),
          ),
          columns: [
            const DataColumn(label: Text('SELECT',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
            const DataColumn(label: Text('APP_ID',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
            const DataColumn(label: Text('NAME',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
            const DataColumn(label: Text('AGE',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
            const DataColumn(label: Text('GENDER',style: TextStyle(fontFamily: "sens-serif",fontWeight: FontWeight.w700),)),
          ],
          rows: data.map((row) {
            return DataRow(
              onSelectChanged: (selected){
                if(selected==true){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplicantInfoScreen() ));
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
      ),
    );
  }
}
