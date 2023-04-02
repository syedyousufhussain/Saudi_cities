import 'package:flutter_bloc/flutter_bloc.dart';

import '../Repositories/city_repository.dart';
import 'city_event.dart';
import 'city_state.dart';


class CityBloc extends Bloc<CityEvent,CityState>{

  final UserRepository _userRepository;

  CityBloc(this._userRepository) : super(CityLoadingState()){
    on<CityLoadingEvent>((event,emit)async{
      emit(CityLoadingState());
      print("object");//for test purpose only
     
      try{
        final users= await _userRepository.getCityApi();
        // emit(CityLoadedState(users));
        emit(CityLoadedState(users));
        print("jello");//for test purpose only
      }
      catch(e){
        emit(CityErrorState(e.toString()));

      }
       
    });

  }
}