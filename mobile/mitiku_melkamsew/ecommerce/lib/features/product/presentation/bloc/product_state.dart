part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedAllProductState extends ProductState {
  final List<Product> products;

  const LoadedAllProductState(this.products);

  @override
  List<Object> get props => [products];
}

class LoadedProductState extends ProductState {
  final Product product;

  const LoadedProductState(this.product);

  @override
  List<Object> get props => [product];

}
class SuccessState extends ProductState{
  final String message;

  const SuccessState(this.message);

    @override
  List<Object> get props => [];
}
class ErrorState extends ProductState {
  final String message;

  const ErrorState(this.message);

  @override
  List<Object> get props => [message];
}
