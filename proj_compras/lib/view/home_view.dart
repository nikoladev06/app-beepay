import 'package:flutter/material.dart';
import 'feedeventos_view.dart';
import 'feedprofissional_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  
  final List<Widget> _telas = [
    const ProfessionalFeedView(),
    const FeedEventosView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _telas[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.work_outline),
            activeIcon: Icon(Icons.work),
            label: 'Vagas',
            backgroundColor: Color(0xFF111112),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_outlined),
            activeIcon: Icon(Icons.event),
            label: 'Eventos',
            backgroundColor: Color(0xFF111112),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF45b5b7),
        unselectedItemColor: Colors.grey,
        backgroundColor: const Color(0xFF111112),
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }
}