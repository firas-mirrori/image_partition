import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:image_partition/partitions.dart' as imgpartitions;


class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.title,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: tabs.length,
    child: Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.orange, Colors.indigo],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
          ),
        ),
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: Colors.white,
          indicatorWeight: 5,
          tabs: tabs,
        ),
        elevation: 20,
        titleSpacing: 20,
      ),
      body: TabBarView(children: children),
    ),
  );
}
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Custom Paint';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.black),
    home: MainPage(),
  );
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: MyApp.title,
    tabs: [
      Tab(icon: Icon(Icons.image), text: 'Image'),
    ],
    children: [
      ImagePaintPage(),
    ],
  );
}

class ImagePaintPage extends StatefulWidget {
  @override
  _ImagePaintPageState createState() => _ImagePaintPageState();
}

class _ImagePaintPageState extends State<ImagePaintPage> {
  ui.Image? image;

  @override
  void initState() {
    super.initState();

    loadImage('assets/images/0_day4.jpg');
  }

  Future loadImage(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    final image = await decodeImageFromList(bytes);

    setState(() => this.image = image);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(
      child: image == null
          ? CircularProgressIndicator()
          : Container(
        height: 1000,
        width: 1000,
        child: FittedBox(
          child: SizedBox(
            width: image!.width.toDouble(),
            height: image!.height.toDouble(),
            child: CustomPaint(
              painter: ImagePainter(image!),
            ),
          ),
        ),
      ),
    ),
  );
}

class ImagePainter extends CustomPainter {
  final ui.Image image;
  ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    canvas.drawImage(image, Offset.zero, paint);


    var all_img_parts = imgpartitions.faceParts();
    var templeLeft = all_img_parts["3"]["points"][0];
    var templeRight = all_img_parts["3"]["points"][1];
    var NoseBridge = all_img_parts["6"]["points"];
    var noseSideLeft = all_img_parts["7"]["points"][0];
    var noseSideRight = all_img_parts["7"]["points"][1];
    var nosewingLeft = all_img_parts["8"]["points"][0];
    var nosewingRight = all_img_parts["8"]["points"][1];
    var nosetip = all_img_parts["9"]["points"];
    //var cheeckBonesLeft = all_img_parts["10"]["points"][0];
    //var cheeckBonesRight = all_img_parts["10"]["points"][1];
    var cheeckBonesLeft = all_img_parts["11"]["points"][0];
    var cheeckBonesRight = all_img_parts["11"]["points"][1];
    var CheeksApplesLeft = all_img_parts["12"]["points"][0];
    var CheeksApplesRight = all_img_parts["12"]["points"][1];
    var CheeksHollowsLeft = all_img_parts["13"]["points"][0];
    var CheeksHollowsRight = all_img_parts["13"]["points"][1];
    var CupidsBow = all_img_parts["15"]["points"];
    var chin = all_img_parts["16"]["points"];
    var upperLips = all_img_parts["18"]["points"];
    var lowerLips = all_img_parts["19"]["points"];
    var eyeLeft = all_img_parts["20"]["points"][0];
    var eyeRight = all_img_parts["20"]["points"][1];
    var undereyeLeft = all_img_parts["21"]["points"][0];
    var undereyeRight = all_img_parts["21"]["points"][1];
    var lidseyeLeft = all_img_parts["22"]["points"][0];
    var lidseyeRight = all_img_parts["22"]["points"][1];
    var browboneeyeLeft = all_img_parts["23"]["points"][0];
    var browboneeyeRight = all_img_parts["23"]["points"][1];
    var forehead = all_img_parts["2"]["points"];


