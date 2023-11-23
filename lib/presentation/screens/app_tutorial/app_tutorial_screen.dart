import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Buscar la comida',
      'Commodo velit veniam cillum deserunt sint occaecat aliqua voluptate aliqua aliqua duis do elit.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Anim voluptate reprehenderit aliqua dolore magna elit ea non aliquip.',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida', 'Minim in eiusmod sunt eiusmod cillum.',
      'assets/images/3.png'),
];


//> Para poder usar el controller debemos convertir el widget AppTutorial a un StatefulWidget
class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  
  //> Variable de controlador de page view para poder controlar en que pagina estoy
  final PageController pageviewController = PageController();
  //> Variable en la que guardo el valor cuando llegue a la pagina final
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    //> Cuando se inicializa el estado del widget agrego un listener al controler
    //> para estar "escuchando" mientras se mueve la pagina y saber si llegue al final
    pageviewController.addListener(() {
        //> Variable en la que se guarda el valor de la pagina
        //> OJO! el valor de page es un decimal (usar print('${pageviewController.page}'); para ver el valor en debug)        
        final page = pageviewController.page ?? 0; 
        if (!endReached && page >= (slides.length - 1.5)) { //> -1.5 para que lo tome cuando llegue a la mitad de la ultima pagina
          setState(() {
            endReached = true;
          });
        }
      },
    );    
  }

  //> Siempre que hacemos un init
  @override
  void dispose() {
    pageviewController.dispose();    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageviewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl,
                  ),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 300),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar!'),
                    ),
                  ))
              : const SizedBox()
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle)
          ],
        ),
      ),
    );
  }
}
