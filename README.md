Flutter:
  Provider as state management:

I. Requirement:
 1) Adding provider package into "pubspec.yaml" as dependency; run "flutter pub get" to install the package
 2) imports for the packages:
    - import 'package:flutter/foundation.dart';
    - import 'package:flutter/material.dart';
    - import 'package:provider/provider.dart';
 
I. Components:
 1) ChangeNotifier  ---------------- state model
 2) ChangeNotifierProvider --------- container of state model via context
 3) Consumer ----------------------- consumer widget of state model (it is a widget)
 4) Provider.of -------------------- ligth weight consumer of state model (not a widget)
 
II. How it works
 1) Define a state model that extends ChangeNotifier
 2) Instantiate the model through "ChangeNotifierProvider" or "MultiProvider" widgets
    this to save state model in the context
 3) For display:
    At anywhere under that Provider widget tree, just use Consumer widget to wrap around the UI widget
 4) For interaction:
    At any event triffering functions, just use Provider.of to access state model functions

III. Use case 1: Login
     - Authentication is the process of verifying oneself;
     - Authorization is the process of verifying what you have access to;

     Authentication states: { NONE, LOG_IN, FAILED, LOG_OUT }
     Authorization states: { ADMIN, BOSS, WORKER_B }
     
 1) Define UserProfileChangeNotifier:
    - properties: { firstName, lastName, email, authenticationStateEnum, authorizationStateEnum }
    - methods: {login, logout, register, update}
    
 2) Instantiate UserProfileChangeNotifier at root:
    '''
    runApp(ChangeNotifierProvider(
              create: (context) => UserProfileChangeNotifier(),
              child: MaterialApp(
                home: MainPage(),
              )
          ));
    '''
 3) Use Consumer in MainPage class default build function
    '''
    @override
    Widget build(BuildContext context) {
      return Consumer<UserProfileChangeNotifier>(
        builder: (context, user, child) {
	  switch (user.authorizationStateEnum) {
	    case NONE: --------------> return Login widget
	    case LOG_IN: ------------> return Home widget
	    case FAILED: ------------> return Login Widget
	    case LOG_OUT: -----------> return Login Widget
          }
	}
      );
    }
    '''
    Use Consumer in Login class
     - login button -> onPress -> Provider.of<UserProfileChangeNotifier>>(context).login();
     

    Use Consumer in Home class
     - to show user's first name, last name and avata pix, etc
     - to show logout button -> onPress -> Provider.of<UserProfileChangeNotifier>(context).logout();
     - to show corresponding content based on user's authorizationStateEnum

