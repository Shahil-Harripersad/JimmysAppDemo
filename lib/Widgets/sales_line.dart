import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/reports.dart';

//This class creates a widget for the sales line chart which will be used on the reports page

class SalesLineChart extends StatefulWidget {
  const SalesLineChart({Key? key}) : super(key: key);

  @override
  _SalesLineChartState createState() => _SalesLineChartState();
}

class _SalesLineChartState extends State<SalesLineChart> {
  List<charts.Series<Sales, DateTime>> _seriesLineData =
      []; //A list that will store all the sales data for the sales line chart report

  _generateData() {
    var lineChartSalesData = [
      //Stores all sales objects for the sales report
      //Hard coded for now
      Sales(DateTime(2022, 01, 1), 0),
      Sales(DateTime(2022, 01, 30), 38),
      Sales(DateTime(2022, 02, 28), 50),
      Sales(DateTime(2022, 03, 30), 40),
      Sales(DateTime(2022, 04, 1), 40)
    ];

    //Adding the lineChartSalesData (seen above) to the list
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Sales',
        data: lineChartSalesData,
        domainFn: (Sales sales, _) => sales.time,
        measureFn: (Sales sales, _) => sales.salesValue,
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); //This runs the original initState function that we inherited from the material app class (even though we override i)
    _seriesLineData = <charts.Series<Sales, DateTime>>[];
    _generateData(); //Generates all the data for the chart (method specified above)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'Sales for the first 4 months of 2022',
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: charts.TimeSeriesChart(
                      _seriesLineData, //Adding the sales data to the line chart
                      defaultRenderer: new charts.LineRendererConfig(
                          includeArea: true, stacked: true),
                      animate: true,
                      animationDuration: Duration(seconds: 3),
                      behaviors: [
                        charts.ChartTitle('Months',
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('Sales',
                            behaviorPosition: charts.BehaviorPosition.start,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
