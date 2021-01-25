import 'package:FHIR_Demo/pages/allergiesPage.dart';
import 'package:bloc/bloc.dart';
import 'package:FHIR_Demo/pages/searchDoctorPage.dart';
import 'package:FHIR_Demo/pages/medicationsPage.dart';
import 'package:FHIR_Demo/pages/claimsPage.dart';
import 'package:FHIR_Demo/pages/vaccineRecordsPage.dart';
import 'package:FHIR_Demo/pages/scheduleAppointmentPage.dart';
import 'package:FHIR_Demo/pages/homePage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  MyAccountClickedEvent,
  MyMedicationsClickedEvent,
  MyClaimsClickedEvent,
  MyVaccineRecordsClickedEvent,
  MyAllergiesClickedEvent,
  MyScheduleAppointmentClickedEvent,
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
      case NavigationEvents.MyVaccineRecordsClickedEvent:
        yield VaccineRecordsPage();
        break;
      case NavigationEvents.MyAllergiesClickedEvent:
        yield AllergiesPage();
        break;
      case NavigationEvents.MyScheduleAppointmentClickedEvent:
        yield SchedulePage();
        break;
    }
  }
}
