import 'package:bloom/bar_graph/chart.dart';
import 'package:bloom/models/bar_chart_model.dart';
import 'package:bloom/screens/add_file_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DetailedAnalysisScreen extends StatefulWidget {
  @override
  _DetailedAnalysisScreenState createState() => _DetailedAnalysisScreenState();
}

class _DetailedAnalysisScreenState extends State<DetailedAnalysisScreen> {
  int selected = 1;
  final List<SubscriberSeries> data = [
    SubscriberSeries(
      percentageText: "15",
      percent: 15,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffFFBF00)),
    ),
    SubscriberSeries(
      percentageText: "5",
      percent: 5,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffFF7300)),
    ),
    SubscriberSeries(
      percentageText: "25",
      percent: 25,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff27B6F4)),
    ),
    SubscriberSeries(
      percentageText: "35",
      percent: 35,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff27B6F4)),
    ),
    SubscriberSeries(
      percentageText: "45",
      percent: 45,
      barColor: charts.ColorUtil.fromDartColor(Color(0xffEA4970)),
    ),
    SubscriberSeries(
      percentageText: "55",
      percent: 55,
      barColor: charts.ColorUtil.fromDartColor(Color(0xff1E7B9B)),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_left,
                              size: 30,
                            )),
                        Expanded(
                          child: Text("Detailed Analysis",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  color: Color(0xff352661), fontSize: 25)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    height: 250,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.count(
                      scrollDirection: Axis.horizontal,
                      crossAxisCount: 5,
                      children: List.generate(50, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index + 1;
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: selected == (index + 1)
                                      ? Color(0xff352661)
                                      : Colors.transparent,
                                  border: Border.all(color: Color(0xff352661)),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                  child: Text(
                                (index + 1).toString(),
                                style: GoogleFonts.poppins(
                                    color: selected == (index + 1)
                                        ? Colors.white
                                        : Color(0xff352661)),
                              ))),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 50, vertical: 20),
                  //   child:
                  // ),
                  Container(
                      child: SubscriberChart(
                    data: data,
                    selected: selected,
                  )),
                  SizedBox(height: 90)
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  height: 90,
                  margin: EdgeInsets.only(top: 30),
                  child: SvgPicture.asset(
                    'assets/bottom_image.svg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
