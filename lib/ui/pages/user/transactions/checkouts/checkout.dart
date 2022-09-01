import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:yukminum_app/dummy/outlet.dart';
import 'package:yukminum_app/dummy/product.dart';
import 'package:yukminum_app/shared/themes/themes.dart';
import 'package:yukminum_app/ui/components/material.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Qty qty = Qty().instance();
    final List<Map<String, dynamic>> outlet = Outlet().data;
    final List<Map<String, dynamic>> product = Product().data;
    final items = List<String>.generate(2, (i) => '${i + 1}');

    return Scaffold(
      backgroundColor: bgColorPrimary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: false,
            pinned: false,
            floating: true,
            expandedHeight: 70,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            title: Text(
              'Checkout',
              style: interTitle,
            ),
            centerTitle: true,
            leading: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/user-pages');
              },
              child: const Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Order Type",
                              style: interTitle,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                primary: Colors.black,
                              ),
                              child: Row(
                                children: const [
                                  Text('Change'),
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Icon(Icons.edit_note),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 140,
                              width: 120,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey,
                                image: DecorationImage(
                                  image: AssetImage(outlet[0]['image']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Self Pick-up at',
                                  style: interTitle.copyWith(
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(outlet[0]['name']),
                                const SizedBox(height: 5),
                                SizedBox(
                                  width: 150,
                                  child: Text(
                                    outlet[0]['address'],
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.timer_outlined,
                                      size: 10,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Serving time: 10 min (1.2 km away)',
                                      style: GoogleFonts.inter(
                                        fontSize: 10.7,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.white,
                                    side: const BorderSide(
                                      color: Colors.black,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Directions',
                                        style: GoogleFonts.inter(
                                          color: Colors.black,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.directions_outlined,
                                        color: Colors.black,
                                        size: 17,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 0),
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    children: [
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            return Dismissible(
                              key: Key(item),
                              onDismissed: (direction) {
                                items.removeAt(index);
                              },
                              confirmDismiss:
                                  (DismissDirection direction) async {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm"),
                                      content: const Text(
                                          "Are you sure you wish to delete this item?"),
                                      actions: <Widget>[
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.red,
                                            ),
                                            onPressed: () =>
                                                Navigator.of(context).pop(true),
                                            child: const Text("DELETE")),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text("CANCEL"),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              background: Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  color: Color.fromARGB(255, 190, 109, 102),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: const [
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              child: Card(
                                // margin:
                                //     const EdgeInsets.symmetric(vertical: 10),
                                color: Colors.white,
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                elevation: 5,
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage(product[0]['coffee']
                                            [index]['image']),
                                      ),
                                    ),
                                  ),
                                  trailing: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            qty.remove();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: const Icon(
                                              Icons.remove,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        StreamBuilder<Object>(
                                            stream: qty.stream,
                                            builder: (context, snapshot) {
                                              return Text(
                                                  '${snapshot.data ?? 1}',
                                                  style: interTitle.copyWith(
                                                      fontSize: 15));
                                            }),
                                        TextButton(
                                          onPressed: () {
                                            qty.add();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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
                              ),
                            );
                          },
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(1)),
                        onPressed: () {},
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 10),
                          leading: Text(
                            'Add Promo',
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
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment Summary',
                                style: interTitle.copyWith(
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Price',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text(
                                    'Rp.40K',
                                    style: GoogleFonts.inter(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 25,
                      ),
                      BtnLong(title: 'Order', onPressed: () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Qty extends Cubit<int> {
  Qty() : super(0);

  Qty? _instance;

  Qty instance() {
    if (_instance != null) {
      return _instance!;
    }
    return _instance = Qty();
  }

  void add() {
    emit(state + 1);
  }

  void remove() {
    if (state == 1) {
      emit(1);
    } else {
      emit(state - 1);
    }
  }
}
