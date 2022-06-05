import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/reports.dart';

//This class creates a widget for the sales per item bar chart which will be used on the reports page

class ProductBarChart extends StatefulWidget {
  const ProductBarChart({Key? key}) : super(key: key);

  @override
  State<ProductBarChart> createState() => _ProductBarChartState();
}

class _ProductBarChartState extends State<ProductBarChart> {
  List<charts.Series<ProductSales, String>> _seriesBarData =
      []; //A list that will store all the sales data for the bar chart report

  _generateData() {
    var BarChartData = [
      //Stores all ProductSales objects for the product report
      //Hard coded for now
      ProductSales("Hake", 8),
      ProductSales("Toasted", 15),
      ProductSales("Chick strips", 28),
      ProductSales("Kota", 40),
    ];

    //Adding the BarChartData (seen above) to the list
    _seriesBarData.add(charts.Series(
      id: 'SalesPerProduct',
      colorFn: (_, __) =>
          charts.ColorUtil.fromDartColor(Color.fromARGB(255, 255, 157, 38)),
      domainFn: (ProductSales productSales, _) => productSales.productName,
      measureFn: (ProductSales productSales, _) => productSales.noOfProductSold,
      data: BarChartData,
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super
        .initState(); //This runs the original initState function that we inherited from the material app class (even though we override i)
    _seriesBarData = <charts.Series<ProductSales, String>>[];
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
                const Text(
                  'Sales per product for the year 2022',
                  style: TextStyle(fontSize: 21.0, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: charts.BarChart(_seriesBarData,
                      animate: true,
                      barGroupingType: charts.BarGroupingType.grouped,
                      //behaviors: [new charts.SeriesLegend()],
                      animationDuration: Duration(seconds: 3),
                      behaviors: [
                        charts.ChartTitle('Product',
                            behaviorPosition: charts.BehaviorPosition.bottom,
                            titleOutsideJustification:
                                charts.OutsideJustification.middleDrawArea),
                        charts.ChartTitle('No. of products sold',
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
