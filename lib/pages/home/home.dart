import 'package:therapy_zone/pages/home/About.dart';
import 'package:flutter/material.dart';
import 'package:therapy_zone/models/post.dart';
import 'package:therapy_zone/pages/home/chart.dart';
import 'package:therapy_zone/pages/home/doctor.dart';
import 'package:therapy_zone/pages/home/learn.dart';
import 'package:therapy_zone/pages/home/quiz.dart';
import 'package:therapy_zone/services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  //declaring variables
  List<Post> posts = [
    Post(
        title: 'Why so sad',
        content:
            'ki likhbo aar.\nsharajibon khali dukkhei katlo shukher mukhti dekhlam na.\noh. jontrona',
        date: '28-07-12',
        tag: "\u{1F641}"),
    Post(
        title: 'Why so gloom',
        content: 'whywhywhyyyy',
        date: '21-06-11',
        tag: "\u{1F62A}"),
    Post(
        title: 'I quit',
        content: "That's all",
        date: '23-01-08',
        tag: "\u{1F616}"),
    Post(
        title: 'Test 1',
        content:
            'Cupidatat tempor aute enim ut nisi aliquip adipisicing incididunt qui sint amet eiusmod irure. Esse non quis dolore ad. Non ullamco in est officia consequat fugiat tempor tempor dolor. Eu labore duis duis enim qui.',
        date: '23-01-08',
        tag: '\u{1F610}'),
    Post(
        title: 'Test3',
        content:
            'Ex veniam voluptate et proident ullamco ad ad excepteur anim commodo. Sit eiusmod quis cillum duis velit proident est nostrud fugiat duis esse adipisicing. Eiusmod ut ad sit in aliqua ex officia id velit. Irure id nulla nisi minim. Amet exercitation magna pariatur sit exercitation sunt cillum fugiat in. Commodo ullamco fugiat eiusmod irure ad. Ea anim non aliqua quis enim sit voluptate enim.',
        date: '21-01-08',
        tag: "\u{1F610}"),
    Post(
        title: 'Test4',
        content:
            'Ex veniam voluptate et proident ullamco ad ad excepteur anim commodo. Sit eiusmod quis cillum duis velit proident est nostrud fugiat duis esse adipisicing. Eiusmod ut ad sit in aliqua ex officia id velit. Irure id nulla nisi minim. Amet exercitation magna pariatur sit exercitation sunt cillum fugiat in. Commodo ullamco fugiat eiusmod irure ad. Ea anim non aliqua quis enim sit voluptate enim.',
        date: '21-01-08',
        tag: "\u{1F610}"),
    Post(
        title: 'Test2',
        content:
            'Ex veniam voluptate et proident ullamco ad ad excepteur anim commodo. Sit eiusmod quis cillum duis velit proident est nostrud fugiat duis esse adipisicing. Eiusmod ut ad sit in aliqua ex officia id velit. Irure id nulla nisi minim. Amet exercitation magna pariatur sit exercitation sunt cillum fugiat in. Commodo ullamco fugiat eiusmod irure ad. Ea anim non aliqua quis enim sit voluptate enim.',
        date: '21-01-08',
        tag: "\u{1F610}"),
  ];

  Map data = {};

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty ? data : posts;
    // print(data);
    // if (data.isNotEmpty) {
    //   Post p = Post(
    //       title: data['title'].toString(),
    //       content: data['content'].toString(),
    //       date: data['date'].toString());
    //   setState(() {
    //     posts.insert(0, p);
    //     // data.forEach((key, value) => posts.add(Post(title: data['title'])));
    //   });
    // }
    // posts.insert(0, (data));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(99, 43, 108, 1),
        title: Center(
          child: Text(
            'Home',
            style: TextStyle(
              color: Color.fromRGBO(252, 195, 163, 1),
            ),
          ),
        ),
        actions: [
          PopupMenuButton(
            color: Color.fromRGBO(99, 43, 108, 1),
            itemBuilder: (_) => <PopupMenuItem<String>>[
              PopupMenuItem<String>(
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => About()));
                  },
                  child: Text(
                    'About us',
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                ),
              ),
              PopupMenuItem<String>(
                child: FlatButton.icon(
                  onPressed: () async {
                    await _auth.signOut();
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white30,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white30,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
          color: Color.fromRGBO(39, 15, 54, 1),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 4.0),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Card(
                              color: Color.fromRGBO(99, 43, 108, .5),
                              child: ListTile(
                                onTap: null,
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          ('${posts[index].title} ${posts[index].tag}'),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.yellow[100]),
                                        ),
                                        Text(
                                          posts[index].date,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                252, 195, 163, 1),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 4, 165, 4),
                                      child: Divider(
                                        height: 2,
                                        thickness: .5,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      posts[index].content,
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red[100],
                                      ),
                                      //Color.fromRGBO(252, 195, 163, 1)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ), //since shobkisu same page e ase, just post the list? try it
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: BottomAppBar(
                    color: Color.fromRGBO(99, 43, 108, 1),
                    child: IconTheme(
                      data: IconThemeData(
                        color: Color.fromRGBO(240, 159, 156, 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 40),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.article_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Learn()),
                                  );
                                }),
                            SizedBox(
                              width: 40,
                            ),
                            IconButton(
                                icon: Icon(Icons.search_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Quiz()),
                                  );
                                }),
                            SizedBox(
                              width: 40,
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.bar_chart_outlined,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Chart()),
                                  );
                                }),
                            SizedBox(
                              width: 40,
                            ),
                            IconButton(
                                icon: Icon(Icons.local_hospital_outlined),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Doctor()),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: FloatingActionButton(
          backgroundColor: Color.fromRGBO(240, 159, 156, 1),
          onPressed: () {
            Navigator.pushNamed(context, '/newpost');
          },
          child: Icon(
            Icons.create_outlined,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}

/* abstract class ListItem {
  Widget buildTitle(BuildContext context);
  Widget buildContent(BuildContext context);
}

class PostItem implements ListItem {
  final String title;
} */
