import 'package:buchi_mobile_flutter/ui/components/page_with_appbar.dart';
import 'package:buchi_mobile_flutter/ui/controllers/home_controller.dart';
import 'package:buchi_mobile_flutter/ui/screens/home_screen.dart';
import 'package:buchi_mobile_flutter/ui/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final _controller = PageController();

  final _homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageWithAppBar(
        child: Expanded(
          child: PageView(
            controller: _controller,
            physics: NeverScrollableScrollPhysics(),
            children: [HomeScreen(), SearchScreen(), Container()],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "favorite"),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
            _controller.animateToPage(value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          });
        },
      ),
    );
  }
}
