import 'package:equatable/equatable.dart';

class ProcessingTask extends Equatable {
  final String label;

  const ProcessingTask({required this.label});

  @override
  List<Object?> get props => [label];
}
