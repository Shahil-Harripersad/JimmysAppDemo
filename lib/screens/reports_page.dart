import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/home_page.dart';
import '../Widgets/sales_line.dart';
import '../Widgets/sales_per_item_bar.dart';

class ReportsPage extends StatefulWidget {
  const ReportsPage({Key, key}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.red,
              //backgroundColor: Color(0xff308e1c),
              bottom: const TabBar(
                indicatorColor: Color(0xff9962D0),
                tabs: [
                  Tab(
                    icon: Icon(FontAwesomeIcons.chartLine),
                    text: "Sales report",
                  ),
                  Tab(
                    icon: Icon(FontAwesomeIcons.chartSimple),
                    text: "Product report",
                  ),
                  Tab(
                    icon: Icon(FontAwesomeIcons.chartPie),
                    text: "Rewards report",
                  ),
                ],
              ),
              title: Center(child: Text('Reports page')),
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
            //TabBar View contains all the elements of the Tab bar, there must be as many elements as there are tab bars, and they must be in the same order as the tab bars.
            body: TabBarView(children: [
              SalesLineChart(),
              ProductBarChart(),
              Center(child: Text("To be added."))
            ])),
      ),
    );
  }
}
