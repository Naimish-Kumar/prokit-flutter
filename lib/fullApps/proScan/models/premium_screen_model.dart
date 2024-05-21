import 'dart:ui';

class PremiumScreenModel {
  double? amount;
  int? months;
  List<Color>? color;

  PremiumScreenModel({this.amount, this.months, this.color});
}

List<PremiumScreenModel> premiumOptionList = [
  PremiumScreenModel(color: [Color(0xFFfe6f71), Color(0xFFf74f51)], months: 1, amount: 4.99),
  PremiumScreenModel(color: [Color(0xFFfeb244), Color(0xFFfa990c)], months: 3, amount: 9.99),
  PremiumScreenModel(color: [Color(0xFF667fff), Color(0xFF516dff)], months: 12, amount: 39.99),
];
