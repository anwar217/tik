import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:suiviprojet/BacklogButton.dart';
import 'package:suiviprojet/models/Project.dart';
import 'package:suiviprojet/models/Sprint.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final Project project;

  ProjectDetailsScreen(this.project);

  @override
  _ProjectDetailsScreenState createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
void _deleteSprint(Project project, int sprintId) {
  setState(() {
    final index = project.sprints.indexWhere((sprint) => sprint.id == sprintId);
    if (index != -1) {
      project.sprints.removeAt(index);
    }
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: Stack(
              children: [
                Image.asset(
                  'lib/images/avatar.png',
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.project.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.calendar_today,
                              color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Created on: ${DateFormat.yMMMMd().format(widget.project.createdAt)}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.person, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Users: ${widget.project.members.map((user) => '${user.firstName} ${user.lastName}').join(", ")}',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'Sprints',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle add sprint button press
                  },
                  child: Text('Ajout sprint'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.project.sprints.length,
              itemBuilder: (BuildContext context, int index) {
                Sprint sprint = widget.project.sprints[index];
                Color color = _getProjectColor(index % projectColors.length);
                Color nextColor =
                    _getProjectColor((index + 1) % projectColors.length);
                return Dismissible(
                  key: Key(sprint.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (direction) {
        setState(() {
          _deleteSprint(widget.project, sprint.id);
        });
      },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text(
                        sprint.nom,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        'Start: ${DateFormat.yMMMMd().format(sprint.datedebut)} - End: ${DateFormat.yMMMMd().format(sprint.datefin)}',
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
// Handle sprint item tap
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Color _getProjectColor(int index) {
    return projectColors[index % projectColors.length];
  }

  List<Color> projectColors = [
    Color.fromARGB(255, 81, 172, 224),
    Color.fromARGB(83, 88, 141, 192),
    const Color.fromARGB(255, 222, 199, 226),
  ];
}
