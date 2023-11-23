import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    //> Limpiamos el stack de snakbars que se genera al hacer muchos clicks sobre
    //> el boton Mostrar Snackbar
    ScaffoldMessenger.of(context).clearSnackBars();

    //> Diseño el snackbar que quiero mostrar
    final SnackBar snackbar = SnackBar(
        content: const Text('Hola mundo'),
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {},
        ),
        duration: const Duration(seconds: 1));

    //> Muestro el Snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible:
          false, //> Esto es para que no puedan hacer click afuera y cerrar el dialog
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estas Seguro?'),
        content: const Text(
            'Ullamco velit et est enim nulla occaecat culpa. Officia tempor Lorem magna minim consequat voluptate in reprehenderit magna proident aute do. Et duis sit consectetur proident. Tempor labore id cupidatat mollit pariatur fugiat in do enim commodo ex. Culpa nostrud eu labore enim irure duis consequat sint irure velit. Cupidatat commodo non sunt id dolore proident enim aliquip ex nisi tempor. Consequat ipsum eiusmod ipsum ex ipsum amet.'),
        actions: [
          //> context.pop() para cerrar el dialog
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar')),
        ],
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              child: const Text('Liecencias usadas'),
              onPressed: () {
                //> Flutter muestra un boton llamado 'View Licenses' automaticamente que muestra las licencias utilizadas
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Lorem est ullamco tempor id deserunt et consectetur velit aliquip ex consequat nisi. Incididunt proident enim exercitation fugiat ex voluptate non occaecat ad veniam nostrud consectetur et ea. Anim ad fugiat sunt tempor Lorem esse voluptate. Lorem officia minim dolor dolore ullamco aliquip.'),
                  ],
                );
              },
            ),
            FilledButton.tonal(
              child: const Text('Mostrar diálogo'),
              onPressed: () => openDialog(context),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
