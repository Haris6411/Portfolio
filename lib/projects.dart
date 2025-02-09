import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'imp_info.dart';
import 'home.dart';

class Project {
  final String title;
  final String duration;
  final String? link;

  Project({required this.title, required this.duration, this.link});
}

class ResearchExperience {
  final List<Project> academicProjects = [
    Project(
      title: "Load Frequency Control of Multi-area Power System",
      duration: "Sep 2022 – Mar 2023",
    ),
    Project(
      title: "Energy Management System for Grid Connected Micro-grid",
      duration: "Feb 2022 – July 2022",
    ),
    Project(
      title: "Global Maximum Power Point Tracking Controller under Partial Shading Conditions",
      duration: "Aug 2021 – Dec 2021",
    ),
  ];

  final List<Project> independentProjects = [
        Project(
      title: "Economic Optimization of New England's Energy Mix [Link]",
      duration: "2024",
      link: "https://github.com/malkaltayyab/Optimal_Energy_mix",
    ),
    Project(
      title: "Neural Network Model Training with Deep Learning Libraries with Python",
      duration: "2024",
    ),
  ];
}

class ProjectsScreen extends StatelessWidget {
  final ResearchExperience researchExperience = ResearchExperience();

  ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          Expanded(
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ImpInfo(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              "Research Experience",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            _buildProjectSection("Academic Projects", researchExperience.academicProjects),
                            const SizedBox(height: 30),
                            _buildProjectSection("Independent Projects", researchExperience.independentProjects),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectSection(String title, List<Project> projects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: projects.map((project) => _buildProjectItem(project)).toList(),
        ),
      ],
    );
  }

  Widget _buildProjectItem(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0), // Added spacing between projects
      child: GestureDetector(
        onTap: () {
          if (project.link != null) {
            _launchURL(project.link!);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  const Text("• ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)), // Bullet point
                  Expanded(
                    child: Text(
                      project.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: project.link != null ? Colors.blue : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              project.duration,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
