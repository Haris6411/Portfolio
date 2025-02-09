import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'imp_info.dart';
import 'home.dart';

class Publications extends StatelessWidget {
  final List<Map<String, String>> publications = [
    {
      "title": "Automatic Generation Control in Renewables-Integrated Multi-Area Power Systems: A Comparative Control Analysis. Sustainability",
      "authors": "Ashfaq T, Mumtaz S, et al. (2024)",
      "url": "https://www.mdpi.com/2071-1050/16/13/5735"
    },
    {
      "title": "Energy Management System and Control of Plug-in Hybrid Electric Vehicle Charging Stations in a Grid-Connected Microgrid.",
      "authors": "Roaid M., Ashfaq, T., et al. (2024)",
      "url": "https://www.mdpi.com/2071-1050/16/20/9122"
    },
  ];

   Publications({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(), // Placing NavBar at the top
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
                // Right section for the Publications content, centered
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 350,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search Publications...",
                                prefixIcon: const Icon(Icons.search),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: publications.length,
                              itemBuilder: (context, index) {
                                final publication = publications[index];
                                return Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () => _launchURL(publication["url"]!),
                                          child: Text(
                                            publication["title"]!,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text.rich(
                                          TextSpan(
                                            children: [
                                              const TextSpan(
                                                text: "Authors: ",
                                                style: TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: publication["authors"]!.contains("Ashfaq T")
                                                    ? "Ashfaq T"
                                                    : publication["authors"],
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              TextSpan(
                                                text: publication["authors"]!.replaceFirst("Ashfaq T", ""),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () => _launchURL(publication["url"]!),
                                              icon: const Icon(Icons.picture_as_pdf, size: 18),
                                              label: const Text("PDF"),
                                            ),
                                            const SizedBox(width: 10),
                                            ElevatedButton.icon(
                                              onPressed: () {}, // Implement citation feature
                                              icon: const Icon(Icons.format_quote, size: 18),
                                              label: const Text("Cite"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
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