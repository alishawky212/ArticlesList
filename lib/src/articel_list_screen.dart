import 'package:arqaam_task/models/FakeData.dart';
import 'package:arqaam_task/src/articaleDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:arqaam_task/models/articale_model.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';


const String AD_MOB_APP_ID = '';
const String AD_MOB_TEST_DEVICE = 'test_device_id - run ad then check device logs for value';
const String AD_MOB_AD_ID = '';

class ArticalesList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ArticalesListState();
}

class ArticalesListState extends State<ArticalesList>{

List<ArticaleModel>list = [];
BannerAd _bannerAd;
FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
  testDevices: <String>[AD_MOB_TEST_DEVICE],
);

BannerAd createBannerAd() {
  return new BannerAd(
    size: AdSize.banner,
    adUnitId: BannerAd.testAdUnitId,
    targetingInfo: targetingInfo,
  );
}

 @override
 void initState(){
   super.initState();
   list = getArticales();
   FirebaseAdMob.instance.initialize(appId: AD_MOB_APP_ID);
   _bannerAd = createBannerAd()..load()..show();
   firebaseCloudMessagingListeners();
   _bannerAd.isLoaded().then((vlaue){
     print(vlaue);
   });
 }


@override
void dispose() {
  super.dispose();
  _bannerAd?.dispose();
}

@override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list.length,
      itemBuilder: (context,index){
        return new GestureDetector(
          child: makeListItem(list[index]),
          onTap: (){
            openDetailScreen(list[index]);
          },
        );
      },
    
    );
  }

  Widget makeListItem(ArticaleModel articale){
   return Card(
     elevation: 8.0,
     margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
     child: Container(
       decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
       child: ListTile(
         title: Text(articale.title,
           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
         ),
       ),
     ),
   );
  }

  void openDetailScreen(ArticaleModel model){
    Navigator.push(context,new MaterialPageRoute(
      builder: (context){
        return new ArticaleDetailScreen(model: model);
      }
       ));
  }

void firebaseCloudMessagingListeners() {
  if (Platform.isIOS) iOS_Permission();

  _firebaseMessaging.getToken().then((token){
    print(token);
  });

  _firebaseMessaging.configure(
    onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
    },
    onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    },
    onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
    },
  );
}

void iOS_Permission() {
  _firebaseMessaging.requestNotificationPermissions(
      IosNotificationSettings(sound: true, badge: true, alert: true)
  );
  _firebaseMessaging.onIosSettingsRegistered
      .listen((IosNotificationSettings settings)
  {
    print("Settings registered: $settings");
  });
}
}