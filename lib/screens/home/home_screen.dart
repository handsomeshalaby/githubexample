import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:githubexample/models/category_model.dart';
import 'package:githubexample/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'home page'),
      bottomNavigationBar: CustomNavBar(),
      body: Container(
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
    );
  }
}
