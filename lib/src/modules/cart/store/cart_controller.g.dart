// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartController on _CartControllerBase, Store {
  Computed<int>? _$itemsCountComputed;

  @override
  int get itemsCount =>
      (_$itemsCountComputed ??= Computed<int>(() => super.itemsCount,
              name: '_CartControllerBase.itemsCount'))
          .value;
  Computed<double>? _$totalValueComputed;

  @override
  double get totalValue =>
      (_$totalValueComputed ??= Computed<double>(() => super.totalValue,
              name: '_CartControllerBase.totalValue'))
          .value;
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??= Computed<double>(() => super.total,
          name: '_CartControllerBase.total'))
      .value;

  final _$listAtom = Atom(name: '_CartControllerBase.list');

  @override
  ObservableList<CartItem> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<CartItem> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$_CartControllerBaseActionController =
      ActionController(name: '_CartControllerBase');

  @override
  void addProduct(ProductModel product) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(CartItem product) {
    final _$actionInfo = _$_CartControllerBaseActionController.startAction(
        name: '_CartControllerBase.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list},
itemsCount: ${itemsCount},
totalValue: ${totalValue},
total: ${total}
    ''';
  }
}
