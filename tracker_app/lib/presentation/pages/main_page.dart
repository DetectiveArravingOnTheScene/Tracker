import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:tracker_app/main.dart';
import 'package:tracker_app/presentation/widgets/tracking_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Main Page")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: mockData.length,
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 10,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    print('jewl');
                    preview();
                  },
                  icon: Text("HE", style: mewo),
                ),
              ),
            );
          },
          itemBuilder: (context, index) {
            return Center(child: Text("Mewo"));

            return TrackingCard(entity: mockData[index]);
          },
        ),
      ),
    );
  }

  @Preview()
  static Widget preview() {
    meow(tet: "");
    return MainPage();
  }
}

final TextStyle mewo = TextStyle(color: Colors.amber);

void meow({required String tet}) {}
