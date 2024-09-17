import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yoliday_portfolio/Pages/home.dart';
import 'package:yoliday_portfolio/Pages/input.dart';
import 'package:yoliday_portfolio/Pages/portfolio.dart';
import 'package:yoliday_portfolio/Pages/profile.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    PortfolioScreen(),
    InputScreen(),
    ProfileScreen(),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          // Floating image for filter
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(8.r),
              child: Container(
                height: 70.h, 
                width: 150.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/filter.png', 
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: const Radius.circular(20).w,
          ),
          boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius:2,
            spreadRadius:2,
          ),
        ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Indicator for the selected icon
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 2.0), // Reduced padding
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return Container(
                    height: 3.h,
                    width: 24.w,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xffDF5532)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(2).w,
                    ),
                  );
                }),
              ),
            ),
            BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: _onNavBarTapped,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.folder),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.input),
                  label: 'Input',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xffDF5532),
              unselectedItemColor: const Color(0xffE0E0E0),
            ),
          ],
        ),
      ),
    );
  }
}
