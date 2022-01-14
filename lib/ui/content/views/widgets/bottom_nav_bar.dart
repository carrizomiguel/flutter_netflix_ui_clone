import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:netflix_ui/ui/content/bloc/content_navigation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.currentView,
  }) : super(key: key);

  final ContentNavigation currentView;

  final Map<String, Map<String, dynamic>> _items = const {
    'Home': {
      'icon': Iconsax.home,
      'view': ContentNavigation.home,
    },
    'Coming Soon': {
      'icon': Iconsax.save_add,
      'view': ContentNavigation.comingSoon,
    },
    'Downloads': {
      'icon': Iconsax.import,
      'view': ContentNavigation.downloads,
    },
  };

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ContentNavigationBloc>();
    return BottomNavigationBar(
      items: _items.map((key, value) => MapEntry(
        key, BottomNavigationBarItem(
          icon: Icon(value['icon']),
          label: key,
        )
      )).values.toList(),
      currentIndex: _items.values.toList().indexWhere(
        (e) => e['view'] == bloc.viewIs
      ),
      selectedItemColor: Colors.white,
      selectedFontSize: 10,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 10,
      backgroundColor: Colors.black,
      onTap: (index) {
        bloc.add(ViewChangedTo(
          view: _items.values.toList()[index]['view'],
        ));
      },
    );
  }
}