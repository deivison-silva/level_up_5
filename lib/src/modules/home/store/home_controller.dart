import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../../../../src/shared/export_widgets.dart';
part './home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  String errorMessage = '';

  @observable
  AppStatus appStatus = AppStatus.empty;

  @observable
  List<ProductModel> products = <ProductModel>[];

  @action
  Future<void> getProducts() async {
    try {
      appStatus = AppStatus.loading;
      products = await Future.delayed(Duration(seconds: 3)).then(
        (value) => List.generate(
          25,
          (index) => ProductModel(
            id: '$index',
            name: "Produto $index ",
            price: 3.5 * index,
          ),
        ),
      );

      appStatus = products.isNotEmpty ? AppStatus.success : AppStatus.empty;
    } on PlatformException catch (e) {
      errorMessage = e.message.toString();
      appStatus = AppStatus.error;
    } catch (e) {
      errorMessage = e.toString();
      appStatus = AppStatus.error;
      appStatus.message();
    }
  }
}
