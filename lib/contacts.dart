import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'imp_info.dart';
import 'home.dart'; // Import your existing NavBar class

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const NavBar(), // Add your existing NavBar here

          Expanded(
            child: Row(
              children: [
                // Left section for ImpInfo
                const Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ImpInfo(), // This widget is on the left side
                    ),
                  ),
                ),

                // Right section for contact content, centered
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Contact Me',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    GestureDetector(
      onTap: () {
        launchUrl(Uri.parse('https://mail.google.com/mail/?view=cm&fs=1&to=malkaltayyab800@gmail.com'), 
        mode: LaunchMode.externalApplication);
      },
      child: const Row(
        children: [
           Icon(Icons.email, color: Colors.red),
           SizedBox(width: 10),
           Text(
            'malkaltayyab800@gmail.com',
            style: TextStyle(fontSize: 18, color: Colors.blue, decoration: TextDecoration.underline),
          ),
        ],
      ),
    ),
  ],
),
                          const SizedBox(height: 15),
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.access_time, color: Colors.blue),
                              SizedBox(width: 10),
                              Text(
                                'Monday to Friday 09:00 to 17:00',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              launchUrl(Uri.parse('https://your-dm-platform.com'));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    GestureDetector(
      onTap: () => launchUrl(Uri.parse('https://wa.me/447534820702')),
      child: Row(
        children: [
          IconButton(
            icon: const FaIcon(FontAwesomeIcons.whatsapp),
            onPressed: () => launchUrl(Uri.parse('https://wa.me/447534820702')),
          ),
          const SizedBox(width: 10),
          const Text("DM ME", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    ),
  ],
),
                            ),
                          ),
                        ],
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
}
