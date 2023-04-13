import 'package:catalog/components/product_item.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

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
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageurl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageurl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageurl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];
  return GridView.builder(
    padding: const EdgeInsets.all(10.0),
    itemCount: loadedProducts.length,
    itemBuilder: (ctx, i) => ProductItem(
        id: loadedProducts[i].id,
        title: loadedProducts[i].title,
        imageurl: loadedProducts[i].imageurl),
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
