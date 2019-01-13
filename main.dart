import "package:flutter/material.dart";
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "YouTube UI Challenge",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.red,

      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class YouTubeData{

  int id;
  String imageurl;
  String title;
  String youtuber;
  String views;
  String time;
  String header;

  YouTubeData(this.id, this.imageurl, this.title, this.youtuber, this.views, this.time,this.header);

}
class _HomeState extends State<Home> {
  int id=0;

  final List<YouTubeData> _items = <YouTubeData>[
    new YouTubeData(1, 'assets/codecave.jpg', 'Dart', 'YouTuber 1','2 K', '1 hours ago','D'),
    new YouTubeData(2, 'assets/codecave.jpg', 'Java', 'YouTuber 2','2 K', '2 hours ago','J'),
    new YouTubeData(3, 'assets/codecave.jpg', 'Python', 'YouTuber 3','2 K', '3 hours ago','P'),
    new YouTubeData(4, 'assets/codecave.jpg', 'C++', 'YouTuber 4','2 K', '4 hours ago','C'),
    new YouTubeData(5, 'assets/codecave.jpg', 'C', 'YouTuber 4','2 K', '5 hours ago','C'),

  ];
  static final TextStyle _boldStyle =TextStyle(fontWeight: FontWeight.bold);
  static final TextStyle _greyStyle =TextStyle(color: Colors.grey);


static final menuitem=<String>['one','two','three'];
final List<PopupMenuItem<String>> popupmenuitem=menuitem.map((String value)=>PopupMenuItem<String>(value: value,child: Text(value),)).toList();
  @override
  Widget build(BuildContext context) {


    final tab=<Widget>[
      CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 25.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("YouTube"),
            ),
            leading: Icon(Icons.live_tv),

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.video_call),
                onPressed: (){},
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed:(){},
              ),
              CircleAvatar(
                child: Text("C"),
                backgroundColor: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
            ],
          ),
          SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              sliver: new SliverFixedExtentList(
                itemExtent: 250.0,
                delegate: SliverChildBuilderDelegate(
                        (builder, index) => list(_items[index]),
                        childCount: _items.length,
                ),

              )
          ),
        ],
      ),
      Center(child: Text("two"),),
      Center(child: Text("three"),),
      Center(child: Text("four"),),
      Center(child: Text("five"),),
    ];

    final bottomNavigationBarItems=<BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home),title: Text("Home")),
      BottomNavigationBarItem(icon: Icon(Icons.whatshot),title: Text("Trending")),
      BottomNavigationBarItem(icon: Icon(Icons.subscriptions),title: Text("Subscription")),
      BottomNavigationBarItem(icon: Icon(Icons.email),title: Text("Inbox")),
      BottomNavigationBarItem(icon: Icon(Icons.folder),title: Text("Library")),

    ];

    final bottomNavBar=BottomNavigationBar(
      fixedColor: Colors.red,
      items: bottomNavigationBarItems,
      currentIndex: id,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          id=index;
        });
      },
    );

    return Scaffold(
      body: tab[id],
      bottomNavigationBar:Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.black)),
          ),
          child: bottomNavBar
      ),
    );
  }
  Widget list(YouTubeData itm){
    return Card(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 180.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: Image.asset(
                      itm.imageurl,
                      fit: BoxFit.fill,
                    ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "DATA",
                      style: Theme.of(context).textTheme.headline.copyWith(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
            Padding(padding: EdgeInsets.only(top: 5.0),),
            Row(
              children: <Widget>[
                CircleAvatar(child: Text(itm.header),),
                Padding(padding: EdgeInsets.all(5.0),),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 1.0),),
                        Text(itm.title+".",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(itm.youtuber+"."),
                        Padding(padding: EdgeInsets.all(5.0),),
                        Text(itm.views+"."),
                        Padding(padding: EdgeInsets.all(5.0),),
                        Text(itm.time),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.all(27.0),),
               PopupMenuButton<String>(itemBuilder: (BuildContext context)=>popupmenuitem,),
              ],
            ),
        ],
      ),
    );
  }
}

