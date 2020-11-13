import 'package:bloc/bloc.dart';
import 'package:Unwind/pages/home/About.dart';
import 'package:Unwind/pages/home/home_page.dart';
import 'package:Unwind/pages/home/journal.dart';
import 'package:Unwind/pages/home/learn.dart';
import 'package:Unwind/pages/home/quiz.dart';
import 'package:Unwind/pages/home/chart.dart';
import 'package:Unwind/pages/home/doctor.dart';

enum NavigationEvents {
  HomeClickedEvent,
  JournalClickedEvent,
  LearnClickedEvent,
  QuizClickedEvent,
  ChartClickedEvent,
  DoctorListClickedEvent,
  AboutClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomeClickedEvent:
        yield Home();
        break;
      case NavigationEvents.JournalClickedEvent:
        yield Journal();
        break;
      case NavigationEvents.LearnClickedEvent:
        yield Learn();
        break;
      case NavigationEvents.QuizClickedEvent:
        yield Quiz();
        break;
      case NavigationEvents.ChartClickedEvent:
        yield Chart();
        break;
      case NavigationEvents.DoctorListClickedEvent:
        yield Doctor();
        break;
      case NavigationEvents.AboutClickedEvent:
        yield About();
        break;
    }
  }
}
