// import 'package:flutter/material.dart';
// import '../pages/animePage.dart';
// import '../pages/seriePage.dart';
// import '../pages/filmPage.dart';
// import '../pages/searchPage.dart';

// class TopBar extends StatelessWidget implements PreferredSizeWidget {
//   @override
//   Size get preferredSize => const Size.fromHeight(114);

//   @override
//   Widget build(BuildContext context) {
//     return PreferredSize(
//       preferredSize: const Size.fromHeight(114),
//       child: Container(
//         width: 402,
//         height: 114,
//         padding: const EdgeInsets.only(
//           top: 70,
//           left: 35,
//           right: 35,
//           bottom: 20,
//         ),
//         decoration: const BoxDecoration(color: Color(0xFF1C1C1C)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => SearchPage()),
//                 );
//               },
//               child: Image.asset(
//                 'assets/Search.png',
//                 width: 24,
//                 height: 24,
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(Color(0xFF1C1C1C)),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const FilmPage()),
//                 );
//               },
//               child: const Text(
//                 'Movies',
//                 style: TextStyle(
//                   color: Color(0xFFFA3D3B),
//                   fontSize: 16,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w700,
//                   height: 0,
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(Color(0xFF1C1C1C)),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SeriePage()),
//                 );
//               },
//               child: const Text(
//                 'Series',
//                 style: TextStyle(
//                   color: Color(0xFFFA3D3B),
//                   fontSize: 16,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w700,
//                   height: 0,
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               style: ButtonStyle(
//                 backgroundColor:
//                     MaterialStateProperty.all<Color>(Color(0xFF1C1C1C)),
//               ),
//               onPressed: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const AnimePage()),
//                 );
//               },
//               child: const Text(
//                 'Anime',
//                 style: TextStyle(
//                   color: Color(0xFFFA3D3B),
//                   fontSize: 16,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.w700,
//                   height: 0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
