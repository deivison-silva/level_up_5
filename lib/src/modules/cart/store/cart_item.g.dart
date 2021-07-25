// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartItem on _CartItemBase, Store {
  Computed<double>? _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CartItemBase.total'))
      .value;

  final _$quantityAtom = Atom(name: '_CartItemBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$_CartItemBaseActionController =
      ActionController(name: '_CartItemBase');

  @override
  void increment() {
    final _$actionInfo = _$_CartItemBaseActionController.startAction(
        name: '_CartItemBase.increment');
    try {
      return super.increment();
    } finally {
      _$_CartItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_CartItemBaseActionController.startAction(
        name: '_CartItemBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_CartItemBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity},
total: ${total}
    ''';
  }
}
