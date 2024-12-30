import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:hr_product/Drawer.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HrAdminDashboard extends StatefulWidget {
  @override
  HrAdminDashboardState createState() => HrAdminDashboardState();
}

class HrAdminDashboardState extends State<HrAdminDashboard> {

  DateTime? _selectedDate;
  DateTime _focusedDate = DateTime.now();




  @override
  Widget build(BuildContext context) {
    List<OrdinalData> ordinalDataList = [
      OrdinalData(domain: 'Applied', measure: 40, color: Colors.purple),
      OrdinalData(domain: 'Interview 1', measure: 30, color: Colors.purple.shade200),
      OrdinalData(domain: 'Interview 2', measure: 20, color: Colors.purple.shade400),
      OrdinalData(domain: 'Offer', measure: 10, color: Colors.purple.shade800),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return Scaffold(
          appBar: isMobile
              ? AppBar(
            title: const Text(
              "DASHBOARD",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.deepPurple,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.black),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.black),
                onPressed: () {},
              ),
            ],
          )
              : null,
          drawer: isMobile
              ? DrawerScreen()
              : null,
          body: Row(
            children: [
              if (!isMobile)
                Container(
                  width: 250,
                  color: Colors.deepPurple,
                 child: DrawerScreen(),
                ),
              Expanded(
                child: Scaffold(
                  appBar: !isMobile
                      ? AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text("Hello Taruk, Welcome back, have a good day"),
                    backgroundColor: Colors.white,
                    actions: [
                      IconButton(
                        icon: const Icon(Icons.search, color: Colors.black),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.settings, color: Colors.black),
                        onPressed: () {},
                      ),
                    ],
                  )
                      : null,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: isMobile
                          ? Column(
                        children: [
                          _buildMrTarukContainer(),
                          const SizedBox(height: 16),
                          _buildDashboardCards(isMobile),
                          const SizedBox(height: 16),
                          _buildPieChartContainer(ordinalDataList),
                          const SizedBox(height: 16),
                          _buildCalendarContainer(),
                        ],
                      )
                          : Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: _buildDashboardCards(isMobile),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: _buildMrTarukContainer(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 13),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: _buildPieChartContainer(ordinalDataList),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                flex: 1,
                                child: _buildCalendarContainer(),
                              ),
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
        );
      },
    );
  }
  Widget _buildMrTarukContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage("assets/Images/profile.jpg"),
                  radius: 25),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mr. Taruk", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("HR Manager", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text("New Applicant"),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text("New Interview"),
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardCards(bool isMobile) {
    return GridView.count(
      crossAxisCount: isMobile ? 2 : 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 18,
      childAspectRatio: isMobile ? 2.0 : 3.0,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _buildDashboardCard("Resumes", "180"),
        _buildDashboardCard("Active Applicants", "20"),
        _buildDashboardCard("Scheduled Interviews", "10"),
        _buildDashboardCard("Pending Feedback", "5/10"),
      ],
    );
  }
  Widget _buildPieChartContainer(List<OrdinalData> ordinalDataList) {
    return Container(
      width: 550,
      height: 280,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Applicants by Interview Stage",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 180,
            child: DChartPieO(
              data: ordinalDataList,
              configRenderPie: ConfigRenderPie(
                strokeWidthPx: 2,
                arcLabelDecorator: ArcLabelDecorator(),
             //   animationDuration: Duration(milliseconds: 800),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPieItem(Colors.purple, "Applied"),
              _buildPieItem(Colors.purpleAccent, "Interview 1"),
              _buildPieItem(Colors.pinkAccent, "Interview 2"),
              _buildPieItem(Colors.deepPurple, "Offer"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPieItem(Color color, String text) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                width: 11,
                height: 11,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.rectangle,
                ),
              ),
              const SizedBox(width: 5,
              ),
              Text(text, style: const TextStyle(fontSize: 15,)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 350,
            child: TableCalendar(
              firstDay: DateTime.utc(2000, 1, 1),
              lastDay: DateTime.utc(2100, 12, 31),
              focusedDay: _focusedDate,
              selectedDayPredicate: (day) => isSameDay(_selectedDate, day),
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDate = focusedDay;
                });
              },
            ),
          ),
          if (_selectedDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                "Selected Date: ${DateFormat.yMMMd().format(_selectedDate!)}",
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildDashboardCard(String title, String count) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    value: 0.5,
                    strokeWidth: 8,
                    backgroundColor: Colors.grey[200],
                    valueColor: const AlwaysStoppedAnimation<Color>(
                        Colors.purple),
                  ),
                ),
                Text(
                  count,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}


