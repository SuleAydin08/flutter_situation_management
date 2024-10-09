import 'package:flutter/material.dart';
import 'package:flutter_situation_management/view_model/first_page_view_model.dart';
import 'package:provider/provider.dart';

class ForwardingButton extends StatelessWidget {
  ForwardingButton({super.key});

  @override
  Widget build(BuildContext context) {
    FirstPageViewModel viewModel = Provider.of<FirstPageViewModel>(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("İkinci Sayfayı Aç"),
      onPressed: () {
        viewModel.secondPageOpen(context);//Bu fonksiyon private olmamalı yoksa hata verir.
      },
    );
  }
}
