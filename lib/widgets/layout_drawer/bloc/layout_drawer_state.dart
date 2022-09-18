part of 'layout_drawer_bloc.dart';

@immutable
abstract class LayoutDrawerState extends Equatable {
  const LayoutDrawerState(this.view);

  final SelectedView view;
}

class LayoutDrawerExpanded extends LayoutDrawerState {
  const LayoutDrawerExpanded(SelectedView view) : super(view);

  @override
  List<Object?> get props => [view];
}

class LayoutDrawerRetracted extends LayoutDrawerState {
  const LayoutDrawerRetracted(SelectedView view) : super(view);

  @override
  List<Object?> get props => [view];
}

class LayoutDrawerError extends LayoutDrawerState {
  const LayoutDrawerError() : super(SelectedView.error);

  @override
  List<Object> get props => [];
}
