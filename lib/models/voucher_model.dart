import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String code;
  final double value;

  Voucher({required this.id, required this.code, required this.value});

  @override
  List<Object?> get props => [id, code, value];

  static List<Voucher> vouchers = [
    Voucher(id: 1, code: 'SAVE', value: 5.0),
    Voucher(id: 1, code: 'SAVE', value: 10.0),
    Voucher(id: 1, code: 'SAVE', value: 15.0),
  ];
}
