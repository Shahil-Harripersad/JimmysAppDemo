import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//This model defines data objects which will be constructed and used in the reports

class Sales {
  //Sales object
  DateTime time;
  int salesValue;

  Sales(this.time, this.salesValue);
}

class ProductSales {
  //Sales per product object

  String productName;
  int noOfProductSold;

  ProductSales(this.productName, this.noOfProductSold);
}
