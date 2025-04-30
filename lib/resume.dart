import 'package:flutter/material.dart';

class Resume extends StatefulWidget {
  const Resume({super.key});

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = 'Email'; // initState में initialize किया
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return LayoutBuilder(builder: (context, constraints) {
      bool isMobile = constraints.maxWidth < 800;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: isMobile
            ? AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "RESUMES",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.black),
            ),
          ],
        )
            : null,
        drawer: isMobile ? appDrawer() : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isMobile
                ? Column(
              children: [
                _buildSearchContainer(),
                const SizedBox(height: 10),
                _buildEmailContainer(),
                const SizedBox(height: 10),
                _buildTableContainer(),
              ],
            )
                : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isMobile)
                  SizedBox(
                    width: 250,
                    height: screenHeight,
                    child: appDrawer(),
                  ),
                Expanded(
                  child: Column(
                    children: [
                      AppBar(
                        backgroundColor: Colors.white,
                        automaticallyImplyLeading: false,
                        title: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "Resumes Screen",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications, color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          _buildSearchContainer(),
                          const SizedBox(height: 10),
                          _buildEmailContainer(),
                          const SizedBox(height: 10),
                          _buildTableContainer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget appDrawer() {
    return Drawer(
      shape: const RoundedRectangleBorder(),
      backgroundColor: Colors.deepPurple,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepPurple),
            child: Text(
              'HR Admin',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          _buildDrawerItem(Icons.dashboard, "Dashboard", () {}),
          _buildDrawerItem(Icons.people, "Resumes", () {}, isSelected: true),
          _buildDrawerItem(Icons.person_add, "Applicant Tracking", () {}),
          _buildDrawerItem(Icons.analytics, "Interview Scheduling", () {}),
          _buildDrawerItem(Icons.calendar_today_rounded, "Interviewer Assignment", () {}),
          _buildDrawerItem(Icons.settings, "Reports", () {}),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap, {bool isSelected = false}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: TextStyle(color: isSelected ? Colors.yellow : Colors.white),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSearchContainer() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search_rounded),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            hintText: "Search by job title, name",
          ),
        ),
      ),
    );
  }

  Widget _buildEmailContainer() {
    return Container(
      child: Row(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("Applicants Lists"),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: DropdownButtonFormField<String>(
              value: _selectedItem,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              ),
              items: <String>['Email', 'Rejection Email', 'Interview Invite']
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
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  Widget _buildTableContainer() {
    return DataTable(
      border: TableBorder.all(color: Colors.grey),
      columns: const [
        DataColumn(
          label: Text(
            "Select",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            "Name",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            "Applied Role",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            "Experience",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: [
        _buildDataRow('John Dae', 'Software Engineer', '1 year'),
        _buildDataRow('Jane Smith', 'Product Manager', '3 years'),
        _buildDataRow('Samuel Lee', 'Data Scientist', '4 years'),
        _buildDataRow('John Dae', 'Software Engineer', '2 years'),
        _buildDataRow('Taruk Smith', 'HR Manager', '3 years'),
      ],
    );
  }

  DataRow _buildDataRow(String name, String role, String experience) {
    return DataRow(
      cells: [
        DataCell(Checkbox(value: false, onChanged: (bool? value) {})),
        DataCell(Text(name)),
        DataCell(Text(role)),
        DataCell(Text(experience)),
      ],
    );
  }
}
