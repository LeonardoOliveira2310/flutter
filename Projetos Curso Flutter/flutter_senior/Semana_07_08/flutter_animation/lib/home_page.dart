import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      //print('${controller.offset} - ${controller.position.maxScrollExtent}');
    });
  }

  @override
  Widget build(BuildContext context) {
    final names = [
      'Creuzo',
      "imbonha",
      'Mané gavião',
      'Tonho',
      "Digingambianga",
      "Digililinga",
      "Jane Creide",
    ];
    return Scaffold(
      appBar: AppBar(),
      body: //CustomListView(controller: controller),
      CustomListViewBuilder(
        controller: controller,
        names: names,
      ),
    );
    //         GestureDetector(
    //     onDoubleTap: () {
    //       //Navigator.pop(context); //Utiliza-se com Navigator.pushNamed ou Navigator.push
    //       // if (Navigator.canPop(context)) { //Jeito mais complexo de se fazer
    //       //   Navigator.pop(context);
    //       // }
    //       //Navigator.maybePop(context); //Jeito mais simples de verificar
    //       Navigator.pushNamed(context, '/details', arguments: names);
    //     },
    //     child:
    // );
  }
}

class CustomListViewBuilder extends StatelessWidget {
  const CustomListViewBuilder({
    super.key,
    required this.controller,
    required this.names,
  });

  final ScrollController controller;
  final List<String> names;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      physics: BouncingScrollPhysics(),
      itemCount: names.length,
      itemBuilder: (context, index) {
        debugPrint(index.toString());
        final name = names[index];
        return GestureDetector(
          onDoubleTap: () {
            Navigator.pushNamed(context, '/details', arguments: name);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.red,
            ),
            child: Center(
              child: Text(" $name", style: TextStyle(fontSize: 30)),
            ),
          ),
        );
      },
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key, required this.controller});

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      //physics: BouncingScrollPhysics(),
      controller: controller,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
        ),
        SizedBox(height: 5),
        SizedBox(
          height: 200,
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.pink,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              ),
              SizedBox(width: 5),
              Container(
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black,
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
