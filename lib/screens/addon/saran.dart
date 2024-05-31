import 'package:flutter/material.dart';
import 'package:proyek/controllers/colorpalette.dart';

class PesanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ColorPallete.accentColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Pesan Kesan',
          style: TextStyle(color: ColorPallete.whiteColor),
        ),
        backgroundColor: ColorPallete.baseColor,
        iconTheme: IconThemeData(
          color: ColorPallete.accentColor,
        ),
      ),
      body: Center(
        child: Container(
          width: 300,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: ColorPallete.whiteColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
              ),
            ],
          ),
          child: Text(
            'kesan saya selama belajar pemrograman mobile ini adalah mata kuliah ini sangat'
                'menyenangkan karena dapat melakukan desain yang menurut saya lebih seru daripada pemrograman web'
                'walaupun bahasanya sedikit lebih sulit dari pemrograman web dan lebih berat daripada web',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ColorPallete.accentColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      backgroundColor: ColorPallete.baseColor,
    );
  }
}
