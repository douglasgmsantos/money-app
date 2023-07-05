import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:money/src/styles/colors.dart';

class ChartBalance extends StatelessWidget {
  const ChartBalance({super.key});

  @override
  Widget build(BuildContext context) {
    List<_SalesData> data = [
      // _SalesData('Jan', 3500, -9000),
      _SalesData('Abr', 2800, -3200),
      _SalesData('Mai', 3400, -6000),
      _SalesData('Jun', 3200, -2800),
      _SalesData('Jul', 4000, -3500)
    ];

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Balanço Total",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(height: 10),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'R\$ 8.500,00',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor40,
              ),
            ),
          ),
          SfCartesianChart(
            primaryYAxis: NumericAxis(
                isVisible: false,
                majorGridLines: const MajorGridLines(color: Colors.transparent),
                numberFormat: NumberFormat.currency(
                  symbol: 'R\$ ',
                  decimalDigits: 2,
                )),
            primaryXAxis: CategoryAxis(
              isVisible: true,
              majorGridLines: const MajorGridLines(color: Colors.transparent),
            ),
            legend: const Legend(isVisible: false),
            enableSideBySideSeriesPlacement: false,
            plotAreaBorderWidth: 0,
            plotAreaBorderColor: Colors.transparent,
            plotAreaBackgroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            series: <ChartSeries<_SalesData, String>>[
              ColumnSeries<_SalesData, String>(
                  trackColor: AppColors.primaryColor,
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.month,
                  yValueMapper: (_SalesData sales, _) => sales.income,
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(color: Colors.black)),
                  color: AppColors.primaryColor40,
                  width: 0.25,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(10))),
              ColumnSeries<_SalesData, String>(
                  dataSource: data,
                  xValueMapper: (_SalesData sales, _) => sales.month,
                  yValueMapper: (_SalesData sales, _) => sales.outcome,
                  name: 'Sales',
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true,
                      textStyle: TextStyle(color: Colors.black)),
                  color: AppColors.primaryColor30,
                  width: 0.25,
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(10))),
            ],
          ),
        ],
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.month, this.income, this.outcome);

  final String month;
  final double income;
  final double outcome;
}
