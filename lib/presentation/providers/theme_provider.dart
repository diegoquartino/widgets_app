import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/menu/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

// Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

// Un simple int
final selectedColorProvider = StateProvider((ref) => 0);

// un objeto de tipo AppTheme (custom)
final themeNotifierProvider =
    StateNotifierProvider<ThemeNotfier, AppTheme>((ref) => ThemeNotfier());

//> Hay genete que lo llama controller porque es la clase contorladora en el 'StateNotifierProvider'
//> Tiene que extender de 'StateNotifier' para qeu pueda ser aceptado por 'StateNotifierProvider'
//> El llamado al :Super( AppTheme() ) es necesario para establecer el estado inicial del mismo
//>
//> Definir esta clase que extiene de Notifier es definir nuesta propia clase notifier.
//> Cuando nosotros usamos ref.read(themeNotifierProvider.notifier), este themeNotifierProvider.notifier
//> en cierta forma es el que estamos definiendo en esa clase
// Controller o Notifier (cualquier nombre es correcto)
class ThemeNotfier extends StateNotifier<AppTheme> {
  // STATE = Estado = new AppTheme()
  ThemeNotfier()
      : super(AppTheme()); //> Generamos una nueva instancia de AppThem()

  void toogleDarkmode() {
    //> Bien podria cambiar la propiedad 'isDarkMode' asignandole un = false o = true
    //> pero esto daria error porque la propiedad isDarkMode es final
    //> lo que se debe hacer es generar un nuevo estado y asignarselo al state,
    //> para esto usamos el metodo copyWith que realizamos en la clase AppTheme para copiar la instancia (el estado)
    //state.isDarkMode = false; // Descomentar esta linea para ver el error

    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  //> Asigno al nuevo estado el nuevo indice de color
  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }
}
