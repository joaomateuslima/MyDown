import 'package:flutter/material.dart';
import 'package:my_down_project/components/my_list_tile.dart';
import 'package:my_down_project/pages/consult_page.dart';
import 'package:my_down_project/pages/exercise_page.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onProfileTap;
  final void Function()? onSignOut;
  const MyDrawer(
      {super.key, required this.onProfileTap, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromRGBO(0, 31, 89, 1.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //header
          Column(
            children: [
              DrawerHeader(
                child: Image.asset(
                  'lib/assets/images/mydown.png',
                  width: 450,
                  height: 450,
                ),
              ),

              //home list tile
              MyListTile(
                icon: Icons.message,
                text: 'M Y  D O W N',
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                icon: Icons.abc_sharp,
                text: 'E X E R C I T A N D O',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExercisePage()),
                  );
                },
              ),

              MyListTile(
                icon: Icons.info,
                text: 'C O N S U L T O R I A',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Page1()),
                  );
                },
              ),
              //profile list tile
              MyListTile(
                icon: Icons.person,
                text: 'P E R F I L',
                onTap: onProfileTap,
              ),
            ],
          ),
          //logout list tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              icon: Icons.logout,
              text: 'S A I R',
              onTap: onSignOut,
            ),
          ),
        ],
      ),
    );
  }
}
