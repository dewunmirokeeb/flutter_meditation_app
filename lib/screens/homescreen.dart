import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app_ui/constants.dart';
import 'package:meditation_app_ui/screens/details.dart';
import 'package:meditation_app_ui/widgets/bottom_nav_bar.dart';
import '../widgets/category.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        color: Colors.white,
        height: height * 0.1,
        width: width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavBarItem(
              svgscr: 'assets/icons/calendar.svg',
              title: 'Today',
              press: () {},
            ),
            BottomNavBarItem(
              svgscr: 'assets/icons/gym.svg',
              title: 'All Exercise',
              press: () {},
              isactive: true,
            ),
            BottomNavBarItem(
              svgscr: 'assets/icons/Settings.svg',
              title: 'Settings',
              press: () {},
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: height * 0.45,
            decoration: const BoxDecoration(
              color: kHomeheaderColor,
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                          color: kHomeheadericonColor, shape: BoxShape.circle),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  const Text(
                    'Good Morning',
                    style: TextStyle(
                      color: kTextColor,
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: [
                        CategoryCard(
                          press: () {},
                          svgsrc: 'assets/icons/Hamburger.svg',
                          cardtitle: 'Diet Recomendation',
                        ),
                        CategoryCard(
                          press: () {},
                          svgsrc: 'assets/icons/Excrecises.svg',
                          cardtitle: 'Kegel Exercise',
                        ),
                        CategoryCard(
                          press: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const DetailsScreen();
                            }));
                          },
                          svgsrc: 'assets/icons/Meditation.svg',
                          cardtitle: 'Meditation',
                        ),
                        CategoryCard(
                          press: () {},
                          svgsrc: 'assets/icons/yoga.svg',
                          cardtitle: 'Yoga',
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
