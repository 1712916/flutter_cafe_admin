import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cafe_admin/router/app_router.dart';
import 'dart:math' as math;

import 'package:flutter_cafe_admin/widget/custom_expansion_tile.dart';
import 'package:flutter_cafe_admin/widget/icon_and_title_widget.dart';

const menuColor = const Color(0xFF676B84);
const menuSelectedColor = const Color(0xFF1F253A);

class MenuModel {
  final String name;
  final List<MenuModel> children;
  final VoidCallback onTap;

  MenuModel({
    required this.onTap,
    required this.name,
    required this.children,
  });
}

class BigMenuModel extends MenuModel {
  BigMenuModel({
    required super.name,
    required super.children,
    required super.onTap,
    required this.icon,
  });

  final String icon;
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<MenuModel> menu = [
    BigMenuModel(
      name: 'UI Component',
      children: [
        MenuModel(onTap: () {}, name: 'Elements', children: [
          MenuModel(onTap: () {}, name: 'Buttons', children: []),
          MenuModel(onTap: () {}, name: 'Dropdowns', children: []),
        ]),
        MenuModel(onTap: () {}, name: 'Components', children: []),
      ],
      icon: 'dashboard',
      onTap: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.router.pushNamed('user');
          },
          child: Container(
            width: 140,
            height: 100,
            margin: const EdgeInsets.all(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Cafe Manager'),
          ),
        ),
        InkWell(
          onTap: () {
            context.router.pushNamed('user2');
          },
          child: Container(
            width: 140,
            height: 100,
            margin: const EdgeInsets.all(40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text('Cafe Manager'),
          ),
        ),
        ...menu.map(
          (e) => ParentMenuWidget(
            menu: e,
          ),
        )
      ],
    );
  }
}

class ParentMenuWidget extends StatelessWidget {
  const ParentMenuWidget({super.key, required this.menu});

  final MenuModel menu;

  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      showContentAtBottom: true,
      tilePadding: EdgeInsets.zero,
      titleBuilder: (isExpanded) {
        final color = isExpanded ? menuSelectedColor : menuColor;
        return MenuIconTitleWidget(
            icon: Icon(
              Icons.home_filled,
              color: color,
              size: 16,
            ),
            title: menu.name,
            titleStyle: TextStyle(
              fontSize: 15,
              height: 22 / 15,
              color: color,
            ),
            tail: AnimatedRotation(
              turns: !isExpanded ? 0 : 0.5,
              duration: Duration(milliseconds: 300),
              child: Icon(
                Icons.keyboard_arrow_down_sharp,
                color: color,
                size: 16,
              ),
            ));
      },
      children: menu.children.map((e) => ChildMenuWidget(model: e)).toList(),
    );
  }
}

class MenuIconTitleWidget extends StatelessWidget {
  const MenuIconTitleWidget({
    super.key,
    required this.title,
    this.icon,
    this.tail,
    required this.titleStyle,
    this.iconAndTitleSpace = 16,
  });

  final String title;
  final TextStyle titleStyle;
  final Widget? icon;
  final Widget? tail;
  final double iconAndTitleSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconAndTitleWidget(
        icon: icon ?? const SizedBox(),
        iconAndTitleSpace: iconAndTitleSpace,
        title: Text(
          title,
          style: titleStyle,
        ),
        tail: tail,
      ),
    );
  }
}

class ChildMenuWidget extends StatelessWidget {
  final MenuModel model;

  const ChildMenuWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final widget = MenuIconTitleWidget(
      title: model.name,
      titleStyle: const TextStyle(
        fontSize: 13,
        height: 22 / 13,
        color: menuColor,
      ),
    );

    if (model.children.isNotEmpty) {
      return CustomExpansionTile(
        showContentAtBottom: true,
        tilePadding: EdgeInsets.zero,
        titleBuilder: (isExpanded) {
          final color = isExpanded ? menuSelectedColor : menuColor;

          return MenuIconTitleWidget(
            title: model.name,
            titleStyle: TextStyle(
              fontSize: 13,
              height: 22 / 13,
              color: color,
            ),
          );
        },
        children: model.children.map((e) => Child1MenuWidget(model: e)).toList(),
      );
    }

    return InkWell(
      onTap: () {},
      child: widget,
    );
  }
}

class Child1MenuWidget extends StatelessWidget {
  final MenuModel model;

  const Child1MenuWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    Widget child = MenuIconTitleWidget(
      iconAndTitleSpace: 20,
      title: model.name,
      titleStyle: const TextStyle(
        fontSize: 11,
        height: 22 / 11,
        color: menuColor,
      ),
    );
    if (model.children.isNotEmpty) {
      return CustomExpansionTile(
        showContentAtBottom: true,
        tilePadding: EdgeInsets.zero,
        titleBuilder: (isExpanded) {
          return child;
        },
        children: model.children.map((e) => Child1MenuWidget(model: e)).toList(),
      );
    }

    return InkWell(
      onTap: () {},
      child: child,
    );
  }
}
