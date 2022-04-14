import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meditation_app_ui/constants.dart';
import 'package:meditation_app_ui/widgets/bottom_nav_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

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
              color: kBlueLightColor,
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/meditation_bg.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                        text: 'Meditation\n',
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 40,
                            height: 1.5),
                        children: [
                          TextSpan(
                            text: '3-10 Mins Course\n',
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          TextSpan(
                            text:
                                'live happier and healthier by learning the fundamentals\nof meditation and mindfulness',
                            style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
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
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: const [
                        SessionCard(
                          sessionnum: 2,
                          isDone: true,
                        ),
                        SessionCard(
                          sessionnum: 2,
                        ),
                        SessionCard(
                          sessionnum: 3,
                        ),
                        SessionCard(
                          sessionnum: 4,
                        ),
                        SessionCard(
                          sessionnum: 5,
                        ),
                        SessionCard(
                          sessionnum: 6,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Text(
                      'Meditation',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: height * 0.1,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: kShadowColor,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg",
                          ),
                          const Spacer(),
                          RichText(
                            textAlign: TextAlign.left,
                            text: const TextSpan(
                              text: 'Basics 2\n',
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  height: 1.5),
                              children: [
                                TextSpan(
                                  text: 'Start your deepen you practise',
                                  style: TextStyle(
                                    color: kTextColor,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/icons/Lock.svg",
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    this.sessionnum,
    this.isDone = false,
    Key? key,
  }) : super(key: key);
  final int? sessionnum;
  final bool isDone;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: LayoutBuilder(builder: (context, constraint) {
        return Container(
          width: constraint.maxWidth / 2 - 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              )
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 43,
                      width: 43,
                      decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: kBlueColor,
                          )),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Session ' + sessionnum.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
