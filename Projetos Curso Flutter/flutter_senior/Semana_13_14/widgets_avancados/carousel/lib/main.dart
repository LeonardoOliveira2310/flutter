import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const CarouselPage(),
    );
  }
}

class CarouselPage extends StatelessWidget {
  const CarouselPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = List.generate(
      10,
      (index) => 'https://picsum.photos/600/400?random=$index',
    );
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.cast),
        title: Text("Carrossel com Picsum"),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsetsDirectional.only(end: 16.0),
            child: CircleAvatar(child: Icon(Icons.account_circle)),
          ),
        ],
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: CarouselView(
            itemExtent: 500,
            shrinkExtent: 100,
            children: [
              for (final url in imageUrls)
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) return child;
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  //Exemplo SEM o Carousel.View
  //   return Scaffold(
  //     appBar: AppBar(
  //       leading: const Icon(Icons.cast),
  //       title: Text("Carrossel com Picsum"),
  //       actions: const <Widget>[
  //         Padding(
  //           padding: EdgeInsetsDirectional.only(end: 16.0),
  //           child: CircleAvatar(child: Icon(Icons.account_circle)),
  //         ),
  //       ],
  //     ),
  //     body: PageView.builder(
  //       itemCount: imageUrls.length,
  //       controller: PageController(viewportFraction: 0.9),
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsetsGeometry.symmetric(
  //             horizontal: 8.0,
  //             vertical: 16.0,
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadiusGeometry.circular(16),
  //             child: Image.network(
  //               imageUrls[index],
  //               fit: BoxFit.cover,
  //               loadingBuilder: (context, child, progress) {
  //                 if (progress == null) return child;
  //                 return Center(child: CircularProgressIndicator());
  //               },
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}
