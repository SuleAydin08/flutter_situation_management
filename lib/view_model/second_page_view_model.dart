import 'package:flutter/material.dart';
import 'package:flutter_situation_management/model/order.dart';

class SecondPageViewModel with ChangeNotifier{
  //Öncesinde boş bir liste oluşturuyorum. 
  List<Order> orders = [];

  //Constracterı çağırıp içerisinde for döngüsü oluşturuyorum.
  SecondPageViewModel(){
    for(int i = 1; i <= 5; i++){
      Order order = Order("Sipariş $i", "Onay bekliyor...");
      orders.add(order);//Siparişi listeye ekleme
    }
  }
}