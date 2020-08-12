import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:FHIR_Demo/services/memberService.dart';
import 'package:FHIR_Demo/services/encountersService.dart';
import 'package:FHIR_Demo/services/claimsService.dart';
import 'package:FHIR_Demo/services/medicationService.dart';

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    // Making the API calls while the user fills the login credentials

    // setup member details
    setupMember();

    // setup encounters
    setupEncounters();

    // setup Claims
    setupClaims();

    // setup Medications
    setupMedications();

    final tween = MultiTrackTween([
      Track("opacity")
          .add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
            offset: Offset(0, animation["translateY"]), child: child),
      ),
    );
  }
}
