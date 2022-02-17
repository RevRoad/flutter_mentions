import 'package:flutter/material.dart';
import 'package:flutter_mentions/flutter_mentions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (_, child) => Portal(child: child!),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              ElevatedButton(
                child: Text('Get Text'),
                onPressed: () {
                  print(key.currentState!.controller!.markupText);
                },
              ),
              Container(
                child: FlutterMentions(
                  key: key,
                  suggestionPosition: SuggestionPosition.top,
                  maxLines: 5,
                  minLines: 1,
                  decoration: InputDecoration(hintText: 'hello'),
                  mentions: [
                    Mention(
                        trigger: '@',
                        style: TextStyle(
                          color: Colors.amber,
                        ),
                        data: [
                          MentionData(
                            id: '61as61fsa',
                            display: 'fayeedP',
                            fullName: 'Fayeed Pawaskar',
                            image:
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          ),
                          MentionData(
                            id: '61asasgasgsag6a',
                            display: 'khaled',
                            fullName: 'DJ KHaled',
                            searchString: 'DJ Khaled khaled',
                            image:
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                            style: TextStyle(color: Colors.purple),
                          ),
                          MentionData(
                            id: 'asfgasga41',
                            display: 'markT',
                            fullName: 'Mark Twain',
                            image:
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          ),
                          MentionData(
                            id: 'asfsaf451a',
                            display: 'JhonL',
                            fullName: 'Jhon Legend',
                            image:
                                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
                          ),
                        ],
                        suggestionBuilder: (data) {
                          return Container(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: data.image != null
                                      ? NetworkImage(
                                          data.image!,
                                        )
                                      : null,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(data.fullName),
                                    Text('@${data.display}'),
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
