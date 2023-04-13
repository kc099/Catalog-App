import 'package:catalog/components/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

getDrawerWidget(int index, BuildContext context, Function updateState) {
  switch (index) {
    case 0:
      return _homeListView(context, updateState);
    // break;
    case 1:
      return _profileView(context);
    // break;
    case 2:
      return _profileView(context);
    // break;
  }
}

Widget _homeListView(BuildContext context, Function updateState) {
  final productsData = Provider.of<Products>(context);
  final products = productsData.items;
  return GridView.builder(
    padding: const EdgeInsets.all(10.0),
    itemCount: products.length,
    itemBuilder: (ctx, i) => ProductItem(
        id: products[i].id,
        title: products[i].title,
        imageurl: products[i].imageurl),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0),
  );
}

Widget _profileView(BuildContext context) {
  return Column(
    children: [
      const SizedBox(
        height: 20.0,
      ),
      Expanded(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  print('profile tapped');
                },
                child: Container(
                  width: 48,
                  height: 48,
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  alignment: Alignment.center,
                  child: const CircleAvatar(
                    radius: 80.0,
                  ),
                ),
              ),
              title: const Text('Hi, User'),
              trailing: GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      // title: const Text('AlertDialog Title'),
                      content: const Text('Are you sure you want to logout?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Logout'),
                          child: const Text(
                            'Logout',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Icon(
                  Icons.power_settings_new_sharp,
                  color: Colors.red,
                  size: 36,
                ),
              ),
              dense: false,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Card(
              child: ListTile(
                title: Text('Change Login Password'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('FAQ & Feedback'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('About'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Privacy Settings'),
              ),
            ),
            const Card(
              child: ListTile(
                title: Text('Privacy Policy Management'),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
