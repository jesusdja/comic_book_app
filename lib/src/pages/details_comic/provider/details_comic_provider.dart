import 'package:comic_book_app/src/global/config/value_validators.dart';
import 'package:comic_book_app/src/global/widgets_utils/toast_widget.dart';
import 'package:comic_book_app/src/pages/details_comic/models/detail_comic_model.dart';
import 'package:comic_book_app/src/pages/details_comic/services/details_http_connection.dart';
import 'package:flutter/material.dart';

class DetailComicProvider extends ChangeNotifier {

  DetailComicProvider(this.urlDetails){ initialData(); }

  bool loadData = true;
  String urlDetails = '';

  bool _seePass = true;
  bool get seePass => _seePass;
  set seePass(bool value){ _seePass = value; notifyListeners(); }

  DetailComicModel? detailComicModel;

  Future initialData() async{
    await getComic();

    loadData = false;
    notifyListeners();
  }

  Future getComic() async{
    try{
      final resp = await DetailsHttpConnection().getComicsDetails(urlDetail: urlDetails);
      if(resp!.statusCode == 200){
        detailComicModel = DetailComicModel.fromMap(resp.data['results']);
      }
    }catch(e){
      debugPrint(e.toString());
    }
    notifyListeners();
  }
}