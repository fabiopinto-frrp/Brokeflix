import 'package:flutter/material.dart';

class WatchListTopbar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const WatchListTopbar({
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  WatchListTopbarState createState() => WatchListTopbarState();
}

class WatchListTopbarState extends State<WatchListTopbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 457,
      height: 19,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 457,
            height: 19,
            child: Stack(
              children: [
                for (int i = 0; i < 6; i++)
                  Positioned(
                    left: i * 77,
                    top: 0,
                    child: GestureDetector(
                      onTap: () {
                        widget.onItemSelected(i);
                      },
                      child: Text(
                        getTextForIndex(i),
                        style: TextStyle(
                          color: i == widget.selectedIndex
                              ? const Color(0xFFFA3D3B)
                              : Colors.white,
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String getTextForIndex(int index) {
    switch (index) {
      case 0:
        return 'All';
      case 1:
        return 'Watching';
      case 2:
        return 'Completed';
      case 3:
        return 'Paused';
      case 4:
        return 'Dropped';
      case 5:
        return 'Planning';
      default:
        return '';
    }
  }
}
