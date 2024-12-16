import 'package:flutter/material.dart';

class ApplicantInfoScreen extends StatefulWidget {
  const ApplicantInfoScreen({super.key});

  @override
  State<ApplicantInfoScreen> createState() => _ApplicantInfoScreenState();
}

class _ApplicantInfoScreenState extends State<ApplicantInfoScreen> {

  List<Map<String, dynamic>> data = [
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",  "AGE": "24","Applied Post": "Senior Software Engineer","GENDER": "Male" ,
      "CURRENT POST": "Product Engineer","skills": "Java\nReact\nFlutter\nMySQL\nExcel\nMS Office" },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "Applied Post": "Senior Software Engineer","GENDER": "Male","CURRENT POST": "Product Engineer",
      "skills": "Java\nReact\nFlutter\nMySQL\nExcel\nMS Office"  },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "Applied Post": "Senior Software Engineer","GENDER": "Male","CURRENT POST": "Product Engineer",
      "skills": "Java\nReact\nFlutter\nMySQL\nExcel\nMS Office"  },
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22","Applied Post": "Senior Software Engineer", "GENDER": "Female",
      "CURRENT POST": "Product Engineer","skills": "Java\nReact\nFlutter\nMySQL\nExcel\nMS Office"  },
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "Applied Post": "Senior Software Engineer","GENDER": "Male",
      "CURRENT POST": "Product Engineer", "skills": "Java\nReact\nFlutter\nMySQL\nExcel\nMS Office" },
  ];

  List<Map<String,dynamic>> Resume_details = [
    { "icon" : Icons.mail_outline_outlined, "text" : "verjyo1234@gmail.com",},
    { "icon" : Icons.call, "text" : "+1 234 555 55 55"},
    { "icon" : Icons.location_on_outlined, "text" : "NY,USA"},
    { "icon" : Icons.link_rounded, "text" : "linkedln/jim.branders"},
  ];


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text("Applicant Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              actions: [
                IconButton(onPressed: () {},
                    icon: Icon(Icons.notifications_outlined, size: 27,)),
              ],
            ) ,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: isMobile
                    ? Column(
                  children: [
                    Profile(),
                    Contact(screenWidth),
                    Skills(screenWidth),
                    Experience(screenWidth),
                    Qualification(screenWidth),
                    Projects(screenWidth),
                    Language(screenWidth),
                  ],
                )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Profile(),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Contact(screenWidth*0.27),
                          Skills(screenWidth*0.27),
                          Experience(screenWidth*0.27),
                        ],
                      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Qualification(screenWidth*0.27),
                            Projects(screenWidth*0.27),
                            Language(screenWidth*0.27),
                          ],
                        )
                      ],
                    )
              ),
            ),
          );
        }
    );
  }
  Widget Profile(){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/resume_image1.jpg"),
              ),
              SizedBox(width: 50,),
              Column(
                children: [
                  Text(data[0]["APPLICANT NAME"],style: TextStyle(fontSize: 34),),
                  Text(data[0]["CURRENT POST"],style: TextStyle(fontSize: 16),),
                ],
              ),
            ],
          ),
          SizedBox(height: 20,),
          Divider(color: Colors.deepPurpleAccent,thickness: 1,height: 1,),
          SizedBox(height: 5),
          Text("Applied Post : "+data[0]["Applied Post"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
          SizedBox(height: 5),
          Divider(color: Colors.deepPurpleAccent,thickness: 1,height: 1,),

        ],
      ),
    );
  }
  Widget Contact(screenWidth){
    return Container(
      height: 220,
      width: screenWidth,
      margin: EdgeInsets.all(18),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.deepPurpleAccent),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact Details : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
          Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
          Container(
           height: 165,
            child: ListView.builder(
              itemCount: Resume_details.length,
                itemBuilder: (context,index){
              return ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                    leading: Icon(Resume_details[index]["icon"],color: Colors.black,size: 21,),
                    title: Text(Resume_details[index]["text"],style: TextStyle(color: Colors.black,fontSize: 16),),
              );
            }),
          ),
        ],
      )
    );
  }
  Widget Skills(screenWidth){
    return Container(
        height: 220,
        width: screenWidth,
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Skills : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
            Container(
              padding: EdgeInsets.all(10),
              height: 165,
              child: Text(data[0]["skills"],style: TextStyle(color: Colors.black,fontSize: 16),),
            ),
          ],
        )
    );
  }
  Widget Experience(screenWidth){
    return Container(
        height: 220,
        width: screenWidth,
        margin: EdgeInsets.all(18),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experience : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
            Container(
              height: 165,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Product Engineer",style: TextStyle(color: Colors.black,fontSize: 16),),
                          Text("Meritech Co. Ltd.",style: TextStyle(color: Colors.black,fontSize: 14),),
                        ],
                      ),
                      subtitle: Text("2000-2002",style: TextStyle(color: Colors.black,),),
                      trailing: Text("Japan",style: TextStyle(color: Colors.black,),),
                    );
                  }),
            ),
          ],
        )
    );
  }
  Widget Qualification(screenWidth){
    return Container(
        height: 220,
        width: screenWidth,
        margin: EdgeInsets.only(left: 18,right: 18,bottom: 18),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Qualification : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
            Container(
              height: 165,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("B.Tech",style: TextStyle(color: Colors.black,fontSize: 16),),
                          Text("Guru Jambheshwar University",style: TextStyle(color: Colors.black,fontSize: 14),),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1995-1999",style: TextStyle(color: Colors.black,),),
                          Text("Hisar",style: TextStyle(color: Colors.black,fontSize: 10),),
                        ],
                      ),
                      trailing: Text("75.6%",style: TextStyle(color: Colors.black,),),
                    );
                  }),
            ),
          ],
        )
    );
  }
  Widget Projects(screenWidth){
    return Container(
        height: 220,
        width: screenWidth,
        margin: EdgeInsets.only(left: 18,right: 18,bottom: 18),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Projects : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
            Container(
              height: 165,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context,index){
                    return ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text("Product Lifecycle Management Tool ",style: TextStyle(color: Colors.black,fontSize: 16),),
                      subtitle: Text("Developed a tool that streamlined product design, testing, and production, reducing time-to-market by 20%.",style: TextStyle(color: Colors.black,),),
                    );
                  }),
            ),
          ],
        )
    );
  }
  Widget Language(screenWidth){
    return Container(
        width: screenWidth,
        margin: EdgeInsets.only(left: 18,right: 18,bottom: 18),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(width: 1,color: Colors.deepPurpleAccent),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Language Known : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 1,color: Colors.deepPurpleAccent,height: 1,endIndent: 8,),
            Container(
              padding: EdgeInsets.all(10),
              height: 165,
              child: Text("Hindi : Native\nEnglish : Intermediate\nFrench : Beginner",style: TextStyle(color: Colors.black,fontSize: 16),),
            ),
          ],
        )
    );
  }

}
