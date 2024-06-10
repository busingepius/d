
import 'package:d/api/splash.dart';
import 'package:d/bloc/data/event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataBloc extends Bloc<DataEvent, Map> {
  DataBloc() : super({}) {
    on((event, emit) async {
      if (event is SplashEvent) {
        try {
          var productsAndBanners = await getProductsAndBanner();
          emit(productsAndBanners);
        } on Exception catch (e) {
          emit({"message":"Something went wrong"});
        }
      }
    });
  }
}
