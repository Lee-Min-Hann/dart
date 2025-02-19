import 'package:flutter/material.dart';
import 'package:tiket_wisata/constants/colors.dart';
import 'package:tiket_wisata/gen/assets.gen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: AppColors.secondaryColor,
      ),
            body:
             Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Home Screen'),
                  Image.asset(
                    Assets.images.download.path,
                  ),
                  Image.asset(
                    Assets.icons.images.path,
                  ),  
                ],
              ),
            ),
          );
        }
      }