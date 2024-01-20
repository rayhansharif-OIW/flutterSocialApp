import 'package:flutter/material.dart';

class DefaultRouteWidget extends StatelessWidget {
  const DefaultRouteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// class CustomRoute extends Route {
//   var to;
//   CustomRoute({to = DefaultRouteWidget}) : super() {
//     this.to = to;
//   }
//   static route() => MaterialPageRoute(
//         builder: (context) => CustomRoute().to(),
//       );
// }

// class CustomRoute {
//   final Widget Function() to;

//   CustomRoute({required this.to});

//   MaterialPageRoute<Object?> route() {
//     return MaterialPageRoute(
//       builder: (context) => to(),
//     );
//   }
// }

// class CustomRouter {
//   final Widget destination;

//   CustomRouter({required this.destination});

//   MaterialPageRoute<Object?> route() {
//     return MaterialPageRoute(
//       builder: (context) => destination,
//     );
//   }
// }

class CustomRouter {
  final Widget? destination;

  CustomRouter({Widget? destination})
      : destination = destination ?? DefaultPage();

  MaterialPageRoute<Object?> route() {
    return MaterialPageRoute(
      builder: (context) => destination ?? DefaultPage(),
    );
  }
}

class DefaultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Default Page')),
      body: const Center(child: Text('This is the default page')),
    );
  }
}
