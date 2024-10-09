import 'package:flutter/material.dart';
import 'package:flutter_situation_management/view/second_page.dart';
import 'package:flutter_situation_management/view_model/second_page_view_model.dart';
import 'package:provider/provider.dart';

class FirstPageViewModel with ChangeNotifier {
  //with anahtar kelimesi bu sınıfı mixin olarak kullanmamızı sağlar yani buda bu sınıftaki sabitleri fonksiyonları ve değişkenleri başka bir sınıfta kullanmamızı sağlamasıdır.
  String _writing = 'Merhaba';

  //Değişkenlere getter ve setter atamak yerine değişkeni public yapabiliriz bunuda _ kaldırarak yaparız.
  //Ne zaman kullanmak doğru olur sadece setter kullanacaksak yada sadece getter kullanacaksak mantıklı olur.Yada bu değişkenlerin gövdesinde herhangi bir işlem yapacaksak mantıklı olur.

  //Getter ve setter oluşturma yazı ve checkbox için;

  //Yazı get
  String get writing => _writing;

  //Yazı set
  set writing(String value) {
    _writing = value;
    notifyListeners(); //Bir değişiklik yapıldığında bu sınıftaki değişiklikleri dinleyen sayfaları uyaracak.Birinci sayfa bu değişikliği dinler mesela
    //NotifyListeners fonksiyonu çalıştığında bunu dinleyen sayfalarda değişiklik olacaktır.Notify kullanmadığımızda dinlediğimiz yerlerde güncelleme olucak set state benziyor yanı.
    //NotifyListeners changenotifier sınıfında yer alıyor bu sebeple view modele bu sınıfı ekliyoruz.Sınıfı ekleyince hata kalkacaktır.
  }

  //Butona tıklandığında renk değiştirmesi için;

  Color _color = Colors.white; //Başlangıçta beyaz olsun

  Color get color => _color;

  set color(Color value) {
    _color = value;
    notifyListeners(); //Renk değiştiğinde ekran güncellensin diye.
  }

  //İkinci Sayfaya Geçiş;

  void secondPageOpen (BuildContext context) {
    //Ekranlar arası geçiş kodumu yazdığım için context alır.
    MaterialPageRoute pageRoute = MaterialPageRoute(builder: (context) {
      //Change notifier provider hatası veriyorsa 
      return ChangeNotifierProvider(
        create: (context) => SecondPageViewModel(),
        child: SecondPage(),
      );
    });
    Navigator.push(context, pageRoute);
  }

  // //Değişkenlere getter ve setter atamak yerine değişkeni public yapabiliriz bunuda _ kaldırarak yaparız.
  ////Ne zaman kullanmak doğru olur sadece setter kullanacaksak yada sadece getter kullanacaksak mantıklı olur.Yada bu değişkenlerin gövdesinde herhangi bir işlem yapacaksak mantıklı olur.
  // String writing = 'Merhaba';

  // //CheckBox Seçili Mi?
  // bool checkboxIsItSelected = false;

  // //Getter ve setter oluşturma yazı ve checkbox için;

  // //Yazı get
  // String get writing => _writing;

  // //Yazı set
  // set writing(String value){
  //   _writing = value;
  // }

  // //Checkbox get
  // bool get checkboxIsItSelected => _checkboxIsItSelected;

  // //Checkbox set
  // set checkboxIsItSelected(bool value){
  //   _checkboxIsItSelected = value;
  // }
}
