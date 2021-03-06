import 'package:anime_dating_flutter/providers/provider.dart';
import 'package:anime_dating_flutter/utils/constants.dart';
import 'package:anime_dating_flutter/utils/suggestion_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tabs/account.dart';
import 'tabs/search.dart';
import 'tabs/saved.dart';
import 'dart:math';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static Random random = new Random();

  @override
  void initState() {
    super.initState();

    final provider = Provider.of<DataProvider>(context, listen: false);
    provider.getSuggestionData(context);
    provider.getCharactersData(context);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataProvider>(context);

    final appBar = AppBar(
      title: GestureDetector(
        onTap: () {
          showSuggestionDialog(
              context,
              provider.suggestions[
                  random.nextInt(provider.suggestions.length - 1) + 0]);
        },
        child: Text(
          K.appName,
          style:
              TextStyle(color: Theme.of(context).primaryColor, fontSize: 30.0),
        ),
      ),
      centerTitle: true,
      bottom: TabBar(
        unselectedLabelColor: unselectedTabLabelColor,
        labelColor: Theme.of(context).primaryColor,
        labelPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        indicatorWeight: 5.0,
        indicator: BoxDecoration(
          gradient: primaryGradient,
        ),
        tabs: <Widget>[
          _buildTab(Icons.search),
          _buildTab(Icons.star),
          _buildTab(Icons.account_circle),
        ],
      ),
    );

    final body = TabBarView(
      children: [
        SearchPage(),
        SavedPage(),
        AccountPage(),
      ],
    );

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: appBar,
        body: body,
      ),
    );
  }

  Widget _buildTab(IconData icon) {
    return Container(
      height: 40.0,
      alignment: Alignment.center,
      color: Colors.white,
      child: Icon(icon, size: 40.0),
    );
  }
}
