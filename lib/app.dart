import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:layout_drawer/utils/layout_router.dart';
import 'package:layout_drawer/widgets/widgets.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutDrawerBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.deepPurple,
          drawerTheme: const DrawerThemeData(
            backgroundColor: Color.fromARGB(255, 28, 27, 27),
          ),
          bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0.4),
          ),
        ),
        onGenerateRoute: LayoutRouter.router,
        initialRoute: 'landing',
      ),
    );
  }
}
