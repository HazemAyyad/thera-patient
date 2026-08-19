import 'package:equatable/equatable.dart';

class CalenderState extends Equatable {
  final DateTime selectedDate;
  final DateTime focusedDate;
  final List<DateTime> availableDays;
  final List<DateTime> unavailableDays;

  const CalenderState({
    required this.selectedDate,
    required this.focusedDate,
    required this.availableDays,
    required this.unavailableDays,
  });

  factory CalenderState.initial() {
    final now = DateTime.now();
    return CalenderState(
      selectedDate: now,
      focusedDate: now,
      availableDays: const [],
      unavailableDays: const [],
    );
  }

  CalenderState copyWith({
    DateTime? selectedDate,
    DateTime? focusedDate,
    List<DateTime>? availableDays,
    List<DateTime>? unavailableDays,
  }) {
    return CalenderState(
      selectedDate: selectedDate ?? this.selectedDate,
      focusedDate: focusedDate ?? this.focusedDate,
      availableDays: availableDays ?? this.availableDays,
      unavailableDays: unavailableDays ?? this.unavailableDays,
    );
  }

  @override
  List<Object> get props => [selectedDate, focusedDate, availableDays, unavailableDays];
}
