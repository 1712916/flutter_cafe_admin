import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cafe_admin/widget/menu.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7fafe),
      body: Row(
        children: [
          SizedBox(
            width: 200,
            child: MenuWidget(),
          ),
          Expanded(
            // nested routes will be rendered here
            child: AutoRouter(),
          )
        ],
      ),
    );
  }
}
