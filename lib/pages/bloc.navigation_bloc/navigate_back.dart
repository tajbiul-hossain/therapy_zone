import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Unwind/pages/bloc.navigation_bloc/navigation_bloc.dart';

class Back {
  void moveToHomeScreen(BuildContext context) =>
      BlocProvider.of<NavigationBloc>(context)
          .add(NavigationEvents.HomeClickedEvent);
}
