import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../src/shared/export_widgets.dart';
import '../../shared/utils/extensions.dart';
import './store/cart_controller.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key, required this.cartController}) : super(key: key);
  final CartController cartController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Carrinho :)'),
      ),
      body: Observer(
        builder: (_) => cartController.list.isEmpty
            ? Center(
                child: Text("OPS! Seu carrinho está vazio :(",
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .apply(color: AppColors.harleyDavidsonOrange)))
            : ListView.separated(
                separatorBuilder: (_, index) => const SizedBox(height: 4.0),
                itemCount: cartController.list.length,
                itemBuilder: (_, index) {
                  final item = cartController.list[index];
                  return Observer(
                    builder: (_) => Card(
                      child: ListTile(
                        title: Text(item.product.name),
                        subtitle: Observer(
                            builder: (_) =>
                                Text('preço: ${item.total.reais()}')),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove),
                              onPressed: item.decrement,
                            ),
                            Text("${item.quantity}"),
                            IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: item.increment,
                            ),
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red[300]),
                              onPressed: () =>
                                  cartController.removeProduct(item),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Valor total: ', style: Theme.of(context).textTheme.headline6),
            Observer(
              builder: (_) => Text(
                cartController.totalValue.reais(),
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: AppColors.harleyDavidsonOrange),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
