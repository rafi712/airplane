import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  void setPage(int newPage) => emit(newPage);

  @override
  Future<void> close() {
    return super.close();
  }
}
