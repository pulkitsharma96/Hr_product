import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
 
 
  State<Resume> createState() => _ResumeState();
} 

class _ResumeState extends State<Resume> {
  @override
  String _selectedItem = 'Email'; 
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .sizeOf(context)
        .height;
    double screenWidth = MediaQuery
        .sizeOf(context)
        .width;
    return LayoutBuilder(builder: (context, constraints) {
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
            Text("RESUMES",style: TextStyle(fontWeight: FontWeight.bold),)

            ],
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notification_add, color: Colors.black,)
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
                  _buildSearchContainer(),
                  SizedBox(height: 10,),
                  _buildEmailContainer(),
                  SizedBox(height:10),
                  _buildTableContainer(),
                ]

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
                        title: Row(
                          children: [
                            Icon(Icons.arrow_back),
                            Text("Resumes Screen",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                        actions: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.notification_add, color: Colors.black,)
                          ),

                        ],
                      ),
                      Column(
                        children: [
                          _buildSearchContainer(),
                          SizedBox(height:10),
                          _buildEmailContainer(),
                          SizedBox(height:10),
                          _buildTableContainer(),

                        ],
                      )
                    ],


                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }  );





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
              style: TextStyle(color: Colors.white),
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
              style: TextStyle(color: Colors.yellow),
            ),
            onTap: () {},
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
  Widget _buildSearchContainer(){
    return Container(
      child: Padding(padding: EdgeInsets.all(10),
      child:
      TextField(
       decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: (){},
            icon: Icon(Icons.search_rounded),
        ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
         ),
         hintText: "Search by job title, name,"

       ),

      ),
    ),
    );
  }
  Widget _buildEmailContainer(){
    return Container(
      child: Row(
        children: [
          TextButton(
            onPressed: (){},
            child: Text("Applicants Lists"),
          ),
          Container(
          padding:EdgeInsets.symmetric(horizontal: 180),
          child:  DropdownButtonFormField<String>(
            value: _selectedItem ,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 2),

            ),
            items: <String>['Email','Rejection Email', 'Interview Invite', ]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedItem = newValue!;
              });
            },
          ),

          ),
         ElevatedButton(
           onPressed: () {},
           child:  Text("Submit"),
         ),
        ],
      ),
    );
  }
  Widget _buildTableContainer(){
    return DataTable(
      border: TableBorder.all(color: Colors.grey),
      columns: [
        DataColumn(
          label: Text("Select",style: TextStyle(fontWeight: FontWeight.bold),),

        ),
        DataColumn(
          label: Text("Name",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        DataColumn(
          label: Text("Applied Role",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        DataColumn(
          label: Text("Experience",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
      ],
      rows: [
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Checkbox')),
              DataCell(Text('John Dae')),
              DataCell(Text('Software Engineer')),
              DataCell(Text('1 year')),
            ]
        ),
        DataRow(
            cells: <DataCell>[
              DataCell(Text('Checkbox')),
              DataCell(Text('Jane Smith')),
              DataCell(Text('Product Manager')),
              DataCell(Text('3 year')),
            ]
        ),

        DataRow(
            cells: <DataCell>[
              DataCell(Text('Checkbox')),
              DataCell(Text('Samuel Lee')),
              DataCell(Text('Data Scientist')),
              DataCell(Text('4 year')),
            ]
        ),

        DataRow(
            cells: <DataCell>[
              DataCell(Text('Checkbox')),
              DataCell(Text('John Dae')),
              DataCell(Text('Software Engineer')),
              DataCell(Text('2 year')),
            ]
        ),

        DataRow(
            cells: <DataCell>[
              DataCell(Text('Checkbox')),
              DataCell(Text('Taruk Smmith')),
              DataCell(Text('HR Manager')),
              DataCell(Text('3 year')),
            ]
        ),

      ],
    );
  }


}
