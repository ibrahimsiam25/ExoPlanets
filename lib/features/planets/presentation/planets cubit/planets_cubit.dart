import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsInitial());
  int currentIndex = 0;

  void changePage(int index) {
    currentIndex = index;
    emit(PlanetsChange());
  }
}
