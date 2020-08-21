import 'package:bloc/bloc.dart';
import 'package:FHIR_Demo/pages/searchDoctorPage.dart';
import 'package:FHIR_Demo/pages/medicationsPage.dart';
import 'package:FHIR_Demo/pages/claimsPage.dart';
import 'package:FHIR_Demo/pages/encountersPage.dart';

import 'package:FHIR_Demo/pages/homePage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyMedicationsClickedEvent,
  MyClaimsClickedEvent,
  MyEncountersClickedEvent,
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
        yield SearchDoctorPage();
        break;
      case NavigationEvents.MyMedicationsClickedEvent:
        yield MedicationsPage();
        break;
      case NavigationEvents.MyClaimsClickedEvent:
        yield ClaimsPage();
        break;
      case NavigationEvents.MyEncountersClickedEvent:
        yield EncountersPage();
        break;
    }
  }
}
