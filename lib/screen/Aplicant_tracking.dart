import 'package:flutter/material.dart';
import 'package:hr_product/Drawer.dart';

class ApplicantTrackingScreen extends StatefulWidget {
  @override
  _ApplicantTrackingScreenState createState() =>
      _ApplicantTrackingScreenState();
}

class _ApplicantTrackingScreenState extends State<ApplicantTrackingScreen> {
  final List<Map<String, String>> applicants = [
    {
      'name': 'Steven Bing',
      'email': 'steven.bing@example.com',
      'jobTitle': 'Designer',
      'status': 'Onboarding',
    },
    {
      'name': 'Jane Cooper',
      'email': 'janecooper22@example.com',
      'jobTitle': 'User',
      'status': 'Active',
    },
    {
      'name': 'Cameron Williamson',
      'email': 'cameronwilliamson@example.com',
      'jobTitle': 'Supervisor',
      'status': 'Active',
    },
    {
      'name': 'Wade Warren',
      'email': 'wwarren@example.com',
      'jobTitle': 'Frontend Developer',
      'status': 'Declined',
    },
    {
      'name': 'Jane Cooper',
      'email': 'janecooper22@example.com',
      'jobTitle': 'User',
      'status': 'Active',
    },
    {
      'name': 'Cameron Williamson',
      'email': 'cameronwilliamson@example.com',
      'jobTitle': 'Supervisor',
      'status': 'Active',
    },
  ];

  Color getStatusColor(String status) {
    switch (status) {
      case 'Onboarding':
        return Colors.lightGreen;
      case 'Declined':
        return Colors.redAccent;
      case 'Active':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  void onStatusClicked(String status, String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$name\'s status clicked: $status'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 600;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: isMobile ? Colors.deepPurpleAccent : Colors.white,
            elevation: 0,
            title: Text(
              'Applicant Tracking',
              style: TextStyle(
                color: isMobile ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
          ),
          drawer: isMobile ? DrawerScreen() : null,
          body: Row(
            children: [
              if (!isMobile)
                Container(
                  child: DrawerScreen(),
                ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: EdgeInsets.all(isMobile ? 16.0 : 12.0),
                    child: Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                width: 200,
                                child: Text(
                                  'Name',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              Container(
                                width: 250,
                                child: Text(
                                  'Email',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Text(
                                  'Job Title',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                              Container(
                                width: 150,
                                child: Text(
                                  'Status',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: applicants.length,
                          itemBuilder: (context, index) {
                            final applicant = applicants[index];
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 200,
                                      child: Text(
                                        applicant['name'] ?? '',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      child: Text(
                                        applicant['email'] ?? '',
                                        style: TextStyle(color: Colors.grey[600]),
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      child: Text(
                                        applicant['jobTitle'] ?? '',
                                        style: TextStyle(color: Colors.grey[800]),
                                      ),
                                    ),
                                    Container(
                                      width: 150,
                                      child: InkWell(
                                        onTap: () => onStatusClicked(
                                            applicant['status']!,
                                            applicant['name']!),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 8.0),
                                          decoration: BoxDecoration(
                                            color: getStatusColor(
                                                applicant['status']!)
                                                .withOpacity(0.2),
                                            borderRadius:
                                            BorderRadius.circular(16),
                                          ),
                                          child: Center(
                                            child: Text(
                                              applicant['status'] ?? '',
                                              style: TextStyle(
                                                color: getStatusColor(
                                                    applicant['status']!),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
