import 'package:equatable/equatable.dart';

class QuickAction extends Equatable {
  final String label;

  const QuickAction({required this.label});

  @override
  List<Object?> get props => [label];
}
