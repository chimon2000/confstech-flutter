import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:confs_tech/models/models.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  factory FavoriteState.initial() = FavoriteStateInitial;
  factory FavoriteState.loaded({List<Event> favorites}) = FavoriteStateLoaded;
  factory FavoriteState.error(dynamic error) = FavoriteStateError;

  @override
  List<Object> get props => [];
}

@immutable
class FavoriteStateInitial extends FavoriteState {
  FavoriteStateInitial();
}

@immutable
class FavoriteStateLoaded extends FavoriteState {
  final List<Event> favorites;

  FavoriteStateLoaded({@required this.favorites});

  @override
  List<Object> get props => [favorites];

  @override
  String toString() => 'FavoriteStateLoaded(favorites: $favorites)';
}

@immutable
class FavoriteStateError extends FavoriteState {
  final dynamic error;

  FavoriteStateError(this.error);

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FavoriteStateError(error: $error)';
}
