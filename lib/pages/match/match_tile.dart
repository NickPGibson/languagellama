
import 'package:equatable/equatable.dart';

class MatchTile with EquatableMixin {

  final String text;
  final MatchTileState state;

  MatchTile({required this.text, required this.state});

  @override
  List<Object?> get props => [text, state];
}

enum MatchTileState {
  normal,
  selected
}
