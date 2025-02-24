import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'DrawerFile.dart';
import 'package:intl/intl.dart';

class Interview_Screen extends StatefulWidget {
  const Interview_Screen({super.key});

  @override
  State<Interview_Screen> createState() => _Interview_ScreenState();
}

class _Interview_ScreenState extends State<Interview_Screen> {

  List<String> jobTitles = [
    'Search Job Titles',
    'Software Engineer',
    'Data Analyst',
    'HR Manager',
    'Product Manager',
    'UI/UX Designer',
    'Sales Executive',
    'Marketing Specialist',
  ];

  List<String> interviewers = [
    'Aditi Sharma',
    'Nidhi verma',
    'Malkeet Kumar',
    'Pulkit Kohli',
    'Himanshu Mital',
  ];

  List<Map<String, dynamic>> applicants = [
    {'name': 'John Doe', 'jobTitle': 'Software Engineer'},
    {'name': 'Jane Smith', 'jobTitle': 'Data Analyst'},
    {'name': 'Alice Johnson', 'jobTitle': 'HR Manager'},
    {'name': 'Robert Brown', 'jobTitle': 'Product Manager'},
    {'name': 'Emily Davis', 'jobTitle': 'UI/UX Designer'},
    {'name': 'Michael Wilson', 'jobTitle': 'Sales Executive'},
    {'name': 'Sophia Martinez', 'jobTitle': 'Marketing Specialist'},
    {'name': 'John Doe', 'jobTitle': 'Software Engineer'},
    {'name': 'Smith', 'jobTitle': 'Data Analyst'},
    {'name': 'Johnson', 'jobTitle': 'HR Manager'},
    {'name': 'Brown', 'jobTitle': 'Product Manager'},
    {'name': 'Davis', 'jobTitle': 'UI/UX Designer'},
    {'name': 'Wilson', 'jobTitle': 'Sales Executive'},
    {'name': 'Martinez', 'jobTitle': 'Marketing Specialist'},

  ];

  List<Map<String, dynamic>> scheduledInterviews = [];

  List<String> Interview_round = ["Technical Round","HR Round","Manager Round"];

  List<String> Time_Slot = ["9:00 - 10:00 AM","10:00 - 11:00AM","2:00 - 3:00 PM","3:00 - 4:00 PM","4:00 - 5:00 PM","5:00 - 6:00 PM"];

  int? isSelectedIndex;
  String? selectedJobTitle;
  String? selectedInterviewer;
  String? selectedRound;
  String? time;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  late TextEditingController  dateController ;

  @override
  void initState() {
    super.initState();
    dateController = TextEditingController(text: DateFormat('dd/MM/yyyy').format(DateTime.now()),);
    }

