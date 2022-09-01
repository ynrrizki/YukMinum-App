import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/dummy/product.dart';
import 'package:yukminum_app/message/snackbar.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';

class Qty extends Cubit<int> {
  Qty() : super(0);
  void add() => emit(state + 1);
  void remove() {
    if (state == 0) {
      emit(0);
    } else {
      emit(state - 1);
    }
  }
}

class AddToCart extends StatefulWidget {
  final int? id;
  final String? image;
  final String? name;
  final String? description;
  final String? price;
  const AddToCart({
    Key? key,
    this.id,
    this.image,
    this.name,
    this.description,
    this.price,
  }) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  String _radioVal = '';
  int qty = 1;
  Qty blocQty = Qty();
  final Map<String, bool> _isSelected = {
    'Regular': false,
    'Large': false,
  };

  @override
  void initState() {
    super.initState();
  }

  void _setRadioVal(String value) {
    setState(() {
      _radioVal = value;
      switch (value) {
        case 'Regular':
          _isSelected['Regular'] = true;
          _isSelected['Large'] = false;
          break;
        case 'Large':
          _isSelected['Regular'] = false;
          _isSelected['Large'] = true;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(widget.image!, fit: BoxFit.cover),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.5,
              minChildSize: 0.5,
              maxChildSize: 1,
              snapSizes: const [0.5, 1],
              builder: ((context, scrollController) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: bgColorPrimary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ListView(
                    // physics: const NeverScrollableScrollPhysics(),
                    controller: scrollController,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width / 3.5),
                        child: const Divider(
                          thickness: 5,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 21),
                        color: bgColorPrimary,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 255,
                                  child: Text(
                                    widget.name!,
                                    style: interTitle,
                                  ),
                                ),
                                Text(
                                  widget.price!,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.description!,
                              style: GoogleFonts.inter(
                                color: const Color(0xff939393),
                              ),
                            ),
                            const SizedBox(
                              height: 27,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Size',
                              style: interTitle.copyWith(
                                fontSize: 15,
                              ),
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              selected: _isSelected['Regular']!,
                              textColor: const Color(0xff939393),
                              selectedColor: Colors.black,
                              leading: Radio<String>(
                                value: 'Regular',
                                groupValue: _radioVal,
                                activeColor: Colors.black,
                                onChanged: ((value) {
                                  _setRadioVal(value!);
                                }),
                              ),
                              title: const Text('Regular'),
                            ),
                            ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              selected: _isSelected['Large']!,
                              textColor: const Color(0xff939393),
                              selectedColor: Colors.black,
                              leading: Radio<String>(
                                value: 'Large',
                                groupValue: _radioVal,
                                activeColor: Colors.black,
                                onChanged: ((value) {
                                  _setRadioVal(value!);
                                }),
                              ),
                              title: const Text('Large'),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(1)),
                              onPressed: () {},
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(0),
                                leading: Text(
                                  'Customize Order',
                                  style: interTitle.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.black,
                                ),
                                onTap: () => print('Customize Order'),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Special instructions',
                                  style: interTitle.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  'Optional',
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: ThemeData().colorScheme.copyWith(
                                      primary: Colors.black,
                                    ),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.multiline,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(
                                      left: 8.0, bottom: 8.0, top: 8.0),
                                  border: OutlineInputBorder(),
                                ),
                                textInputAction: TextInputAction.newline,
                                minLines: 1,
                                maxLines: 5,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ListTile(
                              contentPadding: const EdgeInsets.all(0),
                              iconColor: Colors.black,
                              leading: Text(
                                'Quantity',
                                style: interTitle.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              trailing: SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        blocQty.remove();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: const Icon(
                                          Icons.remove,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<Object>(
                                        stream: blocQty.stream,
                                        builder: (context, snapshot) {
                                          return Text('${snapshot.data ?? 0}',
                                              style: interTitle.copyWith(
                                                  fontSize: 15));
                                        }),
                                    TextButton(
                                      onPressed: () {
                                        blocQty.add();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            BtnLong(
                              title: 'Add To Cart',
                              scale: 3.8,
                              onPressed: () {
                                AnimatedSnackBar(
                                  builder: ((context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ListTile(
                                        leading: const CircleAvatar(
                                          backgroundColor: Colors.white,
                                          child: Icon(
                                            Icons.check,
                                            color: Colors.green,
                                          ),
                                        ),
                                        title: Text(
                                          addToCartSuccess,
                                          style: GoogleFonts.inter(
                                            color: Colors.white,
                                            fontSize: 12,
                                          ),
                                        ),
                                        trailing: TextButton(
                                          onPressed: () {
                                            //! Navigator.pushReplacementNamed(
                                            //!     context, '/checkout-page');
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    '/checkout-page',
                                                    (route) => false);
                                          },
                                          child: const Icon(
                                              Icons.add_shopping_cart),
                                        ),
                                      ),
                                    );
                                  }),
                                ).show(context);
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
