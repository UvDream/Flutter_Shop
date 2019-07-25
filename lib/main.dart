import 'package:flutter/material.dart';
import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:fluro/fluro.dart';

// 注册路由
import './routers/routes.dart';
import './routers/application.dart';

// 详情页面
import './provide/details_info.dart';

// 购物车
import './provide/car.dart';
import './provide/current_index.dart';

void main() {
  var counter = Counter();
  var childCategory = ChildCategory();
  var providers = Providers();
  var categoryGoodsListProvide = CategoryGoodsListProvide();
  var detailInfoProvide = DetailsInfoProvide();
  var carProvide = CarProvide();
  var currentIndexProvide = CurrentIndexProvide();
  providers
    ..provide(Provider<Counter>.value(counter))
    ..provide(Provider<ChildCategory>.value(childCategory))
    // 分类
    ..provide(
        Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide))
    // 详情
    ..provide(Provider<DetailsInfoProvide>.value(detailInfoProvide))
    ..provide(Provider<CarProvide>.value(carProvide))
    ..provide(Provider<CurrentIndexProvide>.value(currentIndexProvide));

  runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 注册路由
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;

    return Container(
      child: MaterialApp(
        title: "百姓生活",
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.pink),
        home: IndexPage(),
      ),
    );
  }
}
