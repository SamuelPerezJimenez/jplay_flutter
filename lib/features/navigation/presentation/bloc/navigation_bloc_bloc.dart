import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBloc extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBloc() : super(const PickUpPageNavigationState()) {
    on<NavigateToPickUpPageEvent>((event, emit) {
      emit(const PickUpPageNavigationState());
    });
    on<NavigateToSettingsPageEvent>((event, emit) {
      emit(const SettingsPagesNavigationState());
    });
  }
}
