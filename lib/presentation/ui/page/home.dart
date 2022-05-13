import 'package:family_fridge_manager/presentation/ui/widget/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: NavigationDrawerWidget(),
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Family Fridge Manager'),
        actions: [
          Builder(builder: (context) {
            return TextButton.icon(
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              icon: Icon(Icons.settings),
              label: Text(''),
            );
          }),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add stuff',
          onPressed: () {}
      ),
    );
  }
}
