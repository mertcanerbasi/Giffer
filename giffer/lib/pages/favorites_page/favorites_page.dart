import 'package:flutter/material.dart';

import '../../services/save_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<String>? _favorisList;

  @override
  void initState() {
    _getUrls();
    super.initState();
  }

  void _getUrls() async {
    List<String>? _favoris = await SavetoDevice().getUrls();
    setState(() {
      _favorisList = _favoris;
    });
    print(_favoris);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 2, mainAxisExtent: 150, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemCount: _favorisList?.length,
            itemBuilder: (context, index) {
              return Container(
                  child: Center(
                child: _favorisList?[index] == null ? CircularProgressIndicator() : Image.network("${_favorisList?[index]}", fit: BoxFit.fitHeight),
              ));
            }));
  }
}
