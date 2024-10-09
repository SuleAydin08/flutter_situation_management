import 'package:flutter/material.dart';
import 'package:flutter_situation_management/model/order.dart';
import 'package:flutter_situation_management/view_model/second_page_view_model.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "İkinci Sayfa",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Consumer<SecondPageViewModel>(builder: (context, viewModel, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          //Liste elemanlarının tasarım kısmı
          return ChangeNotifierProvider.value(//Fonksiyona değer enjekte etme
          //ChangeNotifierProvider.value hata verirse modelde with ChangeNotifier ekle.
            value: viewModel.orders[index],
            child: _buildListItem(),
          ); 
        },
        itemCount: viewModel.orders.length,
      );
    });
  }

  Widget _buildListItem() {
    return Consumer<Order>(builder: (context, order, child){//Doğrudan sipariş modelini dinliyoruz çünkü artık changeNotifier order modelin içinde.
      print("ListTile ${order.title} - Consumer oluşturuldu.");
      return ListTile(
      title: Text(order.title),
      subtitle: Text(order.situation),
      onTap: () {
        //Tıklandığında siparişi onayla fonksiyonunun oluşturulması gerekiyor bunun için view modela ulaşmamız lazım.
        order.confirmOrder();
      },
    );
    });
  }
}
