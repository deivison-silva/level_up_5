import 'package:level_up_5/src/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_item.g.dart';

class CartItem = _CartItemBase with _$CartItem;

abstract class _CartItemBase with Store {
  final ProductModel product;

  _CartItemBase(this.product);

  @observable
  int quantity = 1;

  @computed
  double get total => quantity * product.price;

  @action
  void increment() {
    if (quantity < 10) {
      quantity++;
    }
  }

  @action
  void decrement() {
    if (quantity > 1) {
      quantity--;
    }
  }

  @override
  int get hashCode => product.hashCode;

  @override
  bool operator ==(other) => other is CartItem && other.product == product;
}
