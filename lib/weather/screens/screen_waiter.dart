import 'package:flutter/material.dart';
import 'package:test_pro_area/weather/settings/setting.dart';

class ScreenWaiter extends StatelessWidget {
  const ScreenWaiter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          height: 150,
          decoration: BoxDecoration(
            color: gCyanTheme.accentColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Мы загружаем данные о погоде',
                style: TextStyle(
                    color: gCyanTheme.cardColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    shadows: List.generate(
                      3,
                      (index) => Shadow(color: Color(0xFF000000), blurRadius: 6.0, offset: Offset(5, 2)),
                    )),
              ),
              SizedBox(
                height: 50,
                width: 100,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(gCyanTheme.cardColor),
                  strokeWidth: 5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
