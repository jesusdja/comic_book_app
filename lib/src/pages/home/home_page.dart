import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:comic_book_app/src/global/config/comic_style.dart';
import 'package:comic_book_app/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:comic_book_app/src/pages/details_comic/details_comic_page.dart';
import 'package:comic_book_app/src/pages/home/provider/home_provider.dart';
import 'package:comic_book_app/src/pages/home/widgets/app_bar.dart';
import 'package:comic_book_app/src/pages/home/widgets/grid_comics_page.dart';
import 'package:comic_book_app/src/pages/home/widgets/list_comics_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late HomeProvider homeProvider;

  @override
  Widget build(BuildContext context) {

    homeProvider = Provider.of<HomeProvider>(context);

    return Scaffold(
      backgroundColor: ComicColors.color_cbd5f3,
      appBar: appBarHome(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: sizeW * 0.01),
        child: homeProvider.loadData ?
        circularProgressColors(
            colorCircular: ComicColors.primary,
            widthContainer1: sizeW,
            widthContainer2: sizeW * 0.1
        ) : body(),
      ),
    );
  }

  Widget body(){
    return Column(
      children: [
        SizedBox(height: sizeH * 0.02,),
        typeGrid(),
        SizedBox(height: sizeH * 0.03,),
        Expanded(
          child: bodyCard(),
        )
      ],
    );
  }

  Widget typeGrid(){
    return SizedBox(
      width: sizeW,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          typeGridElement(type: 0),
          SizedBox(width: sizeW * 0.02),
          typeGridElement(type: 1),
        ],
      ),
    );
  }

  Widget typeGridElement({required int type}){

    bool selected = (type == 0 && homeProvider.isGridList) || (type == 1 && !homeProvider.isGridList);

    return InkWell(
      child: Row(
        children: [
          Icon(type == 0 ? Icons.menu : Icons.grid_view_rounded,
              color: selected ? Colors.green : Colors.grey),
          Text(type == 0 ? 'List' : 'Grid',
              style: ComicStyles().stylePrimary(size: sizeH * 0.02,
                  color: selected ? Colors.green : Colors.grey)),
        ],
      ),
      onTap: (){
        homeProvider.isGridList = type == 0;
      },
    );
  }

  Widget bodyCard(){

    List<Widget> listW = [];

    for (var element in homeProvider.comics) {
      listW.add(
        InkWell(
          child: homeProvider.isGridList ? ListComicsPage(comicModel: element,) : GridComicsPage(comicModel: element,),
          onTap: (){
            Navigator.push(context,MaterialPageRoute<void>(
                builder: (context) => DetailsComicPage(urlDetails: element.apiDetailUrl ?? '',)
            ),);
          },
        )
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        homeProvider.getComic();
        await Future.delayed(const Duration(seconds: 2));
      },
      child: SingleChildScrollView(
        child: Wrap(
          children: listW,
        ),
      ),
    );
  }

}
