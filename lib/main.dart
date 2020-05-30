import 'package:destiny/choice_button.dart';
import 'package:destiny/story_manager.dart';
import 'package:flutter/material.dart';

void main() => runApp(DestinyApp());

class DestinyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shape your own Destiny',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.blue,
      ),
      darkTheme: ThemeData.dark(),
      home: DestinyHomePage(),
    );
  }
}

class DestinyHomePage extends StatefulWidget {
  DestinyHomePage({Key key}) : super(key: key);

  @override
  _DestinyHomePageState createState() => _DestinyHomePageState();
}

class _DestinyHomePageState extends State<DestinyHomePage> {
  StoryManager storyManager = StoryManager();

  Future<void> _confirmAndRestartStory() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Restart story?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Restart'),
              onPressed: () {
                setState(() {
                  storyManager.restartStory();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget showChoiceOrEnd(bool isEnd) {
    Widget w;
    if (isEnd) {
      w = SizedBox(
        height: 20.0,
        child: Text(
          'THE END',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontFamily: 'Noto Serif',
          ),
        ),
      );
    } else {
      w = ChoiceButton(
        onPressed: () {
          setState(() {
            storyManager.advanceFrame(0);
          });
        },
        color: Colors.red,
        splashColor: Colors.amber,
        child: Text(
          storyManager.choiceText(0),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'Noto Serif',
          ),
        ),
      );
    }
    return w;
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
      switch (index) {
        case 0:
          _drawerKey.currentState.openDrawer();
          break;
        case 1:
          _confirmAndRestartStory();
      }
    }

    return Scaffold(
      key: _drawerKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Destiny',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Stories'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            AboutListTile(
              applicationName: 'Destiny',
              applicationVersion: '0.0.1',
              icon: Icon(Icons.info),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            title: Text('Restart'),
          ),
        ],
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyManager.storyText(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                      fontFamily: 'Noto Serif',
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: showChoiceOrEnd(storyManager.nextFrameChoices() == null),
              ),
              SizedBox(
                height: 15.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyManager.nextFrameChoices() != null,
                  child: ChoiceButton(
                    onPressed: () {
                      setState(() {
                        storyManager.advanceFrame(1);
                      });
                    },
                    color: Colors.green,
                    splashColor: Colors.lightGreenAccent,
                    child: Text(
                      storyManager.choiceText(1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Noto Serif',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
