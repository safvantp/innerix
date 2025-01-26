import 'dart:async';

import 'package:ecom/core/dummy%20data/dummy.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:auto_size_text/auto_size_text.dart';

class PremiumSlider extends StatefulWidget {
  @override
  _PremiumSliderState createState() => _PremiumSliderState();
}

class _PremiumSliderState extends State<PremiumSlider> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_currentPage < sliderData.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(255, 253, 238, 133),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: sliderData.length,
                  itemBuilder: (context, index, realIndex) {
                    return Row(
                      children: [
                        Container(
                          width: screenWidth * 0.4,
                          child: body1(),
                        ),
                        body2(),
                      ],
                    );
                  },
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    onPageChanged: (int page, CarouselPageChangedReason reason) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                  ),
                ),
                dots(currentPage: _currentPage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class dots extends StatelessWidget {
  const dots({
  super.key,
  required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sliderData.length,
              (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            width: _currentPage == index ? 13 : 5,
            height: _currentPage == index ? 5 : 5,
            decoration: BoxDecoration(
              color: _currentPage == index ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}

class body1 extends StatelessWidget {
  const body1({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://media.gettyimages.com/id/1755843600/photo/south-indian-women-in-white-saree-decorating-floor-with-flowers-together-to-celebrate-onam.jpg?s=612x612&w=gi&k=20&c=sE7gvL5rnw6v3jcDCc68vT18rSaPB8qRmbqevJ-7j9U=',
      fit: BoxFit.cover,
      width: 200,
      height: 200,
    );
  }
}

class body2 extends StatelessWidget {
  const body2({
  super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AutoSizeText(
              'Onam special\nExclusive offer',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              maxLines: 2, 
              minFontSize: 12, 
              overflow: TextOverflow.ellipsis,
              softWrap: true, 
            ),
            const SizedBox(height: 10),
            AutoSizeText(
              'et provident eos est dolor eum libro eliangil aut eum libro eliangil aut et',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
              maxLines: 3, 
              minFontSize: 10, 
              overflow: TextOverflow.ellipsis,
              softWrap: true, 
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}