// import 'package:flutter/material.dart';
// import 'package:flutter_swipe_button/flutter_swipe_button.dart';
// import 'package:get/get.dart';
// import 'home_sreen.dart';
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Swipe Button Example'),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
//           child: SwipeButton.expand(
//             duration: const Duration(milliseconds: 200),
//             thumb: Container(
//               height: 50,
//               width: 70,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black12,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: const Center(
//                 child: Icon(
//                   Icons.arrow_forward_ios_rounded,
//                   color: Colors.blueAccent,
//                   size: 24,
//                 ),
//               ),
//             ),
//             activeThumbColor: Colors.white,
//             activeTrackColor: Colors.blueAccent.shade100,
//             onSwipe: () {
//               Get.to(() => const PDFScreen());
//             },
//             child: const Text(
//               "Swipe to continue",
//               style: TextStyle(
//                 color: Colors.red,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:swipeable_button_view/swipeable_button_view.dart';



class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment Screen'),
        backgroundColor: Color(0xFF009C41),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text('EUR',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey.shade500)),
                          ),
                          Text(
                            '20.00',
                            style: TextStyle(
                                fontSize: 80, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Container(
                        height: 60,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                child: Center(
                                  child: Image.asset(
                                    'assets/store.png',
                                    width: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFF009C41),
                                    shape: BoxShape.circle),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('First Order'),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text('Order Detail')
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SwipeableButtonView(
                  buttonText: 'SLIDE TO PAYMENT',
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                  ),
                  activeColor: Color(0xFF009C41),
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {


                    //TODO: For reverse ripple effect animation
                    setState(() {
                      isFinished = false;
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}