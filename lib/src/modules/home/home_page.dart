import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../cart/exports_cart.dart';
import '../../shared/export_widgets.dart';
import '../cart/store/cart_controller.dart';
import './store/home_controller.dart';
import './home_empty.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final cartController = CartController();

  @override
  void initState() {
    homeController.getProducts();
    super.initState();
  }

  void addAndRemoveProduct(ProductModel product) {
    if (cartController.contains(product)) {
      cartController.removeProduct(CartItem(product));
    } else {
      cartController.addProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: [
          IconButton(
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 32.0,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    radius: 9.0,
                    child: Observer(
                      builder: (_) => Text(
                        cartController.itemsCount.toString(),
                        style: TextStyle(fontSize: 8.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => CartPage(cartController: cartController))),
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          if (homeController.appStatus == AppStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (homeController.appStatus == AppStatus.success) {
            return ListView.builder(
              itemCount: homeController.products.length,
              itemBuilder: (_, index) {
                final product = homeController.products[index];
                return Observer(
                  builder: (_) => Card(
                    child: ListTile(
                      leading: cartController.contains(product)
                          ? Container(
                              height: double.maxFinite,
                              child: Icon(
                                Icons.remove_shopping_cart_rounded,
                                size: 32.0,
                                color: AppColors.harleyDavidsonOrange,
                              ),
                            )
                          : Container(
                              height: double.maxFinite,
                              child: Icon(
                                Icons.add_shopping_cart_rounded,
                                size: 32.0,
                                color: AppColors.vivideTangerine,
                              ),
                            ),
                      title: Text(homeController.products[index].name),
                      subtitle:
                          Text(homeController.products[index].price.reais()),
                      onTap: () => addAndRemoveProduct(product),
                    ),
                  ),
                );
              },
            );
          } else if (homeController.appStatus == AppStatus.empty) {
            return EmptyState();
          } else if (homeController.appStatus == AppStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Houve um problema",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(color: Colors.red),
                  ),
                  Text(
                    homeController.errorMessage.isNotEmpty
                        ? homeController.errorMessage
                        : homeController.appStatus.message(),
                  )
                ],
              ),
            );
          }
          return EmptyState();
        },
      ),
    );
  }
}
