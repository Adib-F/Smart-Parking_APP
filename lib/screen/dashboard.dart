import 'package:flutter/material.dart';
import 'dart:async';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1E40AF),
                Color(0xFF06B6D4)
              ], // from-blue-700 to-cyan-500
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
        ),
        title: Text(
          'Selamat Datang',
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Adib',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/siberian.png'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Stack(
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: [
                      Image.asset('assets/images/Gedung.jpg',
                          fit: BoxFit.cover),
                      Image.asset('assets/images/cover.jpg', fit: BoxFit.cover),
                      Image.asset('assets/images/techno.jpg',
                          fit: BoxFit.cover),
                    ],
                  ),
                  // Indicator dots
                  Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 4),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentPage == index
                                ? Colors.white
                                : Colors.white.withOpacity(0.4),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Button 1')),
                ElevatedButton(onPressed: () {}, child: Text('Button 2')),
                ElevatedButton(onPressed: () {}, child: Text('Button 3')),
              ],
            ),
            SizedBox(height: 20),
            Card(
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MUHAMMAD ADIB FAKIRI SIREGAR',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Pengguna sejak 2025'),
                    SizedBox(height: 8),
                    Text('NIM/NIK/NDN: 3312301097'),
                    SizedBox(height: 8),
                    Text('Jenis Pengguna: mahasiswa'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
