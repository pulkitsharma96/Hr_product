import 'package:flutter/material.dart';

class ApplicantInfo extends StatefulWidget {
  const ApplicantInfo({super.key});

  @override
  State<ApplicantInfo> createState() => _ApplicantInfoState();
}

class _ApplicantInfoState extends State<ApplicantInfo> {
  List<Map<String, String>> applicants = [
    {
      'name': 'John Doe',
      'role': 'Software Engineer',
      'experience': '1 year',
      'image': 'assets/Images/profile.jpg'
    },
    {
      'name': 'Jane Smith',
      'role': 'Product Manager',
      'experience': '3 years',
      'image': 'assets/Images/profile5.jpg'
    },
    {
      'name': 'Samuel Lee',
      'role': 'Data Scientist',
      'experience': '4 years',
      'image': 'assets/Images/profile4.webp'
    },
    {
      'name': 'Emily Davis',
      'role': 'UX Designer',
      'experience': '2 years',
      'image': 'assets/Images/profile2.jpg'
    },
    {
      'name': 'Michael Brown',
      'role': 'HR Manager',
      'experience': '3 years',
      'image': 'assets/Images/hr_pic.webp'
    },
    {
      'name': 'Sophia White',
      'role': 'Business Analyst',
      'experience': '5 years',
      'image': 'assets/Images/profile3.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWebScreen = screenWidth > 800;
    final crossAxisCount = isWebScreen ? 3 : 2;
    final cardWidth = 185.0;
    final profileRadius = isWebScreen ?  42.0 :32.0;
    final fontSizeName = isWebScreen ? 18.0 : 16.0;
    final fontSizeContent = isWebScreen ? 16.0 : 14.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "APPLICANT INFO",
          style: TextStyle(
              fontSize: 18, color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/Images/profile4.webp"),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications, size: 25,color: Colors.black87,),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 3 / 3,
          ),
          itemCount: applicants.length,
          itemBuilder: (context, index) {
            final applicant = applicants[index];
            return Container(
              width: cardWidth,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    blurRadius: 4,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Profile Image
                    CircleAvatar(
                      radius: profileRadius,
                      backgroundColor: Colors.white70,
                      backgroundImage: AssetImage(applicant['image']!),
                    ),
                    const SizedBox(height: 12),
                    // Applicant Name
                    Text(
                      applicant['name']!,
                      style: TextStyle(
                        fontSize: fontSizeName,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    // Role
                    Text(
                      "Role: ${applicant['role']!}",
                      style: TextStyle(
                        fontSize: fontSizeContent,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    // Experience
                    Text(
                      "Experience: ${applicant['experience']!}",
                      style: TextStyle(
                        fontSize: fontSizeContent,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Document for ${applicant['name']}"),
                            content: Text(
                                "Here you can show the document or further details related to ${applicant['name']}."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Close'),
                              ),
                            ],
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text(
                        "View Document",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
