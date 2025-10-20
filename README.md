# Flutter Vibration Platform Channel 

## Project Overview

This project serves as a study environment and practical laboratory to explore advanced concepts in 
Flutter development. The topics covered include:

### Unit Tests and Integration Tests:

Unit tests will be created to validate the business logic 
in isolation, and integration tests will be created to ensure that the different system modules 
function correctly together.

Commands to run the tests (I used FVM - Flutter Version Management, so it was necessary to use the
`fvm` command before `flutter`):

fvm flutter test

fvm flutter test integration_test/app_test.dart

### State Management with BLoC and Cubit Implementation:

There is an interface called VibrationPresenter that defines the contract for vibration-related
operations. 

There are to implementations of this interface: VibrationCubitPresenter 
and VibrationBlocPresenter.

Using the interface we protect our page from changes in the implementation of the state management,
making it easier to switch between Cubit and BLoC or any other state manager.

### Clean Architecture:

Application of Clean Architecture principles to build decoupled, and easily 
maintainable code. The structure will be divided into presentation, domain, and service, 
ensuring that dependencies flow towards the center of the application.

### Native Android and iOS Code (MethodChannel):

Exploration of communication between Flutter and the native 
platforms (Android and iOS) through MethodChannel. This will allow access to specific APIs and 
resources of each operating system, such as device vibration control, which gives the project its name.