import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/product.dart';
import '../bloc/product_bloc.dart';
import 'card.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView.fromBloc({super.key})
    : products = const [];

  @override
  Widget build(BuildContext context) {
      return BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return Center(child: Text(state.message));
          }
          if (state is LoadedAllProductState) {
            final items = state.products;
            if (items.isEmpty) {
              return const Center(child: Text('No products found.'));
            }
            return _buildList(context, items);
          }
          return const SizedBox.shrink();
        },
      );

  }

  Widget _buildList(BuildContext context, List<Product> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final product = items[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/details', arguments: product);
          },
          child: ProductCard(product: product),
        );
      },
    );
  }
}
