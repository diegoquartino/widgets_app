import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  // List<int> imagesIds = [1, 2, 3, 4, 5, 6];
  List<int> imagesIds = [75,76,77,78,79];
  final ScrollController scrollController = ScrollController(); //> Controlador del scroll
  bool isLoading = false;
  
  //> Variable para saber si el widget esta montado al llamar al SetState
  //> si no esta montado es porque se le hizo un dispose
  bool isMounted = true;

  @override
  void initState() {
    //> Agregamos el listener
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        // Load next page
        loadNextPage();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  //> Funcion que carga mas imagenes
  Future loadNextPage() async {
    //> Mientras este cargando no vuelvo a cargar
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    addFiveImages();
    isLoading = false;

    //> Reviso si esta montado el componente / widget
    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  //> funcion para añadir nuevas iagenes (añade nuevos id's)
  void addFiveImages() {
    final lastId = imagesIds.last;

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  //> Funcion que se llama cuando se ejecuta el RefreshIndicator
  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));

    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});    
  }

  //> Funcion que mueve el scroll una vez cargadas las imagenes
  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 80,
        duration: const Duration(milliseconds: 700),
        curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage('https://picsum.photos/id/${imagesIds[index]}/500/300'),
                imageErrorBuilder: (context, error, stackTrace) => Image.asset('assets/images/jar-loading.gif', fit: BoxFit.cover),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: !isLoading
            ? FadeIn(child: const Icon(Icons.arrow_back_ios_new_outlined))
            : SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_outlined)),
      ),
    );
  }
}
