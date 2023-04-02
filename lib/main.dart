import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Repositories/city_repository.dart';
import 'bloc/city_bloc.dart';
import 'bloc/city_event.dart';
import 'bloc/city_state.dart';
import 'models/city_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RepositoryProvider(
          create: (context) => UserRepository(),
          child: const SaudiCities(),
        ));
  }
}

class SaudiCities extends StatelessWidget {
  const SaudiCities({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CityBloc(
              RepositoryProvider.of<UserRepository>(context),
            )..add(CityLoadingEvent()), //cascading our event loading class
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text("Saudi_cites"),
            ),
            
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BlocBuilder<CityBloc, CityState>(
                  builder: (context, state) {
                    if (state is CityLoadingState) {
                      print("hello");//for test
                      // SizedBox(height: 30,);
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is CityLoadedState) {
                      print("yellow");//for test purpose only
                      // List<CityModel>cityList=state.users;
                      CiitiesResponse? ciitiesResponse = state.ciitiesResponse;
                      return Center(
                         child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: ciitiesResponse!.data!.length,
                            itemBuilder: (_, index) {
                              var data;
                              return Card(
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                        Text(
                                          ciitiesResponse.data![index].name!,
                                          style: const TextStyle(
                                              color: Colors.white,),textAlign: TextAlign.center,
                                        )
                                      ]),
                                ),
                              );
                            }),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            )));
  }
}