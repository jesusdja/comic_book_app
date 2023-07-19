import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:comic_book_app/src/global/config/comic_style.dart';
import 'package:comic_book_app/src/global/widgets_utils/button_general.dart';
import 'package:comic_book_app/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:comic_book_app/src/global/widgets_utils/textfield_general.dart';
import 'package:comic_book_app/src/pages/details_comic/provider/details_comic_provider.dart';
import 'package:comic_book_app/src/pages/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsComicPage extends StatefulWidget {
  const DetailsComicPage({Key? key, required this.urlDetails}) : super(key: key);
  final String urlDetails;
  @override
  State<DetailsComicPage> createState() => _DetailsComicPageState();
}

class _DetailsComicPageState extends State<DetailsComicPage> {

  late DetailComicProvider detailComicProvider;

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => DetailComicProvider(widget.urlDetails),
      child: Consumer<DetailComicProvider>(
        builder: (context, provider, child){

          detailComicProvider = provider;

          return Scaffold(
            backgroundColor: ComicColors.color_cbd5f3,
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text('Comic Book App',style: ComicStyles().stylePrimary(
                  size: sizeH * 0.03,color: ComicColors.primary,fontWeight: FontWeight.bold
              )),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,size: sizeH * 0.03,color: ComicColors.primary),
                onPressed: (){ Navigator.of(context).pop(); },
              ),
            ),
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
              child: provider.loadData ?
              Center(
                child: circularProgressColors(
                    colorCircular: ComicColors.primary,
                    widthContainer1: sizeW,
                    widthContainer2: sizeW * 0.1
                ),
              ) :
              detailComicProvider.detailComicModel == null ?
              Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
                  child: Text('Failed to find the required information',textAlign: TextAlign.center,
                  style: ComicStyles().stylePrimary(
                    size: sizeH * 0.03,fontWeight: FontWeight.bold
                  )),
                ),
              ) : cardDetail(),
            ),
          );
        }
      ),
    );
  }

  Widget cardDetail(){

    Widget spaceW = Container(
      width: sizeW,height: 2,
      color: Colors.grey,
    );

    return Container(
      margin: EdgeInsets.symmetric(horizontal: sizeW * 0.02),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: sizeH * 0.05,),
            Container(
              width: sizeW,
              height: sizeH * 0.5,
              margin: EdgeInsets.only(left: sizeW * 0.01,right: sizeW * 0.01,bottom: sizeH * 0.005),
              child: CachedNetworkImage(
                imageUrl: detailComicProvider.detailComicModel!.image!,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) => circularProgressColors(),
                errorWidget: (context, url, error){
                  debugPrint('error : $error');
                  return const Icon(Icons.error);
                },
              ),
            ),
            SizedBox(height: sizeH * 0.02,),
            titleCard(title: 'Characters'),
            spaceW,
            SizedBox(height: sizeH * 0.01,),
            listCardCharacters(),

            SizedBox(height: sizeH * 0.02,),
            titleCard(title: 'Teams'),
            spaceW,
            SizedBox(height: sizeH * 0.01,),
            listCardTeams(),

            SizedBox(height: sizeH * 0.02,),
            titleCard(title: 'Locations'),
            spaceW,
            SizedBox(height: sizeH * 0.01,),
            listCardLocations(),
          ],
        ),
      ),
    );
  }

  Widget titleCard({required String title}){
    return SizedBox(
      width: sizeW,
      child: Text(title,textAlign: TextAlign.start,style: ComicStyles().stylePrimary(
        size: sizeH * 0.03,color: Colors.black,fontWeight: FontWeight.bold
      )),
    );
  }

  Widget listCardCharacters(){

    List<Widget> listW = [];
    for (var element in detailComicProvider.detailComicModel!.characterCredits!) {
      listW.add(
        SizedBox(
          width: sizeW * 0.5,
          child: Row(
            children: [
              Icon(Icons.circle,color: Colors.grey,size: sizeH * 0.02,),
              SizedBox(width: sizeW * 0.03,),
              Expanded(
                child: Text(element.name!),
              )
            ],
          ),
        )
      );
    }

    return SizedBox(
      width: sizeW,
      child: Wrap(
        children: listW,
      ),
    );
  }

  Widget listCardTeams(){

    List<Widget> listW = [];
    for (var element in detailComicProvider.detailComicModel!.teamCredits!) {
      listW.add(
        SizedBox(
          width: sizeW * 0.5,
          child: Row(
            children: [
              Icon(Icons.circle,color: Colors.grey,size: sizeH * 0.02,),
              SizedBox(width: sizeW * 0.03,),
              Expanded(
                child: Text(element.name!),
              )
            ],
          ),
        )
      );
    }

    return SizedBox(
      width: sizeW,
      child: Wrap(
        children: listW,
      ),
    );
  }

  Widget listCardLocations(){

    List<Widget> listW = [];
    for (var element in detailComicProvider.detailComicModel!.locationCredits!) {
      listW.add(
        SizedBox(
          width: sizeW * 0.5,
          child: Row(
            children: [
              Icon(Icons.circle,color: Colors.grey,size: sizeH * 0.02,),
              SizedBox(width: sizeW * 0.03,),
              Expanded(
                child: Text(element.name!),
              )
            ],
          ),
        )
      );
    }

    return SizedBox(
      width: sizeW,
      child: Wrap(
        children: listW,
      ),
    );
  }

}
