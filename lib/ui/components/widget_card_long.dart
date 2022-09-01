import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/dummy/product.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/pages/material.dart';

class CardLong extends StatelessWidget {
  final int index;
  final bool isCoffee;
  final bool isMilkshake;
  const CardLong({
    Key? key,
    required this.index,
    this.isCoffee = false,
    this.isMilkshake = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> product = [];

    if (isCoffee) {
      product = Product().data[0]['coffee'];
    }

    if (isMilkshake) {
      product = Product().data[0]['milkshake'];
    }

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddToCart(
              id: product[index]['id'],
              image: product[index]['image'],
              name: product[index]['name'],
              description: product[index]['description'],
              price: product[index]['price'],
            ),
          ),
        );
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.92)),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.grey,
                image: (product.asMap().containsKey(index))
                    ? DecorationImage(
                        image: AssetImage(product[index]['image']))
                    : DecorationImage(image: AssetImage(product[0]['image'])),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (product.asMap().containsKey(index))
                            ? product[index]['name']
                            : (isCoffee)
                                ? 'Coffee Aren'
                                : 'Salted Caramel Pretzel Milkshake',
                        style: interTitle.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        width: 150,
                        child: Text(
                          (product.asMap().containsKey(index))
                              ? product[index]['description']
                              : 'Espresso, Susu Segar, Caramel Dan Krim Macchiato',
                          style: GoogleFonts.inter(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star_border, size: 15.0),
                      Text(
                        (product.asMap().containsKey(index))
                            ? product[index]['rate'].toString()
                            : '4.9',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'Rp.20K',
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(
              width: 25,
            ),
          ],
        ),
      ),
    );
  }
}