    drawPath(NoseBridge, Color.fromRGBO(166, 255, 0, 0.4392156862745098), paint, canvas);
    drawPath(noseSideLeft, Color.fromRGBO(255, 100, 153, 0.4196078431372549), paint, canvas);
    drawPath(noseSideRight, Color.fromRGBO(255, 100, 153, 0.4196078431372549), paint, canvas);
    drawPath(templeLeft, Color.fromRGBO(255, 0, 0, 0.4196078431372549), paint, canvas);
    drawPath(templeRight, Color.fromRGBO(255, 0, 0, 0.4196078431372549), paint, canvas);
    drawPath(nosewingLeft, Color.fromRGBO(0, 55, 255, 0.4196078431372549), paint, canvas);
    drawPath(nosewingRight, Color.fromRGBO(0, 55, 255, 0.4196078431372549), paint, canvas);
    drawPath(nosetip, Color.fromRGBO(136, 0, 255, 0.4196078431372549), paint, canvas);
    drawPath(cheeckBonesLeft, Color.fromRGBO(0, 255, 42, 0.4196078431372549), paint, canvas);
    drawPath(cheeckBonesRight, Color.fromRGBO(0, 255, 42, 0.4196078431372549), paint, canvas);
    drawPath(CheeksApplesLeft, Color.fromRGBO(255, 119, 0, 0.4196078431372549), paint, canvas);
    drawPath(CheeksApplesRight, Color.fromRGBO(255, 119, 0, 0.4196078431372549), paint, canvas);
    drawPath(CheeksHollowsLeft, Color.fromRGBO(255, 0, 200, 0.4196078431372549), paint, canvas);
    drawPath(CheeksHollowsRight, Color.fromRGBO(255, 0, 200, 0.4196078431372549), paint, canvas);
    drawPath(CupidsBow, Color.fromRGBO(0, 255, 196, 0.4196078431372549), paint, canvas);
    drawPath(chin, Color.fromRGBO(255, 0, 102, 0.4196078431372549), paint, canvas);
    drawPath(upperLips, Color.fromRGBO(0, 26, 255, 0.4196078431372549), paint, canvas);
    drawPath(lowerLips, Color.fromRGBO(29, 205, 29, 0.4196078431372549), paint, canvas);
    //drawPath(eyeRight, Color.fromRGBO(0, 26, 255, 0.4196078431372549), paint, canvas);
    //drawPath(eyeLeft, Color.fromRGBO(29, 205, 135, 0.4196078431372549), paint, canvas);
    drawPath(undereyeRight, Color.fromRGBO(25, 0, 221, 0.4196078431372549), paint, canvas);
    drawPath(undereyeLeft, Color.fromRGBO(25, 0, 221, 0.4196078431372549), paint, canvas);
    drawPath(lidseyeLeft, Color.fromRGBO(66, 221, 0, 0.4196078431372549), paint, canvas);
    drawPath(lidseyeRight, Color.fromRGBO(66, 221, 0, 0.4196078431372549), paint, canvas);
    drawPath(browboneeyeRight, Color.fromRGBO(221, 0, 200, 0.4196078431372549), paint, canvas);
    drawPath(browboneeyeLeft, Color.fromRGBO( 221, 0, 200, 0.4196078431372549), paint, canvas);
    drawPath(forehead, Color.fromRGBO( 221, 100, 200, 0.4196078431372549), paint, canvas);

    //noseBridgePath.addPolygon(noseList!,true);
    Color c = Color.fromRGBO(0, 0, 0, 0);



    //canvas.drawShadow(noseBridgePath, Color.fromRGBO(255,0,0,0.5), 0, true);
    //Offset p1 = Offset(380,500);
    //paint.color = Color.fromRGBO(255,255,0,0.5);
    //canvas.drawCircle(p1, 50, paint);
  }

  void drawPath(List<List<int>> path, Color color, Paint paint, Canvas canvas){
    var bridgePath = Path();
    bridgePath.moveTo(path[0][0].toDouble(),path[0][1].toDouble());
    for (int i = 1; i < path.length; i++) {
      bridgePath.lineTo(path[i][0].toDouble(), path[i][1].toDouble());
    }
    paint.color = color;
    canvas.drawPath(bridgePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Show Processed Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Show Processed Image'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;// = "Show Processed Image";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showProcessed = false;
  img.Image? _image;
  ui.Image? _uiImage;

  Future<void> loadImage() async {
    ByteData data = await rootBundle.load('assets/images/0_day4.jpg');
    //_image = img.decodePng(data.buffer.asUint8List());
    _image = img.decodeImage(data.buffer.asUint8List());

  }

  img.Image processImage(img.Image image){
    image = img.grayscale(image);
    image = img.drawCircle(image, 100, 100, 100, 1);
    img.draw
    return image;
  }

  Future<ui.Image> imgImageToUiImage(img.Image image) async{
    ui.ImmutableBuffer buffer = await
    ui.ImmutableBuffer.fromUint8List(
        image.getBytes(format: img.Format.rgba));
    ui.ImageDescriptor id = ui.ImageDescriptor.raw(
        buffer,
        height: image.height,
        width: image.width,
        pixelFormat: ui.PixelFormat.rgba8888);
    ui.Codec codec = await id.instantiateCodec(
        targetHeight: image.height,
        targetWidth: image.width);
    ui.FrameInfo fi = await codec.getNextFrame();
    ui.Image uiImage = fi.image;

    canvas = Canvas(uiImage);
    return uiImage;
  }

  @override
  void initState() {
    super.initState();
    loadImage().then((value){
      if(_image != null) {
        _image = processImage(_image!);
        imgImageToUiImage(_image!).then((value) {
          _uiImage = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
          child: Column(
              children: [
                _showProcessed ? RawImage(image: _uiImage) : Image.asset('assets/images/0_day4.jpg'),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        if(_showProcessed == false){
                          _showProcessed = true;
                        }else{
                          _showProcessed = false;
                        }
                      });
                    },
                    child: Text("Toggle")
                )
              ]
          )
      ),
    );
  }
}


 */