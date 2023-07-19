import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_style.dart';
import 'package:comic_book_app/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:comic_book_app/src/pages/home/models/comic_model.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class ListComicsPage extends StatefulWidget {
  const ListComicsPage({Key? key, required this.comicModel}) : super(key: key);
  final ComicModel comicModel;

  @override
  State<ListComicsPage> createState() => _ListComicsPageState();
}

class _ListComicsPageState extends State<ListComicsPage> {

  late ComicModel comicModel;

  @override
  Widget build(BuildContext context) {

    comicModel = widget.comicModel;

    String dateSt = '';
    DateTime date = DateTime.parse(comicModel.dateAdded!);
    dateSt = '${DateFormat.MMMMd().format(date)}, ${date.year}';


    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: sizeW * 0.3,
            height: sizeH * 0.25,
            margin: EdgeInsets.only(left: sizeW * 0.01,right: sizeW * 0.01,bottom: sizeH * 0.005),
            child: CachedNetworkImage(
              imageUrl: comicModel.image!,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) => circularProgressColors(),
              errorWidget: (context, url, error){
                debugPrint('error : $error');
                return const Icon(Icons.error);
              },
            ),
          ),
          SizedBox(
            width: sizeW * 0.3,
            child: Text('${comicModel.name ?? ''} ${comicModel.issueNumber}',textAlign: TextAlign.center,
                style: ComicStyles().stylePrimary(size: sizeH * 0.018)),
          ),
          SizedBox(height: sizeH * 0.005),
          SizedBox(
            width: sizeW * 0.3,
            child: Text(dateSt,textAlign: TextAlign.center,
                style: ComicStyles().stylePrimary(size: sizeH * 0.015,color: Colors.grey[500]!)),
          ),
          SizedBox(height: sizeH * 0.01),
        ],
      ),
    );
  }
}
