// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'dart:convert';

// import 'package:shared_preferences/shared_preferences.dart';

// class PokemonDetailPage extends StatefulWidget {
//   final String name;
//   PokemonDetailPage({required this.name});
//   @override
//   _PokemonDetailPageState createState() => _PokemonDetailPageState();
// }

// class _PokemonDetailPageState extends State<PokemonDetailPage> {
//   Map<String, dynamic>? pokemonData;
//   bool isFavorite = false;

//   @override
//   void initState() {
//     super.initState();
//     fetchPokemonDetails();
//     checkFavoriteStatus();
//   }

//   Future<void> fetchPokemonDetails() async {
//     final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/${widget.name}'));
//     if (response.statusCode == 200) {
//       setState(() {
//         pokemonData = json.decode(response.body);
//       });
//     }
//   }

//   Future<void> checkFavoriteStatus() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isFavorite = prefs.getBool(widget.name) ?? false;
//     });
//   }

//   Future<void> toggleFavorite() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       isFavorite = !isFavorite;
//       prefs.setBool(widget.name, isFavorite);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(widget.name.toUpperCase())),
//       body: pokemonData == null
//           ? Center(child: CircularProgressIndicator())
//           : Column(
//               children: [
//                 Image.network(pokemonData!['sprites']['front_default']),
//                 Text('Height: ${pokemonData!['height']}'),
//                 Text('Weight: ${pokemonData!['weight']}'),
//                 Text('Base Experience: ${pokemonData!['base_experience']}'),
//                 Text('Abilities:'),
//                 Column(
//                   children: (pokemonData!['abilities'] as List)
//                       .map((e) => Text(e['ability']['name']))
//                       .toList(),
//                 ),
//                 IconButton(
//                   icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
//                   onPressed: toggleFavorite,
//                 ),
//               ],
//             ),
//     );
//   }
// }

import 'package:challenge_banpay/core/constants/ui_color.dart';
import 'package:challenge_banpay/data/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PokemonDetailPage extends StatelessWidget {
  const PokemonDetailPage({super.key, required this.product});
  final Product product;


   @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/back.svg',
            colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: SvgPicture.asset("assets/icons/search.svg"),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg"),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: product),
                        const SizedBox(height: kDefaultPaddin / 2),
                        Description(product: product),
                        const SizedBox(height: kDefaultPaddin / 2),
                        const CounterWithFavBtn(),
                        const SizedBox(height: kDefaultPaddin / 2),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Color"),
              Row(
                children: <Widget>[
                  ColorDot(
                    color: Color(0xFF356C95),
                    isSelected: true,
                  ),
                  ColorDot(
                    color: Color(0xFFF8C078),
                    isSelected: true,
                  ),
                  ColorDot(color: Color(0xFFA29B9B), isSelected: false),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: kTextColor),
              children: [
                const TextSpan(text: "Size\n"),
                TextSpan(
                  text: "${product.size} cm",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: kDefaultPaddin / 4,
        right: kDefaultPaddin / 2,
      ),
      padding: const EdgeInsets.all(2.5),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? color : Colors.transparent,
        ),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.description,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}

class CounterWithFavBtn extends StatelessWidget {
  const CounterWithFavBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const CartCounter(),
        Container(
          padding: const EdgeInsets.all(8),
          height: 32,
          width: 32,
          decoration: const BoxDecoration(
            color: Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        )
      ],
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: product.color,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                colorFilter: ColorFilter.mode(product.color, BlendMode.srcIn),
              ),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                backgroundColor: product.color,
              ),
              child: Text(
                "Buy  Now".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    const TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                if (numOfItems > 1) {
                  setState(() {
                    numOfItems--;
                  });
                }
              });
            },
            child: const Icon(Icons.remove),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 2),
          child: Text(
            // if our item is less  then 10 then  it shows 01 02 like that
            numOfItems.toString().padLeft(2, "0"),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              setState(() {
                numOfItems++;
              });
            },
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}