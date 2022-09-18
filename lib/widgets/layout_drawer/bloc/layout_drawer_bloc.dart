// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';
import 'package:layout_drawer/widgets/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'layout_drawer_event.dart';
part 'layout_drawer_state.dart';

class LayoutDrawerBloc extends Bloc<LayoutDrawerEvent, LayoutDrawerState> {
  LayoutDrawerBloc() : super(const LayoutDrawerExpanded(SelectedView.home)) {
    on<LayoutDrawerChanged>(_changedView);
    on<LayoutDrawerToggled>(_toggleDashboard);
  }

  void _changedView(
    LayoutDrawerChanged event,
    Emitter<LayoutDrawerState> emit,
  ) {
    if (state is LayoutDrawerExpanded) {
      emit(LayoutDrawerExpanded(event.view));
    } else if (state is LayoutDrawerRetracted) {
      emit(LayoutDrawerRetracted(event.view));
    }
  }

  void _toggleDashboard(
    LayoutDrawerToggled event,
    Emitter<LayoutDrawerState> emit,
  ) {
    try {
      if (state is LayoutDrawerExpanded) {
        emit(LayoutDrawerRetracted(state.view));
      } else if (state is LayoutDrawerRetracted) {
        emit(LayoutDrawerExpanded(state.view));
      }
    } catch (e) {
      emit(const LayoutDrawerError());
    }
  }
}
