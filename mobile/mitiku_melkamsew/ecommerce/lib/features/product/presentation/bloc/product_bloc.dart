import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;
  final GetProducts getProducts;
  final DeleteProduct deleteProduct;
  final UpdateProduct updateProduct;
  final InsertProduct insertProduct;

  ProductBloc({
    required this.getProduct,
    required this.getProducts,
    required this.deleteProduct,
    required this.updateProduct,
    required this.insertProduct,
  }) : super(InitialState()) {
    on<LoadAllProductsEvent>(_onLoadAllProductsEvent);
    on<GetSingleProductEvent>(_onGetSingleProductEvent);
    on<UpdateProductEvent>(_onUpdateProductEvent);
    on<DeleteProductEvent>(_onDeleteProductEvent);
    on<CreateProductEvent>(_onCreateProductEvent);
  }

  Future<void> _onLoadAllProductsEvent(
    LoadAllProductsEvent event,
    Emitter<ProductState> emit,
  ) async {

    emit(LoadingState());
    final products = await getProducts();
    products.fold(
      (failure) => emit(ErrorState(_mapFailureToMessage(failure))),
      (products) => emit(LoadedAllProductState(products)),
    );
  }

  void _onGetSingleProductEvent(
    GetSingleProductEvent event,
    Emitter<ProductState> emit,
  ) async {
   
    emit(LoadingState());
    final result = await getProduct(event.id);
    result.fold(
      (failure) => emit(ErrorState(_mapFailureToMessage(failure))),
      (product) => emit(LoadedProductState(product)),
    );
  }

  void _onUpdateProductEvent(
    UpdateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    
    emit(LoadingState());
    final result = await updateProduct(event.product);
    result.fold((failure) => emit(ErrorState(_mapFailureToMessage(failure))), (
      _,
    ) {
      emit(const SuccessState('Updated successfully'));
      add(LoadAllProductsEvent());
    });
  }

  void _onCreateProductEvent(
    CreateProductEvent event,
    Emitter<ProductState> emit,
  ) async {
   
    emit(LoadingState());
    final result = await insertProduct(event.product);
    result.fold((failure) => emit(ErrorState(_mapFailureToMessage(failure))), (
      _,
    ) {
      emit(const SuccessState('Created successfully'));
      add(LoadAllProductsEvent());
    });
  }

  void _onDeleteProductEvent(
    DeleteProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    
    emit(LoadingState());
    final result = await deleteProduct(event.id);
    result.fold((failure) => emit(ErrorState(_mapFailureToMessage(failure))), (
      _,
    ) {
      emit(const SuccessState('Deleted successfully'));
      add(LoadAllProductsEvent());
    });
  }

  String _mapFailureToMessage(Failure failure) {
    late final String message;
    switch (failure) {
      case ServerFailure():
        message = 'Server Failure';
      case CacheFailure():
        message = 'Cache Failure';
        break;
      default:
        message = 'Unexpected error';
    }
    return message;
  }
}
