abstract class PaymentWayState {}
class PaymentWayStateInit extends PaymentWayState{}
class Delivered extends PaymentWayState {}
class SelectRadio extends PaymentWayState {}
//   final int selectedPaymentIndex;
//
//   PaymentWayState({required this.selectedPaymentIndex});
//
//   PaymentWayState copyWith({int? selectedPaymentIndex}) {
//     return PaymentWayState(
//       selectedPaymentIndex: selectedPaymentIndex ?? this.selectedPaymentIndex,
//     );
//   }
// }
//
//
