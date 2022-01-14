import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'content_navigation_event.dart';

enum ContentNavigation {
  home,
  comingSoon,
  downloads
}

class ContentNavigationBloc extends Bloc<ContentNavigationEvent, ContentNavigation> {
  ContentNavigation viewIs = ContentNavigation.home;

  ContentNavigationBloc() : super(ContentNavigation.home) {
    on<ViewChangedTo>(_onViewChangedTo);
  }

  void _onViewChangedTo(
    ViewChangedTo event,
    Emitter emit
  ) {
    viewIs = event.view;
    emit(event.view);
  }
}
