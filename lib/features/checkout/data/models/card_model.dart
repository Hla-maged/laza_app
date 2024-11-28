import 'package:laza_app/features/checkout/domain/entities/card_entity.dart';

class CardModel extends CardEntity {
  String? cardOwner;
  String? cardNumber;
  String? expirationDate;
  String? cvv;
  //String? cardType;

  CardModel({
    this.cardOwner,
    this.cardNumber,
    this.expirationDate,
    this.cvv,
    //  this.cardType,
  }) : super(
            name: cardOwner!,
            number: cardNumber!,
            cVV: cvv!,
            date: expirationDate!);

  factory CardModel.fromJson(Map<String, dynamic> json) => CardModel(
        cardOwner: json['CardOwner'] as String?,
        cardNumber: json['CardNumber'] as String?,
        expirationDate: json['ExpirationDate'] as String?,
        cvv: json['CVV'] as String?,
        //  cardType: json['CardType'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'CardOwner': cardOwner,
        'CardNumber': cardNumber,
        'ExpirationDate': expirationDate,
        'CVV': cvv,
        // 'CardType': cardType,
      };
}
