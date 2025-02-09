import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/home.dart';
import 'package:url_launcher/url_launcher.dart';

class ImpInfo extends StatelessWidget {
  const ImpInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Column(
            children: [
CircleAvatar(
  radius: 120,
  backgroundColor: Colors.transparent, // Optional, for better appearance
  child: ClipOval(
    child: Container(
      width: 220, // Adjust width for zoom effect
      height: 220, // Adjust height for zoom effect
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/mypic.png'),
          fit: BoxFit.contain, // Ensures the image scales down
        ),
      ),
    ),
  ),
),

              const SizedBox(height: 20),
              const Text(
                'Tayyab Ashfaq',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'University of Hertfordshire, UK',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialIcon(
                    icon: Icons.email,
                    onTap: () async {
                      final Uri emailUri =
                          Uri.parse('mailto:malkaltayyab800@gmail.com');
                      if (await canLaunchUrl(emailUri)) {
                        await launchUrl(emailUri);
                      } else {
                        print("Could not launch email app");
                      }
                    },
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.linkedin,
                        color: Colors.blue),
                    onPressed: () => launchUrl(Uri.parse(
                        'https://www.linkedin.com/in/malkal-tayyab/')),
                  ),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.whatsapp,
                        color: Colors.blue),
                    onPressed: () =>
                        launchUrl(Uri.parse('https://wa.me/447534820702')),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

