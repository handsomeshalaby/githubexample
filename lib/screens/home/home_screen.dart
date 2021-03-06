import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:githubexample/models/models.dart';
import 'package:githubexample/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'home page'),
      bottomNavigationBar: CustomNavBar(),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                child: CarouselSlider(
                  options: CarouselOptions(
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      initialPage: 2,
                      viewportFraction: 0.9,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  items: Category.categories
                      .map((category) => HeroCarouselCard(category: category))
                      .toList(),
                ),
              ),
              SectionTitle(title: 'Recommended'),
              SizedBox(
                height: 5,
              ),
              ProductCarousel(
                products: Product.products
                    .where((product) => product.isRecommended)
                    .toList(),
              ),
              SectionTitle(title: 'Most Popular'),
              SizedBox(
                height: 5,
              ),
              ProductCarousel(
                products: Product.products
                    .where((product) => product.isPopular)
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
