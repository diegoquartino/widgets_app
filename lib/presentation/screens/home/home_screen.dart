import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/theme/menu/menu/menu_item.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  
  static const String name = 'home_screen';  

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> scaffoldState =  GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldState,
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldState: scaffoldState),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
  
        //> LLAMDAS PROPIAS DE Flutter
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (context) => const ButtonsScreen()),
        // );

        //Navigator.pushNamed(context, menuItem.link);

        //> LLAMDAS PROPIAS DE GoRouter
        //> Para el caso de que quiera llamarlo a traves del link
        context.push(menuItem.link);

        //> Para el caso de que quiera llamarlo a traves del nombre
        //> en este caso no importa si toco Botones o Tarjetas siempre se llama a CardsScreen.name
        //> para poder ir a cada uno tendria que tener el nombre en la definicion de menu_item.dart
        //> y no queremos agregar mas campos
        //context.pushNamed( CardsScreen.name );
        
      },
    );
  }
}
