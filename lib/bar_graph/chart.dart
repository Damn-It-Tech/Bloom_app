import 'package:bloom/models/bar_chart_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriberChart extends StatelessWidget {
  final List<SubscriberSeries> data;
  final int selected;
  SubscriberChart({@required this.data, this.selected});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<SubscriberSeries, String>> series = [
      charts.Series(
          id: "Subscribers",
          data: data,
          domainFn: (SubscriberSeries series, _) => series.percentageText,
          measureUpperBoundFn: (SubscriberSeries series, _) => 100,
          measureFn: (SubscriberSeries series, _) => series.percent,
          colorFn: (SubscriberSeries series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Text(
                "Distribution of Q${selected.toString()} in different levels",
                textAlign: TextAlign.center,
                style:
                    GoogleFonts.poppins(color: Color(0xff352661), fontSize: 18),
              ),
            ),
            Expanded(
              child: charts.BarChart(series, animate: true),
            )
          ],
        ),
      ),
    );
  }
}
