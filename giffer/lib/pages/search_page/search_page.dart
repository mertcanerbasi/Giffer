import 'package:flutter/material.dart';
import 'package:giffer/models/gif_model.dart';
import 'package:giffer/services/get_gifs_service.dart';
import 'package:giffer/services/save_service.dart';
import 'package:giffer/utils/colors.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  String? query;
  List<Map<String, Media>?>? _urlList;
  List<String>? _favorisList;

  @override
  void initState() {
    super.initState();
    _getGif("Welcome");
    _getUrls();
  }

  void _getGif(String? query) async {
    List<Map<String, Media>?>? response = await GifService().getHttp(query: "$query");
    setState(() {
      _urlList = response;
    });
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors().color4,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextFormField(
                    controller: _searchController,
                    cursorColor: AppColors().color1,
                    decoration: InputDecoration(
                      focusColor: AppColors().color1,
                      hoverColor: AppColors().color1,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIconColor: AppColors().color1,
                      hintText: "Search Gifs",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.search, color: AppColors().color1),
                        onPressed: () async {
                          setState(() {
                            query = _searchController.text;
                          });
                          _getGif("$query");
                          print(_urlList?[0]?["gif"]?.url);
                          setState(() {
                            _urlList = _urlList;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
              height: 500,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200, childAspectRatio: 2, mainAxisExtent: 150, crossAxisSpacing: 20, mainAxisSpacing: 20),
                  itemCount: _urlList?.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onDoubleTap: () async {
                        await SavetoDevice().saveUrls("${_urlList?[index]?["gif"]?.url}");
                        _getUrls();
                      },
                      child: Container(
                          child: Center(
                              child: _urlList?[index]?["gif"]?.url == null
                                  ? CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(AppColors().color1),
                                    )
                                  : Center(
                                      child: Image.network("${_urlList?[index]?["gif"]?.url}", fit: BoxFit.fitHeight),
                                    ))),
                    );
                  }))
        ],
      ),
    );
  }
}
