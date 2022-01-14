part of 'content_navigation_bloc.dart';

@immutable
abstract class ContentNavigationEvent {}

class ViewChangedTo extends ContentNavigationEvent {
  ViewChangedTo({required this.view});

  final ContentNavigation view;
}
