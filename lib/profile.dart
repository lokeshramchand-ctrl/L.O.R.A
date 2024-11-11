
/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        foregroundColor: Colors.pinkAccent,
        title: Text(
          "PROFILE",
          style: GoogleFonts.urbanist(), // Set the app bar title font
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_rounded),
          )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=386&q=80",
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Rachael Wagner",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.pinkAccent,
                    fontFamily: 'Urbanist', // Set the font to Urbanist
                  ),
                ),
                Text(
                  "Junior Product Designer",
                  style: TextStyle(
                      color: Colors.pinkAccent.withOpacity(0.7),
                      fontFamily: 'Urbanist'), // Set to Urbanist
                )
              ],
            ),
            const SizedBox(height: 25),
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: Text(
                    "Complete your profile",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                      fontFamily: 'Urbanist', // Set to Urbanist
                    ),
                  ),
                ),
                Text(
                  "(1/5)",
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return Expanded(
                  child: Container(
                    height: 7,
                    margin: EdgeInsets.only(right: index == 4 ? 0 : 6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: index == 0 ? Colors.blue : Colors.black12,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final card = profileCompletionCards[index];
                  return SizedBox(
                    width: 160,
                    child: Card(
                      shadowColor: Colors.black12,
                      color: Colors.grey[850],
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Icon(
                              card.icon,
                              size: 30,
                              color: Colors.pinkAccent,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              card.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.pinkAccent,
                                  fontFamily: 'Urbanist'), // Set to Urbanist
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              child: Text(
                                card.buttonText,
                                style: const TextStyle(
                                    color: Colors.pinkAccent,
                                    fontFamily: 'Urbanist'), // Set to Urbanist
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const Padding(padding: EdgeInsets.only(right: 5)),
                itemCount: profileCompletionCards.length,
              ),
            ),
            const SizedBox(height: 35),
            ...List.generate(
              customListTiles.length,
              (index) {
                final tile = customListTiles[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black12,
                    color: Colors.grey[850],
                    child: ListTile(
                      leading: Icon(tile.icon, color: Colors.pinkAccent),
                      title: Text(
                        tile.title,
                        style: const TextStyle(
                            color: Colors.pinkAccent,
                            fontFamily: 'Urbanist'), // Set to Urbanist
                      ),
                      trailing: const Icon(Icons.chevron_right,
                          color: Colors.pinkAccent),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class ProfileCompletionCard {
  final String title;
  final String buttonText;
  final IconData icon;
  ProfileCompletionCard({
    required this.title,
    required this.buttonText,
    required this.icon,
  });
}

List<ProfileCompletionCard> profileCompletionCards = [
  ProfileCompletionCard(
    title: "Set Your Profile Details",
    icon: CupertinoIcons.person_circle,
    buttonText: "Continue",
  ),
  ProfileCompletionCard(
    title: "Upload your resume",
    icon: CupertinoIcons.doc,
    buttonText: "Upload",
  ),
  ProfileCompletionCard(
    title: "Add your skills",
    icon: CupertinoIcons.square_list,
    buttonText: "Add",
  ),
];

class CustomListTile {
  final IconData icon;
  final String title;
  CustomListTile({
    required this.icon,
    required this.title,
  });
}

List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Activity",
  ),
  CustomListTile(
    icon: Icons.location_on_outlined,
    title: "Location",
  ),
  CustomListTile(
    title: "Notifications",
    icon: CupertinoIcons.bell,
  ),
  CustomListTile(
    title: "Logout",
    icon: CupertinoIcons.arrow_right_arrow_left,
  ),
];
*/ 

