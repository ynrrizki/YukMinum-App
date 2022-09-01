import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/dummy/outlet.dart';
import 'package:yukminum_app/dummy/product.dart';
import 'package:yukminum_app/shared/themes/themes.dart';

class CardOutlet extends StatelessWidget {
  final int index;
  const CardOutlet({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> outlet = Outlet().data;
    return Align(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            width: 148.95,
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
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    // ignore: unnecessary_null_in_if_null_operators
                    image: (outlet.asMap().containsKey(index))
                        ? DecorationImage(
                            image: AssetImage(outlet[index]['image']),
                            fit: BoxFit.cover,
                          )
                        : DecorationImage(
                            image: AssetImage(outlet[0]['image']),
                            fit: BoxFit.cover,
                          ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  height: 137,
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      outlet[0]['name'],
                      style: interTitle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      outlet[0]['address'],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff939393),
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('±${outlet[0]['m']}m'),
                        const Icon(Icons.arrow_right_alt),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
