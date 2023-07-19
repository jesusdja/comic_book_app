import 'package:comic_book_app/initial_page.dart';
import 'package:comic_book_app/src/global/config/comic_colors.dart';
import 'package:comic_book_app/src/global/config/comic_style.dart';
import 'package:comic_book_app/src/global/widgets_utils/button_general.dart';
import 'package:comic_book_app/src/global/widgets_utils/circular_progress_colors.dart';
import 'package:comic_book_app/src/global/widgets_utils/textfield_general.dart';
import 'package:comic_book_app/src/pages/login/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginProvider loginProvider;

  @override
  Widget build(BuildContext context) {


    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, provider, child){

          loginProvider = provider;

          return Scaffold(
            backgroundColor: ComicColors.color_cbd5f3,
            body: Container(
              margin: EdgeInsets.symmetric(horizontal: sizeW * 0.1),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: sizeH * 0.35,),
                    textTitle(title: 'Email'),
                    TextFieldGeneral(
                      textEditingController: loginProvider.controllerEmail,
                      enable: !loginProvider.loadSave,
                    ),
                    SizedBox(height: sizeH * 0.02,),
                    textTitle(title: 'Password'),
                    TextFieldGeneral(
                      textEditingController: loginProvider.controllerPass,
                      enable: !loginProvider.loadSave,
                      obscure: loginProvider.seePass,
                      suffixIcon: IconButton(
                        icon: Icon(loginProvider.seePass ? Icons.remove_red_eye : Icons.remove_red_eye_outlined),
                        onPressed: (){ loginProvider.seePass = !loginProvider.seePass; },
                      ),
                    ),
                    SizedBox(height: sizeH * 0.05,),
                    loginProvider.loadSave ?
                    circularProgressColors(
                        colorCircular: ComicColors.primary,widthContainer2: sizeW * 0.06
                    ) :
                    ButtonGeneral(
                      height: sizeH * 0.06,
                      title: 'Register',
                      onPressed: (){},
                      textStyle: ComicStyles().stylePrimary(
                          size: sizeH * 0.025,color: Colors.grey[800]!,fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }

  Widget textTitle({required String title}){
    return SizedBox(
      width: sizeW,
      child: Text(title,style: ComicStyles().stylePrimary(
        size: sizeH * 0.025,color: Colors.grey[800]!
      )),
    );
  }

  Future registerUser() async{
    if(await loginProvider.register()){

    }
  }
}
