import 'package:comic_book_app/src/global/config/value_validators.dart';
import 'package:comic_book_app/src/global/widgets_utils/toast_widget.dart';
import 'package:comic_book_app/src/pages/home/models/comic_model.dart';
import 'package:comic_book_app/src/pages/home/services/home_http_connection.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {

  HomeProvider(){ initialData(); }

  bool loadData = true;

  bool _seePass = true;
  bool get seePass => _seePass;
  set seePass(bool value){ _seePass = value; notifyListeners(); }

  bool _isGridList = true;
  bool get isGridList => _isGridList;
  set isGridList(bool value){ _isGridList = value; notifyListeners(); }

  List<ComicModel> comics = [];


  Future initialData() async{
    await getComic();

    loadData = false;
    notifyListeners();
  }

  Future getComic() async{
    try{
      final resp = await HomeHttpConnection().getComics();
      if(resp!.statusCode == 200){
        comics = [];
        List results = resp.data['results']!;
        for (var element in results) {
          comics.add(ComicModel.fromMap(element));
        }
      }
    }catch(e){
      debugPrint(e.toString());
    }
  }

}
