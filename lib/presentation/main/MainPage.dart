import 'package:flutter/material.dart';
import 'package:flutter_workshop/models/PostItem.dart';
import 'package:flutter_workshop/resources/ColorRes.dart';
import 'package:flutter_workshop/resources/ImageRes.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      primary: false,
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _getHeader(context),
            _getBody(_getMockItems()),
            _getFooter(),
          ]),
    );
  }

  _getHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [ColorRes.midnight, ColorRes.darkIndigo],
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              ImageRes.icCamera,
              color: ColorRes.white,
            ),
            Image.asset(
              ImageRes.workshop,
            ),
            Image.asset(
              ImageRes.icRefresh,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBody(List<PostItem> items) {
    return Flexible(
      child: ListView.separated(
        padding: EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (context, i) => _getListItem(context, items[i]),
        separatorBuilder: (context, i) => _getDivider(),
      ),
    );
  }

  Widget _getFooter() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(horizontal: 40),
      color: ColorRes.darkIndigo,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            ImageRes.icHome,
            width: 28,
            height: 28,
          ),
          Image.asset(
            ImageRes.icAdd,
            width: 46,
            height: 46,
          ),
          Image.asset(
            ImageRes.icProfile,
            width: 28,
            height: 28,
          ),
        ],
      ),
    );
  }

  List<PostItem> _getMockItems() {
    return [
      PostItem(
        profileName: 'annileras',
        avatarUrl:
        'https://cdn.zeplin.io/5ccffadfbaa9bd34a21c90b5/assets/01E3C2AE-8E06-48E8-A3CA-644729649CDE.png',
        imageUrl:
        'https://cdn.zeplin.io/5ccffadfbaa9bd34a21c90b5/assets/A663BE71-D3DD-4C62-AAE0-64198C457A86.png',
        liked: true,
        likeCount: 128,
      ),
      PostItem(
        profileName: 'alexschmit',
        avatarUrl:
        'https://cdn.zeplin.io/5ccffadfbaa9bd34a21c90b5/assets/01E3C2AE-8E06-48E8-A3CA-644729649CDE.png',
        imageUrl:
        'https://cdn.zeplin.io/5ccffadfbaa9bd34a21c90b5/assets/A663BE71-D3DD-4C62-AAE0-64198C457A86.png',
        liked: false,
        likeCount: 109,
      ),
    ];
  }

  Widget _getListItem(BuildContext context, PostItem item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _getItemHeader(item),
        _getItemImage(item),
        _getItemFooter(item),
      ],
    );
  }

  Widget _getItemHeader(PostItem item) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 6, 10, 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _getAvatar(item),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 0, 2),
            child: _getUserName(item),
          )
        ],
      ),
    );
  }

  Widget _getAvatar(PostItem item) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(item.avatarUrl),
        ),
        border: Border.all(color: ColorRes.veryLightPink, width: 1),
      ),
    );
  }

  Widget _getUserName(PostItem item) {
    return Text(
      item.profileName,
      style: TextStyle(color: ColorRes.darkIndigo, fontSize: 15),
    );
  }

  Widget _getItemImage(PostItem item) {
    return Image.network(
      item.imageUrl,
      fit: BoxFit.contain,
    );
  }

  Widget _getItemFooter(PostItem item) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 12, 0, 21),
      child: Row(
        children: <Widget>[
          _getLikeImage(item),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: _getLikeCountLabel(item),
          )
        ],
      ),
    );
  }

  Widget _getLikeImage(PostItem item) {
    return Image(
      width: 24,
      height: 24,
      image: AssetImage(item.liked ? ImageRes.icLiked : ImageRes.icLike),
    );
  }

  Widget _getLikeCountLabel(PostItem item) {
    final like = item.likeCount == 1 ? 'like' : 'likes';
    final label = '${item.likeCount} $like';
    return Text(
      label,
      style: TextStyle(
        color: ColorRes.darkIndigo,
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getDivider() {
    return Container(
      height: 1,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 12),
      color: ColorRes.darkIndigo5,
    );
  }
}