  void _selectDate(BuildContext context) async {
    final DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),  );

    if (_datePicker != null) {
      setState(() {
        dateController.text = DateFormat('dd/MM/yyyy').format(_datePicker);
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          bool isMobile = constraints.maxWidth<800;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: isMobile? AppBar(
              backgroundColor: Colors.white,
              title: Text("Interview Schedule",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
              actions: [
                IconButton(onPressed: () {}, icon: Icon(Icons.notifications_outlined,size: 27,)),
              ],
            ) :null,
            drawer: isMobile? DrawerScreen() : null,
            body: isMobile
                ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Filtters(context,isMobile),
                    SizedBox(height: 10,),
                    Scheduled_Interviews(scheduledInterviews),
                    SizedBox(height: 10,),
                    CalendarView(),
                  ],
                ),
              ),
            )
                : Row(
              children: [
                DrawerScreen(),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Interview Schedule",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.notifications_outlined,size: 27,),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Filtters(context,isMobile),
                          SizedBox(height: 14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Scheduled_Interviews(scheduledInterviews),
                              SizedBox(width: 10,),
                              Expanded(child: CalendarView()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
  Widget Filtters(BuildContext context,isMobile){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: (){
                  NewInterviewModal(context,isMobile);
                },
                child: Text("New Interview",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),)),
          ],
        ),
        SizedBox(height: 8),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 600),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  decoration: InputDecoration(
                    hintText: 'Select Job Title',
                    alignLabelWithHint: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  value: selectedJobTitle,
                  items: jobTitles.map((title) {
                    return DropdownMenuItem<String>(
                      value: title,
                      child: Text(title),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedJobTitle = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: DropdownButtonFormField<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    hintText: 'Select Interviewer',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  value: selectedInterviewer,
                  items: interviewers.map((name) {
                    return DropdownMenuItem<String>(
                      value: name,
                      child: Text(name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedInterviewer = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
  Widget Scheduled_Interviews(List<Map<String, dynamic>> interviewData) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 400, maxWidth: 400),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(width: 1),
        ),
        padding: EdgeInsets.all(16),
        child: interviewData.isEmpty
            ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.timer_sharp),
            SizedBox(width: 8),
            Text("No Scheduled Interviews"),
          ],
        )
            : SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            border: TableBorder.all(),
            headingRowColor:
            MaterialStateColor.resolveWith((states) => Colors.grey[200]!),
            columns: [
              DataColumn(label: Text("Applicant")),
              DataColumn(label: Text("Job Title")),
              DataColumn(label: Text("Interviewer")),
              DataColumn(label: Text("Round")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Time")),
            ],
            rows: interviewData.map((interview) {
              return DataRow(cells: [
                DataCell(Text(interview['name'])),
                DataCell(Text(interview['jobTitle'])),
                DataCell(Text(interview['interviewer'])),
                DataCell(Text(interview['round'])),
                DataCell(Text(interview['date'])),
                DataCell(Text(interview['time'])),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
  Widget CalendarView(){
    return ConstrainedBox(
        constraints: BoxConstraints(minWidth: 500),
        child: TableCalendar(
          calendarFormat: _calendarFormat,
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          availableCalendarFormats: {
            CalendarFormat.month: 'Month',
            CalendarFormat.twoWeeks: '2 Weeks',
            CalendarFormat.week: 'Week',
          },
          rowHeight: 35.0,
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              shape: BoxShape.circle,
            ),
          ),
        )
    );
  }
  void NewInterviewModal(BuildContext context,isMobile){
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Container(
                      width: 860,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: isMobile ?
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 240,
                            child: SingleChildScrollView(
                              child: DataTable(
                                columnSpacing: 5,
                                horizontalMargin: 3,
                                headingRowColor: MaterialStateProperty.all(
                                    Colors.grey.shade100),
                                columns: [
                                  DataColumn(label: Text('SELECT',
                                    style: TextStyle(fontFamily: "sens-serif",
                                        fontWeight: FontWeight.bold),)),
                                  DataColumn(label: Text('Applicant Name',
                                      style: TextStyle(fontFamily: "sens-serif",
                                          fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text('Job Title',
                                      style: TextStyle(fontFamily: "sens-serif",
                                          fontWeight: FontWeight.bold))),
                                ],
                                rows: applicants
                                    .map(
                                      (applicant) =>
                                      DataRow(
                                          cells: [
                                            DataCell(Checkbox(value: false,
                                                onChanged: (value) {})),
                                            DataCell(Text(applicant['name'])),
                                            DataCell(Text(applicant['jobTitle'])),
                                          ]
                                      ),
                                ).toList(),
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),

                        Text("Select Interviewer", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 6,),
                        DropdownButtonFormField<String>(
                          focusColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Select Interviewer',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          value: selectedInterviewer,
                          items: interviewers.map((name) {
                            return DropdownMenuItem<String>(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedInterviewer = value;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                        Text("Interview Round", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 6,),
                        DropdownButtonFormField<String>(
                          focusColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Select interview round',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          value: selectedRound,
                          items: Interview_round.map((name) {
                            return DropdownMenuItem<String>(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedRound = value;
                            });
                          },
                        ),
                        SizedBox(height: 10,),
                        Text("Date:", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 6),
                        TextFormField(
                          controller: dateController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            suffixIcon: IconButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              icon: Icon(Icons.calendar_month_rounded),),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),

                          readOnly: true,
                          onTap: () => _selectDate(context),
                        ),
                        SizedBox(height: 10,),
                        Text("Time Slot:", style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),),
                        SizedBox(height: 6),
                        DropdownButtonFormField<String>(
                          focusColor: Colors.white,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 15),
                            hintText: 'Select Time',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          value: time,
                          items: Time_Slot.map((name) {
                            return DropdownMenuItem<String>(
                              value: name,
                              child: Text(name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              time = value;
                            });
                          },
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurpleAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text("Send Mail", style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),)),
                          ],
                        )
                        ],
                      )
                          : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: DataTable(
                              headingRowColor: MaterialStateProperty.all(
                                  Colors.grey.shade100),
                              columns: [
                                DataColumn(label: Text('SELECT', style: TextStyle(
                                    fontFamily: "sens-serif",
                                    fontWeight: FontWeight.bold),)),
                                DataColumn(
                                    label: Text('Applicant Name', style: TextStyle(
                                        fontFamily: "sens-serif",
                                        fontWeight: FontWeight.bold))),
                                DataColumn(
                                    label: Text('Job Title', style: TextStyle(
                                        fontFamily: "sens-serif",
                                        fontWeight: FontWeight.bold))),
                              ],
                              rows: List.generate(applicants.length, (index) =>
                                    DataRow(
                                        cells: [
                                          DataCell(Checkbox(
                                            value: isSelectedIndex == index,
                                            onChanged: (value) {
                                              setState(() {
                                                isSelectedIndex = value! ? index : 1;
                                                if (value) {
                                                  scheduledInterviews.add({
                                                    'name': applicants[index]['name']??'',
                                                    'jobTitle': applicants[index]['jobTitle']??'',
                                                  });
                                                  applicants.removeAt(index);
                                                }

                                              });
                                            },
                                          )),
                                          DataCell(Text(applicants[index]['name']!)),
                                          DataCell(Text(applicants[index]['jobTitle']!)),
                                        ]
                                    ),

                              ).toList(),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Select Interviewer", style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(height: 6,),
                                DropdownButtonFormField<String>(
                                  focusColor: Colors.white,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  value: selectedInterviewer ?? (interviewers.isNotEmpty ? interviewers.first : null),
                                  items: interviewers.map((name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedInterviewer = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("Interview Round", style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(height: 6,),
                                DropdownButtonFormField<String>(
                                  focusColor: Colors.white,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  value: selectedRound ?? (Interview_round.isNotEmpty ? Interview_round.first : null),
                                  items: Interview_round.map((name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRound = value;
                                    });
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text("Date:", style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(height: 6),
                                TextFormField(
                                  controller: dateController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        _selectDate(context);
                                      },
                                      icon: Icon(Icons.calendar_month_rounded),),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),

                                  readOnly: true,
                                  onTap: () => _selectDate(context),
                                ),
                                SizedBox(height: 10,),
                                Text("Time Slot:", style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),),
                                SizedBox(height: 6),
                                DropdownButtonFormField<String>(
                                  focusColor: Colors.white,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                  value: time ?? (Time_Slot.isNotEmpty ? Time_Slot.first : null),
                                  items: Time_Slot.map((name) {
                                    return DropdownMenuItem<String>(
                                      value: name,
                                      child: Text(name),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      time = value;
                                    });
                                  },
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.deepPurpleAccent,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                4.0),
                                          ),
                                        ),
                                        onPressed: () {
                                            setState(() {
                                              scheduledInterviews.add({
                                                'name': scheduledInterviews.first['name'],
                                                'jobTitle': scheduledInterviews.first['jobTitle'],
                                                'interviewer': selectedInterviewer ?? '',
                                                'round': selectedRound ?? '',
                                                'date': dateController.text,
                                                'time': time ?? '',
                                              });
                                              print(scheduledInterviews.toString());
                                            });
                                            Navigator.pop(context);
                                        },
                                        child: Text("Send Mail", style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  )
              );
            }
        )
    );
  }
}

