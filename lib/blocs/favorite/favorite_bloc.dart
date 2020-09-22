import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:confs_tech/blocs/favorite/favorite_state.dart';
import 'package:confs_tech/core/extensions/list.dart';
import 'package:confs_tech/models/models.dart';

class FavoriteCubit extends HydratedCubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteState.initial());

  void getFavorites() {
    try {
      emit(FavoriteState.loaded(favorites: []));
    } catch (e) {
      emit(FavoriteState.error(e));
    }
  }

  void addFavorite(Event event) {
    if (state is FavoriteStateLoaded) {
      var favorites = (state as FavoriteStateLoaded).favorites;
      emit(FavoriteState.loaded(favorites: favorites.concat(event)));
    }
  }

  void removeFavorite(int id) {
    if (state is FavoriteStateLoaded) {
      var favorites = (state as FavoriteStateLoaded).favorites;

      emit(FavoriteState.loaded(
          favorites: favorites.skipWhile((row) => row.id == id)));
    }
  }

  @override
  FavoriteState fromJson(Map<String, dynamic> json) {
    List<dynamic> favoritesJson = json['favorites'] ?? [];
    if (favoritesJson.isNotEmpty) {
      return FavoriteState.loaded(
          favorites: favoritesJson.map((e) => Event.fromJson(e)));
    }

    return state;
  }

  @override
  Map<String, dynamic> toJson(FavoriteState state) {
    if (state is FavoriteStateLoaded) {
      var favorites = (state).favorites;
      return {'favorites': favorites};
    }

    return {'favorites': []};
  }
}
