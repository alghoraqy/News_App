import 'package:flutter/material.dart';
import 'package:news_app_api/modules/web_view/web_view.dart';
Widget articleItem(article, context){
  return  InkWell(
    onTap: (){
      navigatTo(context, WebviewScreen(article['url']));
    },
    child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image:  DecorationImage(image: NetworkImage('${article['urlToImage']}'!='null' ?'${article['urlToImage']}': 'https://ik.imagekit.io/ionicfirebaseapp/getwidget/docs/tr:w-800,f-auto/Circular_1_3x_NfFXiyxXyz.png'),
                    fit: BoxFit.cover,
  
                    ),
                  )
                  ),
                  const SizedBox(width: 10,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          style: Theme.of(context).textTheme.headline1 ,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '${article['publishedAt']}'
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
  ) ; 
}

Widget myDivider(context){
  return  Container(
    width: MediaQuery.of(context).size.width,
    height: 1,
    color: Colors.grey,
  );
}

void navigatTo(context,Widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>Widget));
}