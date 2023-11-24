import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
   MenuItem(
    title: 'Riverpod couter',
    subTitle: 'Intorudcion a riverpod',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    title: 'Botones',
    subTitle: 'Varios botones en fluteter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    title: 'Tarjetas',
    subTitle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    title: 'ProgressIndicators',
    subTitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbars y diálogos',
    subTitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    title: 'Animated container',
    subTitle: 'Stateful widget container',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItem(
    title: 'UI Controls + Tiles',
    subTitle: 'Una serie de controles en flutter',
    link: '/uicontrols',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    title: 'Introducción a la aplicación',
    subTitle: 'Pequeño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    title: 'InfiniteScreoll y Pull',
    subTitle: 'Listas infinitas y pull to refresh',
    link: '/infinitescroll',
    icon: Icons.list_alt_rounded,
  ), 
];
