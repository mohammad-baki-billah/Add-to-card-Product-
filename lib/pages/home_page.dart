import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_shop_app/componets/grocery_item_tile.dart';
import 'package:grocery_shop_app/model/card_model.dart';
import 'package:grocery_shop_app/pages/card_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Good morning!',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Lest\'s order some foods',
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text('Fresh items',
                  style: GoogleFonts.notoSerif(
                    fontSize: 16,
                  )),
            ),
            Expanded(child: Consumer<CardModel>(
              builder: (context, value, child) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1 / 1.1),
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, indext) {
                    return GroceryItemTile(
                      itemName: value.shopItem[indext][0],
                      itemPrice: value.shopItem[indext][1],
                      imagePath: value.shopItem[indext][2],
                      color: value.shopItem[indext][3],
                      onPressed: () {
                        Provider.of<CardModel>(context, listen: false)
                            .addItemTocart(indext);
                      },
                    );
                  },
                  itemCount: value.shopItem.length,
                );
              },
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const CardPage();
              },
            ),
          ),
          backgroundColor: Colors.black,
          child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
      ),
    );
  }
}
