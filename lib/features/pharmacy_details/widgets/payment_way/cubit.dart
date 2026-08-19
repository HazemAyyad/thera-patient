import 'package:bloc/bloc.dart';

import 'state.dart';

class PaymentWayCubit extends Cubit<PaymentWayState> {
  PaymentWayCubit() : super(PaymentWayStateInit());
  bool isDelivered = false;
  int selectedPaymentIndex = 0;

  void selectPayment(index) {
    selectedPaymentIndex = index;
    emit(SelectRadio());
  }

  void delivered() {
    isDelivered = !isDelivered;
    emit(Delivered());
  }
}
