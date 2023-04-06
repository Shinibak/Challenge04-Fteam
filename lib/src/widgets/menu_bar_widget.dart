import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class MenuBarWidget extends StatelessWidget {
  final List menuList;
  final double screenSize;
  const MenuBarWidget({
    super.key,
    required this.menuList,
    required this.screenSize,
  });

  @override
  Widget build(BuildContext context) {
   
    return Container(
      height: screenSize * 0.282,
      width: screenSize,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(screenSize * 0.101),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: screenSize * 0.08,
              ),
              SizedBox(
                height: screenSize * 0.133,
                width: screenSize * 0.837,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menuList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        MenuButtonWidget(
                          icon: menuList[index].icon,
                          active: menuList[index].active,
                          screenSize: screenSize,
                        ),
                        if (index < menuList.length - 1)
                          SizedBox(width: screenSize * 0.042)
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
