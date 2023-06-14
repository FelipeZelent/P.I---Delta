import 'package:appstore/screens/product_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    final _pageController = PageController();

    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("Inicio"),
            centerTitle: true,
          ),
          body: ProductScreen(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Favoritos"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: Container(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Carrinho"),
            centerTitle: true,
          ),
          body: Container(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Perfil"),
            centerTitle: true,
          ),
          body: Container(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}