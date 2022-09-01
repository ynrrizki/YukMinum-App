import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/dummy/product.dart';
import 'package:yukminum_app/ui/pages/material.dart';

class CardMini extends StatelessWidget {
  final int index;
  final bool isNewProduct;
  final bool isPromo;
  const CardMini({
    Key? key,
    required this.index,
    this.isNewProduct = false,
    this.isPromo = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> product = [];

    if (isNewProduct) {
      product = Product().data[0]['newProduct'];
    }

    if (isPromo) {
      product = Product().data[0]['promo'];
    }
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Tap'),
        ));
      },
      child: InkWell(
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
        child: Align(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                width: 91.61,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(20, 0, 0, 0),
                      blurRadius: 9,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        // ignore: unnecessary_null_in_if_null_operators
                        image: (product.asMap().containsKey(index))
                            ? DecorationImage(
                                image: AssetImage(product[index]['image']),
                                fit: BoxFit.cover,
                              )
                            : DecorationImage(
                                image: AssetImage(product[0]['image']),
                                fit: BoxFit.cover,
                              ),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      height: 83,
                    ),
                    const SizedBox(height: 4.5),
                    Text(
                        (product.asMap().containsKey(index))
                            ? product[index]['name']
                            : 'Salted Caramel',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    const SizedBox(height: 2),
                    Text(
                      (product.asMap().containsKey(index))
                          ? product[index]['description']
                          : '100% Arabica Espresso',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          (product.asMap().containsKey(index))
                              ? product[index]['price']
                              : "Rp.20K",
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
