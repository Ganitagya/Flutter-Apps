import 'package:bloc/bloc.dart';
import 'package:FHIR_Demo/pages/searchDoctor.dart';
import 'package:FHIR_Demo/pages/allergies.dart';
import 'package:FHIR_Demo/pages/claims.dart';
import 'package:FHIR_Demo/pages/visits.dart';

import 'package:FHIR_Demo/pages/homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyAllergiesClickedEvent,
  MyClaimsClickedEvent,
  MyVisitsClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield searchDoctorPage();
        break;
      case NavigationEvents.MyAllergiesClickedEvent:
        yield AllergiesPage();
        break;
      case NavigationEvents.MyClaimsClickedEvent:
        yield ClaimsPage();
        break;
      case NavigationEvents.MyVisitsClickedEvent:
        yield VisitsPage();
        break;
    }
  }
}
