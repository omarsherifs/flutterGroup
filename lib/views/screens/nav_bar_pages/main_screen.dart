import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_group_1/controllers/product_cubit/products_cubit.dart';
import 'package:flutter_group_1/views/screens/product_details_screen.dart';
import 'package:flutter_group_1/views/widgets/item_card_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(),

      /// we can use [BlocBuilder] & [BlocListener] here
      child: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsError) {
            print(state.errorMessage);
          }
        },
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return ListView.builder(
            itemCount: context.watch<ProductsCubit>().productList.length,
            itemBuilder: (BuildContext context, int index) {
              var productItem = context.watch<ProductsCubit>().productList[index];
              return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                                product: productItem,
                              )),
                    );
                  },
                  child: ItemCard(
                    productName: productItem.title ?? "--",
                    price: "${productItem.price}",
                    thumbnail: productItem.thumbnail ?? "",
                  ));
            },
          );
        },
      ),
    );
  }
}
