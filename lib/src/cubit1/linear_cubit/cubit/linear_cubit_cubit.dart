import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loginfirebase/src/cubit1/linear_cubit/cubit/linear_repo.dart';
import 'package:loginfirebase/src/models/news_model.dart';

part 'linear_cubit_state.dart';

class LinearCubitCubit extends Cubit<LinearCubitState> {
  LinearCubitCubit() : super(LinearCubitInitial()) {
    getdata();
  }
  final linearRepositary repository = linearRepositary();
  getdata() async {
    try {
      emit(LinearCubitLoding());
      final response = await repository.fetchNews();
      List<Articles>? data = response.articles;
      emit(LinearCubitLoaded(data!));
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
