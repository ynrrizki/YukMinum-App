import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yukminum_app/shared/themes/themes.dart';

class CarouselBanner extends StatefulWidget {
  const CarouselBanner({Key? key}) : super(key: key);

  @override
  State<CarouselBanner> createState() => _CarouselBannerState();
}

class _CarouselBannerState extends State<CarouselBanner> {
  int _indexCarousel = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  List<String> image = ['Banner1.png', 'Banner2.png'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "Today's Offer",
            style: interTitle,
          ),
        ),
        // carousel
        CarouselSlider.builder(
          itemCount: image.length,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) {
            return Align(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                // width: 250,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15.82),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/${image[itemIndex]}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
          options: CarouselOptions(
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlay: true,
            enlargeCenterPage: true,
            height: 175,
            onPageChanged: (int index, reason) {
              setState(() {
                _indexCarousel = index;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: map<Widget>(image, (index, url) {
              return Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _indexCarousel == index
                      ? const Color(0xff121212)
                      : const Color(0xffCCCCCC),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
