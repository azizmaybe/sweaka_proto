import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SfCartesianChart(
     
   enableSideBySideSeriesPlacement: false,
  primaryXAxis: CategoryAxis(
    axisLine: AxisLine(width: 0),
    majorGridLines: MajorGridLines(width: 0)),

  legend: Legend(isVisible: false),
  series: <ColumnSeries<SalesData, String>>[
    ColumnSeries<SalesData, String>(
      dataSource: [
        SalesData('Lun', 250, 150, 25),
        SalesData('Mar', 80, 40, 20),
        SalesData('Mer', 160, 150, 30),
        SalesData('Jeu', 140, 50, 10),
        SalesData('Ven', 210, 170, 15),
        SalesData('Sam', 60, 30, 10),
        SalesData('Dim', 150, 110, 15),
      ],
      xValueMapper: (SalesData sales, _) => sales.day,
      yValueMapper: (SalesData sales, _) => sales.ventes,
       borderRadius: BorderRadius.vertical(
      top: Radius.circular(10),),
      color: SweakaColors.success
     
    ),
    ColumnSeries<SalesData, String>(
      dataSource: [
        SalesData('Lun', 250, 150, 25),
        SalesData('Mar', 80, 40, 20),
        SalesData('Mer', 160, 150, 30),
        SalesData('Jeu', 140, 50, 10),
        SalesData('Ven', 210, 170, 15),
        SalesData('Sam', 60, 30, 10),
        SalesData('Dim', 150, 110, 15),
      ],
      
      xValueMapper: (SalesData sales, _) => sales.day,
      yValueMapper: (SalesData sales, _) => sales.commandes,
      borderRadius: BorderRadius.vertical(
      top: Radius.circular(10),),
      color: SweakaColors.secondaryColor

    ),
    
     ColumnSeries<SalesData, String>(
      dataSource: [
        SalesData('Lun', 250, 150, 25),
        SalesData('Mar', 80, 40, 20),
        SalesData('Mer', 160, 150, 30),
        SalesData('Jeu', 140, 50, 10),
        SalesData('Ven', 210, 170, 15),
        SalesData('Sam', 60, 30, 10),
        SalesData('Dim', 150, 110, 15),
      ],
      xValueMapper: (SalesData sales, _) => sales.day,
      yValueMapper: (SalesData sales, _) => sales.damaged,
       borderRadius: BorderRadius.vertical(
      top: Radius.circular(10),),
      color: SweakaColors.error
     
    ),
    
  ],
),


    
    );
  }
}
class SalesData {
  SalesData(this.day, this.ventes,this.commandes,  this.damaged);
  final String day;
  final double commandes;
  final double ventes;
  final double damaged;
}

