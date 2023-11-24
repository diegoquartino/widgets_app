import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/menu/menu/menu_item.dart';

class SideMenu extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldState;

  const SideMenu({super.key, required this.scaffoldState});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    
    //> Preguntamos si el celular tiene notch para ubicar mejor el titulo de 'Main'
    bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);

        //> para cerrar el drawer
        widget.scaffoldState.currentState?.closeDrawer();

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Main'),
        ),
        
        ...appMenuItems.sublist(0, 3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),
        
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 28, 10),
          child: Text('More Options'),
        ),

        ...appMenuItems.sublist(3).map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.title),
              ),
            ),

      ],
    );
  }
}
