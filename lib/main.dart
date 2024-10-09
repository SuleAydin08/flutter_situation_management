import 'package:flutter/material.dart';
import 'package:flutter_situation_management/checkbox_provider.dart';
import 'package:flutter_situation_management/view/first_page.dart';
import 'package:flutter_situation_management/view_model/first_page_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        //Birden fazla changenotifierprovider kullanmak için kullanılır.
        providers: [
         ChangeNotifierProvider(
            create: (BuildContext context) => FirstPageViewModel(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => CheckboxProvider(),
          ),
        ],
        child: FirstPage(),
      ),
      // ChangeNotifierProvider(//Burda erişim sağlamamız bize çok büyük bir kod temizliği ve kolaylık sağlar.
      // //  ChangeNotifierProvider kullanıdığımızda sadece bir data change provider enjekte edebiliyorum bu sebeple farklı bir yöntem kullanacağız.
      //   create: (BuildContext context) => FirstPageViewModel(),
      //   child: FirstPage(),
      // ), //Birinci sayfaya enjekte etme işlemidir. Bu fonksiyon geriye bir view model döndürür.
    );
  }
}
