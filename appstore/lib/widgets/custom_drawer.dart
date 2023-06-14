import 'package:flutter/material.dart';

import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 110.0,
                child: Stack(
                  children: [
                    Positioned(
                      top: 22.0,
                      left: 0.0,
                      child: Text(
                        "Delta Store",
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    
                  ],
                ),
              ),
              
              DrawerTile(Icons.home, "Inicio", pageController, 0),
              DrawerTile(Icons.favorite, "Favoritos", pageController, 1),
              DrawerTile(Icons.car_crash, "Carrinho", pageController, 2),
              DrawerTile(Icons.person, "Perfil", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
