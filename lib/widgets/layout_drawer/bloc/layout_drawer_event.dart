part of 'layout_drawer_bloc.dart';

@immutable
abstract class LayoutDrawerEvent extends Equatable {}

class LayoutDrawerChanged extends LayoutDrawerEvent {
  LayoutDrawerChanged(this.view);

  final SelectedView view;

  @override
  List<Object?> get props => [view];
}

class LayoutDrawerToggled extends LayoutDrawerEvent {
  LayoutDrawerToggled();

  @override
  List<Object?> get props => [];
}
