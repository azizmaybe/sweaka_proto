import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:sweaka_supervisor_2/constants/sweakaText.dart';

class MyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    LineChartData data = LineChartData(
      
      lineTouchData: LineTouchData(enabled: false),
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(1, 0),
            FlSpot(2, 150),
            FlSpot(3, 60),
            FlSpot(4, 200),
            FlSpot(5, 40),
            FlSpot(6, 100),
            FlSpot(7, 50),
          ],
          isCurved: true,
          color: SweakaColors.secondaryColor,
          barWidth: 3,
          dotData: FlDotData(show: false)
        ),
      ],
      
      titlesData: FlTitlesData(
        show: true,
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: false),
        ),
        bottomTitles: AxisTitles(
          
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 15,
            
            getTitlesWidget: ((value, meta) {
            switch(value.toInt()) {
              case 1 : 
              return Text('LUN', style: SweakaText.overline);
              case 2 : 
              return Text('MAR', style: SweakaText.overline);
              case 3 : 
              return Text('MER', style: SweakaText.overline);
              case 4 : 
              return Text('JEU', style: SweakaText.overline);
              case 5 : 
              return Text('VEN', style: SweakaText.overline);
              case 6 : 
              return Text('SAM', style: SweakaText.overline);
               case 7 : 
              return Text('DIM', style: SweakaText.overline);
            }
            return Text('');
            }
            ),
        ),
      ),
      leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 40,

            getTitlesWidget: ((value, meta) {
            switch(value.toInt()) {
              case 0 : 
              return Text('0', style: SweakaText.overline);
              case 150 : 
              return Text('150', style: SweakaText.overline);
              case 50 : 
              return Text('50', style: SweakaText.overline);
              case 100 : 
              return Text('100', style: SweakaText.overline);
              case 200 : 
              return Text('200', style: SweakaText.overline);


            }
            return Text('');
            }
            ),
        ),
      ),
      ),
      
      gridData: FlGridData(
        show: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: SweakaColors.border_1,
            strokeWidth: 2,
          );
        },
        drawVerticalLine: false,
      ),
      borderData: FlBorderData(
  show: false,
)
    );

    return Container(
      padding: EdgeInsets.only(top: 40, right:20),
      height: 300,
      child: LineChart(
        data,
        swapAnimationDuration: Duration(milliseconds: 250),
      ),
    );
  }
}
