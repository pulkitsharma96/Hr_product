import 'package:flutter/material.dart';

class ApplicantInfoScreen extends StatefulWidget {
  const ApplicantInfoScreen({super.key});

  @override
  State<ApplicantInfoScreen> createState() => _ApplicantInfoScreenState();
}

class _ApplicantInfoScreenState extends State<ApplicantInfoScreen> {

  List<Map<String, dynamic>> data = [
    {"APPLICANT ID": "D1", "APPLICANT NAME": "Jim",  "AGE": "24","Applied Post": "Senior Software Engineer","GENDER": "Male" ,
      "CURRENT POST": "Product Engineer","skills": "Java, React, Flutter, MySQL, Excel, MS Office,Java, React, Flutter, MySQL" },
    {"APPLICANT ID": "D2", "APPLICANT NAME": "Patrick", "AGE": "21", "Applied Post": "Senior Software Engineer","GENDER": "Male","CURRENT POST": "Product Engineer",
      "skills": "Java, React, Flutter, MySQL, Excel, MS Office"  },
    {"APPLICANT ID": "D3", "APPLICANT NAME": "Rick",    "AGE": "28", "Applied Post": "Senior Software Engineer","GENDER": "Male","CURRENT POST": "Product Engineer",
      "skills": "Java, React, Flutter, MySQL, Excel, MS Office"},
    {"APPLICANT ID": "D4", "APPLICANT NAME": "Patrica", "AGE": "22","Applied Post": "Senior Software Engineer", "GENDER": "Female",
      "CURRENT POST": "Product Engineer","skills": "Java, React, Flutter, MySQL, Excel, MS Office" },
    {"APPLICANT ID": "D5", "APPLICANT NAME": "Bob Moss","AGE": "30", "Applied Post": "Senior Software Engineer","GENDER": "Male",
      "CURRENT POST": "Product Engineer", "skills": "Java, React, Flutter, MySQL, Excel, MS Office"},
  ];

  List<Map<String,dynamic>> Resume_details = [
    { "icon" : Icons.mail_outline_outlined, "text" : "verjyo1234@gmail.com",},
    { "icon" : Icons.call, "text" : "+1 234 555 55 55"},
    { "icon" : Icons.location_on_outlined, "text" : "NY,USA"},
    { "icon" : Icons.link_rounded, "text" : "linkedln/jim.branders"},
  ];


  @override
  Widget build(BuildContext context) {
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
                Text("    "),
              ],
            ) ,
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: Column(
                      children: [
                        Profile(isMobile),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth*0.35,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Skills(isMobile),
                                Experience(isMobile),
                                Language(),
                              ],
                            ),
                          ),
                          Container(
                           // color: Colors.redAccent,
                            width: screenWidth*0.57,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Profile_Summary(isMobile),
                                Qualification(isMobile),
                                Projects(isMobile),
                              ],
                            ),
                          )

                        ],
                      ),
                      ],
                    )
              ),
            ),
          );
        }
    );
  }
  Widget Profile(isMobile){
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left:10,bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             isMobile
                 ?Column(
               mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                   CircleAvatar(
                   radius: 40,
                   backgroundImage: AssetImage("assets/images/resume_image1.jpg"),
                   ),
                   Text(data[0]["APPLICANT NAME"],style: TextStyle(fontSize: 24),),
                   Text(data[0]["CURRENT POST"],style: TextStyle(fontSize : 14),),
                   ],
                 )
                 : Row(
               mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("assets/images/resume_image1.jpg"),
                  ),
                  SizedBox(width: 25,),
                  Column(
                    children: [
                      Text(data[0]["APPLICANT NAME"],style: TextStyle(fontSize: 38),),
                      Text(data[0]["CURRENT POST"],style: TextStyle(fontSize : 18),),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 20),
                height: 90,
                width: 190,
                child: ListView.builder(
                    itemCount: Resume_details.length,
                    itemBuilder: (context,index){
                      return Container(
                        padding: EdgeInsets.only(top: 3),
                        child: Row(
                          children: [
                            Icon(Resume_details[index]["icon"],color: Colors.black,size: 20,),
                            SizedBox(width: 18),
                            Text(Resume_details[index]["text"],style: TextStyle(color: Colors.black,fontSize: 14),),
                          ]
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent
          ),
          child:  Text("Applied Post : "+data[0]["Applied Post"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
        ),
      ],
    );
  }
  Widget Skills(isMobile){
    return Container(
       // height: isMobile?150:130,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Skills : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: isMobile?100:80,
              child: Text(data[0]["skills"],style: TextStyle(color: Colors.black,fontSize: 16),),
            ),
          ],
        )
    );
  }
  Widget Experience(isMobile){
    return Container(
       // height: isMobile?290:220,
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Experience : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Container(
              height: isMobile?235:165,
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
  Widget Profile_Summary(isMobile){
    return Container(
      //height: isMobile?220:130,
      padding: EdgeInsets.all(10),
      //margin: EdgeInsets.only(left: 18),
      child: Container(
        height: isMobile?120:105,
        child: ListView(
          children: [
            Text("Profile Summary : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Padding(
              padding: EdgeInsets.only(top:8),
              child: Text("My passion for sustainable design and innovation drives my commitment to excellence in the "
                  "field of product engineering. Focused on product development, prototyping, and testing. Developed "
                  "and refined products based on market needs and feedback. Created prototypes to validate design concepts and gather user feedback."),
            )
          ],
        ),
      )



    );
  }
  Widget Qualification(isMobile){
    return Container(
       // height: 220,
        padding: EdgeInsets.all(10),
       // margin: EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Qualification : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Container(
              height: isMobile?235:165,
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
  Widget Projects(isMobile){
    return Container(
       // height: isMobile?290:220,
        padding: EdgeInsets.symmetric(horizontal: 10),
       // margin: EdgeInsets.only(left: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Projects : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Container(
              height: isMobile?235:165,
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
  Widget Language(){
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Language : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 16),),
            Divider(thickness: 2,color: Colors.black,height:1,endIndent: 8,),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 165,
              child: Text("Hindi : Native\nEnglish : Intermediate\nFrench : Beginner",style: TextStyle(color: Colors.black,fontSize: 16),),
           ),
          ],
        )
    );
  }

}
