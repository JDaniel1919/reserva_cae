import 'package:flutter/material.dart';
import 'package:reserva_cae/Widgets/reusable_widgets.dart';
import 'package:reserva_cae/Widgets/reusable_widgets2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Computadoras extends StatefulWidget {
  Computadoras({Key? key}) : super(key: key);

  @override
  State<Computadoras> createState() => _ComputadorasState();
}

class _ComputadorasState extends State<Computadoras> {
  CarouselController buttonCarouselController = CarouselController();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Computadoras"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Color(0xffe0e0e0)),
        child: Padding(
            padding: EdgeInsets.fromLTRB(
                20,
                MediaQuery.of(context).size.height * 0.03,
                20,
                MediaQuery.of(context).size.height * 0.05),
            child: Column(children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Reserva tu computadora',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 22.0)),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(30.0),
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  "Manten limpios los equipos",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff800040),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Computadoras',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Sala ' + (activeIndex + 1).toString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.0)),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              CarouselSlider.builder(
                itemCount: 2,
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  height: 300,
                  viewportFraction: 1,
                  initialPage: 0,
                  reverse: false,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Expanded(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 4,
                    children: <Widget>[
                      for (var i = 1; i <= 12; i++)
                        GestureDetector(
                          onTap: () {
                          },
                          child: BotonReserva(
                              context, Icons.computer, "C" + i.toString()),
                        ),
                    ],
                  ),
                ),
              ),
              buildindicator(),

              // Expanded(
              //   child: GridView.count(
              //     crossAxisSpacing: 10,
              //     mainAxisSpacing: 10,
              //     crossAxisCount: 4,
              //     children: <Widget>[
              //       for(var i = 1;i<=12;i++) GestureDetector(
              //         onTap: () {},
              //         child: BotonCompu(context, Icons.computer, "C"+ i.toString()),
              //       ),
              //     ],
              //   ),
              // ),
            ])),
      ),
      drawer: DrawerP(context),
      //bottomNavigationBar: AppBarInf(context),
    );
  }

  Widget buildindicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 2,
        effect: WormEffect(
          activeDotColor: Color(0xff800040),
          dotWidth: 10,
          dotHeight: 10,
        ),
      );
}
