import 'package:flutter/material.dart';
import 'package:primeiro_app/paginas/pagina_secundaria.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController();
  int indexBottomNavegatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Batata",
                style: TextStyle(
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Container(color: Colors.red),
          const PaginaSecundaria(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavegatorBar,
          onTap: (int page) => {
                setState(() {
                  indexBottomNavegatorBar = page;
                }),
                _pageController.animateToPage(
                  page,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                ),
              },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: 'item 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: 'item 2',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_laundry_service_sharp),
              label: 'item 3',
            ),
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
