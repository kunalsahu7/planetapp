import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Home/controler/Controlerpage.dart';

class infoscreen extends StatefulWidget {
  const infoscreen({Key? key}) : super(key: key);

  @override
  State<infoscreen> createState() => _infoscreenState();
}

class _infoscreenState extends State<infoscreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? position;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 45));
    position = Tween<double>(begin: 40, end: 0).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  int index = Get.arguments;
  Homecontroler homeController = Get.put(Homecontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.grey,
          child: Stack(
            children: [
              Align(
                alignment: Alignment(-0.95, -0.95),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 30,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '${homeController.Plantes[index].Place}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 100,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Transform.rotate(
                  angle: position!.value,
                  child: Container(
                      height: 300,
                      width: 300,
                      child: Image.asset(
                        '${homeController.Plantes[index].Images}',
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${homeController.Plantes[index].Name}',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment(-10, 0),
                child: Text(
                  '${homeController.Plantes[index].Title}',
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.8, 0.10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      "${homeController.Plantes[index].KM}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "${homeController.Plantes[index].MS}",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(13),
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters.",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}