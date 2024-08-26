import 'package:flutter/material.dart';
import 'package:sweaka_supervisor_2/constants/sweakaColors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../constants/SweakaTexts.dart';

class RadialBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      palette: [
        SweakaColors.secondaryColor
      ],
  annotations: <CircularChartAnnotation>[
              CircularChartAnnotation(
                widget: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      Text(
                        'Objectif/mois',
                        style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: SweakaColors.grey_text, 
                              fontFamily: 'Noto Sans'),
                      ),
                      SizedBox(height: 8),
                       RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '83',
                          style:  TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: SweakaColors.primaryColor, 
                              fontFamily: 'Noto Sans'),
                        ),
                        TextSpan(
                          text: '%',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              color: SweakaColors.grey_text, 
                              fontFamily: 'Noto Sans'),
                        ),
                      ],
                    ),
                  ),
                    ],
                  ),
                ),
              ),
            ],

      series: <RadialBarSeries>[
        RadialBarSeries<ChartData, String>(
          dataSource: <ChartData>[
            ChartData('Progress', 83),
          ],
          xValueMapper: (ChartData data, _) => data.progress,
          yValueMapper: (ChartData data, _) => data.value,
          maximumValue: 100,
         cornerStyle: CornerStyle.bothCurve,
          innerRadius: '55',     
        ),        
      ],
      
    );
  }
}

class ChartData {
  final String progress;
  final double value;

  ChartData(this.progress, this.value);
}