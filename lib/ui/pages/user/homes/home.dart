import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';
import 'package:yukminum_app/ui/components/widget_card_outlet.dart';
import 'package:yukminum_app/ui/components/widget_carousel_banner.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        //* -carousel-
        const CarouselBanner(),

        Container(
          color: bgColorPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* -new product-
              Text(
                'New Product',
                style: interTitle,
              ),
              const SizedBox(height: 21),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.06),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return CardMini(
                      index: index,
                      isNewProduct: true,
                    );
                  }),
              const SizedBox(height: 21),
              //* -our outlet-
              Text(
                'Our Outlet',
                style: interTitle,
              ),
              Text(
                'Find the nearest outlet in your area',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 21),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.3),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/outlet-pages');
                      },
                      child: CardOutlet(index: index),
                    );
                  }),
              const SizedBox(height: 21),
            ],
          ),
        ),
      ],
    );
  }
}
