import 'package:flutter/material.dart';
import 'package:myntra_clone/HomePageConstants/CategoriesName.dart';
import '../HomePageConstants/imageLinks.dart';
import '../Widgets/cached_image.dart';
import 'package:myntra_clone/Widgets/bottomNavigationBar.dart';

import 'InsiderPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: CustomBottomNavigationBar(),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        InsiderPage(), // Navigate to MainScreen directly
                  ),
                );
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Image.asset(("assets/myntraLogo.png")),
                            onPressed: () {}),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Become',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Insider",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0XFFA38A00),
                                  ),
                                ),
                                Image.asset(
                                  "assets/topnavigationBarIcons/greaterthan.png",
                                  width: 10,
                                  height: 10,
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: ImageIcon(AssetImage(
                            "assets/topnavigationBarIcons/bell.png",
                          )),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: ImageIcon(AssetImage(
                              "assets/topnavigationBarIcons/heart.png")),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: ImageIcon(
                            AssetImage("assets/topnavigationBarIcons/bag.png"),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: CategoriesName.Categories()
                    .map((e) => ImageLinks(
                          url: e,
                          height: 89,
                          width: 76,
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: banner1,
                      height: 361,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: free_shipping,
                      height: 47,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ImageLinks(
                          url: banner2,
                          width: (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).padding.left -
                                  MediaQuery.of(context).padding.right) *
                              0.50,
                          height: 360,
                        ),
                        ImageLinks(
                          url: banner3,
                          width: (MediaQuery.of(context).size.width -
                                  MediaQuery.of(context).padding.left -
                                  MediaQuery.of(context).padding.right) *
                              0.50,
                          height: 360,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: biggest_offers,
                      height: 63,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 275,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: CategoriesName.getBiggestOffers()
                            .map((e) => Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: ImageLinks(
                                    url: e,
                                    height: 273,
                                    width: 179,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: best_offers,
                      height: 63,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildOfferCard(context, kurta_offer, flipflop_offer,
                        watch_offer, loungewear_offer),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: festive_deals,
                      height: 63,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    buildOfferCard(context, seventy_off, under_399, buy_1_get_1,
                        sixty_off),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: daily_deals,
                      height: 63,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 265,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: CategoriesName.getDailyDeals()
                            .map((e) => Padding(
                                  padding: EdgeInsets.only(right: 5, left: 5),
                                  child: ImageLinks(
                                    url: e,
                                    height: 260,
                                    width: 171,
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ImageLinks(
                      url: featured_brands,
                      height: 63,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   child: Swiper(
                    //     duration: 500,
                    //     itemWidth: double.infinity,
                    //     pagination: SwiperPagination(
                    //       builder: SwiperPagination.dots,
                    //     ),
                    //     itemCount: HomeData.getFeaturedBrands().length,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       List<String> featuredBrands =
                    //           HomeData.getFeaturedBrands();
                    //       return CachedImage(
                    //         url: featuredBrands[index],
                    //       );
                    //     },
                    //     autoplay: true,
                    //   ),
                    //   height: 360,
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 50,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '"The great thing about fashion is that it always looks forward"',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Oscar De La Renta',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOfferCard(BuildContext context, String offer1, String offer2,
      String offer3, String offer4) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageLinks(
                  url: offer1,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                ImageLinks(
                  url: offer2,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImageLinks(
                  url: offer3,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                ImageLinks(
                  url: offer4,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
