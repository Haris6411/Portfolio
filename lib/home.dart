import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'projects.dart';
import 'publications.dart';
import 'contacts.dart';
import 'imp_info.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return const WideLayout();
                  } else {
                    return const NarrowLayout();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Tayyab Ashfaq',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              NavBarItem(
                  title: 'Home',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const Home()),
                    );
                  }),
              NavBarItem(
                  title: 'Publications',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Publications()),
                    );
                  }),
                                NavBarItem(
                  title: 'Projects',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsScreen()),
                    );
                  }),
              NavBarItem(
                  title: 'Resume',
                  onTap: () {
                    launchUrl(Uri.parse(
                        'https://drive.google.com/file/d/1EDZVsx4K6i6QxQligWTQV-aQvoYXUvZm/view?usp=drive_link'));
                  }),
              NavBarItem(
                  title: 'Contact',
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Contacts()),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold, // Make text bold
          ),
        ),
      ),
    );
  }
}

class WideLayout extends StatelessWidget {
  const WideLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Expanded(
          flex: 1,
          child: ImpInfo(), // Using ImpInfo here
        ),
        const SizedBox(width: 40),
        const Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BiographySection(),
              SizedBox(height: 30),
              InterestsSection(),
              SizedBox(height: 30),
              EducationSection(),
            ],
          ),
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  const NarrowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage('assets/mypic.png'),
        ),
        SizedBox(height: 20),
        Text(
          'Tayyab Ashfaq',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'MSc Candidate',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 30),
        BiographySection(),
        SizedBox(height: 30),
        InterestsSection(),
        SizedBox(height: 30),
        EducationSection(),
      ],
    );
  }
}

class BiographySection extends StatelessWidget {
  const BiographySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Biography',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
Text(
  'Tayyab Ashfaq is pursuing his second Master’s degree in Power Electronics and Controls at the University of Hertfordshire, UK. His research interests include load frequency control, energy management in microgrids, maximum power point tracking, economic optimization of energy systems, and neural network modeling. His publications include work on automatic generation control in renewable-integrated power systems and PHEV charging station management in microgrids.',
  style: TextStyle(fontSize: 16),
),

      ],
    );
  }
}

class InterestsSection extends StatelessWidget {
  const InterestsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Interests',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InterestItem(text: 'Power System Dynamics '),
            InterestItem(text: 'Renewable Energy Integration'),
            InterestItem(text: 'Control and Optimization'),
            InterestItem(text: 'Power Electronics'),
          ],
        ),
      ],
    );
  }
}

class InterestItem extends StatelessWidget {
  final String text;

  const InterestItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          const Icon(Icons.arrow_right, size: 20),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        EducationItem(
          degree: 'Master of Science-Power Electronics & Control',
          year: '(Sep 2024 - Current)',
          university: 'University of HertFordshire, UK',
        ),
        SizedBox(height: 10),
        EducationItem(
          degree: 'Master of Science-Electrical Engineering',
          year: '(March 2021 - March 2023)',
          university: 'Comsats University Islamabad, Pakistan',
        ),
        SizedBox(height: 10),
        EducationItem(
          degree: 'Bachelor of Science-Electrical Engineering',
          year: '(Oct 2015 - June 2019)',
          university: 'University of Wah, Pakistan',
        ),
      ],
    );
  }
}

class EducationItem extends StatelessWidget {
  final String degree;
  final String year;
  final String university;

  const EducationItem({
    super.key,
    required this.degree,
    required this.year,
    required this.university,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.school, size: 20),
            const SizedBox(width: 8),
            Text(
              '$degree, $year',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: Text(
            university,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}

class SocialIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialIcon({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
        color: Colors.blue,
      ),
    );
  }
}
