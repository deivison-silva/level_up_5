import 'package:level_up_5/src/modules/cart/store/cart_item.dart';
import 'package:level_up_5/src/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'cart_controller.g.dart';

class CartController = _CartControllerBase with _$CartController;

abstract class _CartControllerBase with Store {
  @observable
  ObservableList<CartItem> list = <CartItem>[].asObservable();

  @computed
  int get itemsCount => list.length;

  @computed
  double get totalValue => list.fold(
      0.0,
      (double previousValue, element) =>
          previousValue + (element.product.price * element.quantity));

  @computed
  double get total =>
      list.fold(0, (previousValue, element) => previousValue * element.total);

  @action
  void addProduct(ProductModel product) {
    list.add(CartItem(product));
  }

  @action
  void removeProduct(CartItem product) {
    list.remove(product);
  }

  bool contains(ProductModel product) {
    if (list.contains(CartItem(product))) {
      return true;
    }
    return false;
  }
}
