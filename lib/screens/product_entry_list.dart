import 'dart:math';

import 'package:flutter/material.dart';
import 'package:football_shop/models/product_entry.dart';
import 'package:football_shop/widgets/left_drawer.dart';
import 'package:football_shop/screens/product_detail.dart';
import 'package:football_shop/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  final bool filterByUser;
  const ProductEntryListPage({super.key, this.filterByUser = false});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState(initialFilter: filterByUser);
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  bool _showMyProduct = false; 

  _ProductEntryListPageState({required bool initialFilter})
      : _showMyProduct = initialFilter;

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000

    final response = await request.get('http://localhost:8000/json/');
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final dynamic sessionUserId = request.jsonData.containsKey('user_id')
        ? request.jsonData['user_id']
        : null;

    final int? productUserId = sessionUserId is int
        ? sessionUserId
        : sessionUserId != null
        ? int.tryParse(sessionUserId.toString())
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProduct(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              List<ProductEntry> products = List<ProductEntry>.from(
                snapshot.data!,
              );
              if (_showMyProduct && productUserId != null) {
                products = products
                    .where((p) => p.userId == productUserId)
                    .toList();
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            _showMyProduct
                                ? 'Showing my products only'
                                : 'Showing all products',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            setState(() {
                              _showMyProduct = !_showMyProduct;
                            });
                          },
                          icon: Icon(
                            _showMyProduct
                                ? Icons.filter_alt
                                : Icons.filter_alt_outlined,
                            color: _showMyProduct
                                ? Colors.deepOrange
                                : Colors.grey[700],
                          ),
                          label: Text(
                            _showMyProduct ? 'All Products' : 'My Products',
                            style: TextStyle(
                              color: _showMyProduct
                                  ? Colors.deepOrange
                                  : Colors.grey[800],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: products.isEmpty
                        ? Center(
                            child: Text(
                              _showMyProduct
                                  ? 'You do not have any products yet.'
                                  : 'No products available.',
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: products.length,
                            itemBuilder: (_, index) => ProductEntryCard(
                              product: products[index],
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetailPage(
                                      product: products[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }
}
