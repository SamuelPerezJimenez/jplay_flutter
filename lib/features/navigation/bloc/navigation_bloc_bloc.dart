import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_bloc_event.dart';
part 'navigation_bloc_state.dart';

class NavigationBlocBloc
    extends Bloc<NavigationBlocEvent, NavigationBlocState> {
  NavigationBlocBloc() : super(NavigationBlocInitial()) {
    on<NavigationBlocEvent>((event, emit) {});
  }
}
