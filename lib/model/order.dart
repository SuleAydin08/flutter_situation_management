import 'package:flutter/material.dart';

class Order with ChangeNotifier{
  String title;
  String situation;

  Order(this.situation, this.title);

   //Siparişi Onaylama Fonksiyonu
  void confirmOrder(){
    situation = "Onaylandı";//Durumları onaylandı yap.
    notifyListeners();//Bu değişliğin ekrana yansıması için kullanılır.
  }
}