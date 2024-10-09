import 'package:flutter/material.dart';
import 'package:flutter_situation_management/checkbox_provider.dart';
import 'package:flutter_situation_management/view/forwarding_button.dart';
import 'package:flutter_situation_management/view_model/first_page_view_model.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  //Set state ve init state gibi Stateful widgeta ait şetleri kullanmadığımız için stateless yapabiliriz.
  @override
  Widget build(BuildContext context) {
    print("Sayfa baştan oluşturuldu.");
    return Consumer<FirstPageViewModel>(
      builder: (context, viewModel, child) {
        print("Scaffold consumer oluşturuldu.");
        return Scaffold(
          //Rengi butun ekrana vermek için kullanacağız.Çünkü renk değiştiğinde ekranda güncellensin bu sebeple consumer ile sarıyoruz.
          backgroundColor: viewModel.color,
          appBar: AppBar(
            title: const Text(
              'Birinci Sayfa',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: child,//Burada kullandığımız context, viewModel, child burada kullandığımız child parametresidir bu bize sadece consumer ile sardığımız yerlerin çalışmasını sağlar.Tüm sayfayı baştan çalıştırmaz.
        );
      },
      //builderın bitiminde child oluşturuyoruz.
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           FlutterLogo(
            size: 96,
          ),
          _buildTitle(),
          _buildChangeTextButton(context),
          _buildColorChangeTextButton(context),
          ForwardingButton(),
          _buildCheckBoxRow(),
        ],
      ),
    );
  }

  //  body: ChangeNotifierProvider(
  //       create: (BuildContext context) => FirstPageViewModel(),
  //       child: Column(//Bunu alıp ayrı bir sayfada yazıp burada tanımlamak context hatamı çözer ama kod karmaşasına sebep olur.
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children: [
  //           const FlutterLogo(
  //             size: 96,
  //           ),
  //           _buildTitle(context),//Buralarda kuyllandığımız kontextti columndan önce kullandığımız için hata verir.Çünkü bodyde tanımladık ama body sonra tanımladık change notifierı.
  //           _buildChangeTextButton(context),
  //           _buildCheckBoxRow(context),
  //         ],
  //       ),
  //     ), //Birinci sayfaya enjekte etme işlemidir. Bu fonksiyon geriye bir view model döndürür.

  Widget _buildTitle() {
    print("Başlık oluşturuldu.");
    return Consumer<FirstPageViewModel>(
      builder: (context, viewModel, child) {
        print("Başlık oluşturuldu.");
        //context, viewModel, child istediği parametrelerdir.
        //bu da <FirstPageViewModel> provider türünü belli eder.
        return Text(
          viewModel.writing,
          style: TextStyle(fontSize: 28),
        );
      },
    );
  }

  Widget _buildChangeTextButton(BuildContext context) {
    print("Yazıyı değiştir Butonu oluşturuldu.");
    FirstPageViewModel viewModel = Provider.of<FirstPageViewModel>(
      context,
      listen: false,
    ); //Burda üsteki ifadeyi kullanmam soruna yol açtı burada bu sorunu çözmek için provider of kullanmayacağız ama view modeli çağırabilmek için consumer kullanacağız.
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          viewModel.writing = "Butona Tıklandı";
        },
        child: const Text("Yazıyı Değiştir"),
      ),
    );
  }

  Widget _buildCheckBoxRow() {
    print("Checkbox Satırı oluşturuldu.");
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          ("Checkbox:"),
          style: TextStyle(fontSize: 18),
        ),
        Consumer<CheckboxProvider>(builder: (context, viewModel, child) {
          print("Checkbox Satırı oluşturuldu.");
          //Eğer burada checkbox tıkladığımız halde işaretlenmiyorsa viewmodel sınıfında set içerisinde notifierListenerı çağırmadık demektir.
          return Checkbox(
              value: viewModel.checkboxIsItSelected,
              onChanged: (bool? newValue) {
                if (newValue != null) {
                  viewModel.checkboxIsItSelected = newValue;
                }
              });
        }),
      ],
    );
  }

  Widget _buildColorChangeTextButton(BuildContext context) {
    print("Renk değiştir Butonu oluşturuldu.");
    FirstPageViewModel viewModel = Provider.of<FirstPageViewModel>(
      context,
      listen: false,
    ); //Burda üsteki ifadeyi kullanmam soruna yol açtı burada bu sorunu çözmek için provider of kullanmayacağız ama view modeli çağırabilmek için consumer kullanacağız.
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          viewModel.color = Colors.redAccent;
        },
        child: const Text("Rengi Değiştir"),
      ),
    );
  }
}
//Setstate çağrıldığında sayfa herzaman tekrar çizilir.Bu sebeple alternatif State management yapısı arıyoruz.
