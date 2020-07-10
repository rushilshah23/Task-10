import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:Task7/widgets/widgetDescColumn.dart';

class WidgetAlertDialog extends StatefulWidget {
  @override
  _WidgetAlertDialogState createState() => _WidgetAlertDialogState();
}

class _WidgetAlertDialogState extends State<WidgetAlertDialog> {
  @override
  Widget build(BuildContext context) {
    Widget showDialogButton(BuildContext context) {
      Widget okButton = FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("OK"));

      AlertDialog alert = AlertDialog(
        actions: <Widget>[okButton],
        title: Text("Alert Dialog"),
        content: Text("This is ALert Dialog messgae"),
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AlertDialog"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            widgetDescription(
                title: 'Alert Dialog',
                description:
                    'Android AlertDialog can be used to display the dialog message with OK and Cancel buttons. It can be used to interrupt and ask the user about his/her choice to continue or discontinue.Android AlertDialog is composed of three regions: title, content area and action buttons.Android AlertDialog is the subclass of Dialog class.'),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                onPressed: () {
                  showDialogButton(context);
                },
                child: Text("This is Alert Dialog Button"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetRichText extends StatefulWidget {
  @override
  _WidgetRichTextState createState() => _WidgetRichTextState();
}

class _WidgetRichTextState extends State<WidgetRichText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Rich Text"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            widgetDescription(
                title: "Rich Text",
                description:
                    "The RichText widget displays text that uses multiple different styles. The text to display is described using a tree of TextSpan objects, each of which has an associated style that is used for that subtree. The text might break across multiple lines or might all be displayed on the same line depending on the layout constraints."),
            Center(
              child: RichText(
                  text: TextSpan(
                      text: "This is ",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                      children: <TextSpan>[
                    TextSpan(
                        text: ' Rushil Shah',
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 30))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetSelectableText extends StatefulWidget {
  @override
  _WidgetSelectableTextState createState() => _WidgetSelectableTextState();
}

class _WidgetSelectableTextState extends State<WidgetSelectableText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Selectable Text"),
      ),
      body: ListView(
        children: <Widget>[
          widgetDescription(
              title: "Selectable Text",
              description:
                  "The SelectableText widget displays a string of text with a single style. The string might break across multiple lines or might all be displayed on the same line depending on the layout constraints."),
          SelectableText(
            'Try to select this whole line and copy paste',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            cursorColor: Colors.blue,
            autofocus: false,
            showCursor: true,
            enableInteractiveSelection: true,
          )
        ],
      ),
    );
  }
}

class WidgetFlexible extends StatefulWidget {
  @override
  _WidgetFlexibleState createState() => _WidgetFlexibleState();
}

class _WidgetFlexibleState extends State<WidgetFlexible> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Flexible State"),
      ),
      body: ListView(
        children: <Widget>[
          widgetDescription(
              title: "Flexible Widget",
              description:
                  "Using a Flexible widget gives a child of a Row, Column, or Flex the flexibility to expand to fill the available space in the main axis (e.g., horizontally for a Row or vertically for a Column), but, unlike Expanded, Flexible does not require the child to fill the available space."),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 300,
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 2,
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.cyan,
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      color: Colors.blueGrey,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class WidgetSpacer extends StatefulWidget {
  @override
  _WidgetSpacerState createState() => _WidgetSpacerState();
}

class _WidgetSpacerState extends State<WidgetSpacer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Spacer"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            widgetDescription(
                title: "Spacer",
                description:
                    "Spacer creates an adjustable, empty spacer that can be used to tune the spacing between widgets in a Flex container, like Row or Column."),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.grey,
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.blue,
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.red,
                  ),
                  Spacer(
                    flex: 6,
                  ),
                  Container(
                    height: 100,
                    width: 50,
                    color: Colors.green,
                  ),
          
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WidgetDivider extends StatefulWidget {
  @override
  _WidgetDividerState createState() => _WidgetDividerState();
}

class _WidgetDividerState extends State<WidgetDivider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Divider"),
      ),
      body: Column(
        children: <Widget>[
          widgetDescription(
              title: "Divider",
              description:
                  "When two widgets need some space from each other it can be helpful to draw a line between them. The Divider widget is useful wherever you have widgets or groups of widgets that need to be separated."),
          Container(
            height: 100,
            color: Colors.orange,
          ),
          Divider(
            height: 50,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: Colors.blue,
          ),
          Divider(
            height: 50,
            color: Colors.black,
          ),
          Container(
            height: 100,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}

class WidgetIgnorePointer extends StatefulWidget {
  @override
  _WidgetIgnorePointerState createState() => _WidgetIgnorePointerState();
}

class _WidgetIgnorePointerState extends State<WidgetIgnorePointer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Ignore Pointer"),
      ),
      body: Column(
        children: <Widget>[
          widgetDescription(
              title: "Ignore Pointer",
              description:
                  "It can be useful to prevent the user from interacting with parts of your app. When the UI changes under users' fingers, that's actually a pretty common and frustrating problem. You could address this problem by disabling all interactive elements in your app, one by one, or you could use IgnorePointer."),
          IgnorePointer(
            ignoring: true,
            child: Center(
              child: Container(
                child: RaisedButton(
                    onPressed: () {},
                    child: Text("Try to press and it will ignore you")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetColouredFiltered extends StatefulWidget {
  @override
  _WidgetColouredFilteredState createState() => _WidgetColouredFilteredState();
}

class _WidgetColouredFilteredState extends State<WidgetColouredFiltered> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Colour Filter"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            widgetDescription(
                title: "Color Filter",
                description:
                    "It's easy to play around with color in Flutter widgets, and not just by modifying a color parameter. Check out the ColorFiltered widget, which lets you change and morph colors in weird and wonderful ways!"),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Original Image",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset('assets/Flower.jpg'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text("Color Filtered - BLUE",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: ColorFiltered(colorFilter: ColorFilter.mode(Colors.blue, BlendMode.modulate),
                child:Image.asset('assets/Flower.jpg'),)
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WidgetToolTip extends StatefulWidget {
  @override
  _WidgetToolTipState createState() => _WidgetToolTipState();
}

class _WidgetToolTipState extends State<WidgetToolTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tool Tip"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            widgetDescription(
                title: "Tool Tip",
                description:
                    "In Flutter, Tooltip widget is a material design tooltip used to let user know about the functionality of a button or UI action. When a widget is equipped with tooltip, if user long presses the widget or some appropriate action on the widget, tooltip appears as a floating label"),
            Tooltip(
                showDuration: Duration(seconds: 2),
                message: "This is account box",
                child: FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_box),
                  label: Text("try tool tip"),
                ))
          ],
        ),
      ),
    );
  }
}

class WidgetAspectRatio extends StatefulWidget {
  @override
  _WidgetAspectRatioState createState() => _WidgetAspectRatioState();
}

class _WidgetAspectRatioState extends State<WidgetAspectRatio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Aspect Ratio"),
      ),
      body: ListView(
        children: <Widget>[
          widgetDescription(
              title: "Aspect Ratio",
              description:
                  "The AspectRatio widget can be used to adjust the aspect ratio of widgets in your app. Use it to keep the ratio of your widget’s width and height consistent when changing dimensions."),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WidgetSizedBox extends StatefulWidget {
  @override
  _WidgetSizedBoxState createState() => _WidgetSizedBoxState();
}

class _WidgetSizedBoxState extends State<WidgetSizedBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sized Box"),
      ),
      body: ListView(
        children: <Widget>[
          widgetDescription(
              title: "Sized Box",
              description:
                  "Set the exact size of anything with the SizedBox widget. You can provide both dimensions, or just provide one and let the Flutter layout rules fill in the other."),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 100,
                        width: 50,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.purple,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: 50,
                        height: 100,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    color: Colors.brown,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 100,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   height: 200,
          //   child: Row(
          //     children: <Widget>[
          //       Container(
          //         height: 100,
          //         color: Colors.red,
          //       ),
          //       SizedBox(
          //         width: 20,
          //       ),
          //       Container(
          //         height: 150,
          //         color: Colors.yellowAccent),
          //       SizedBox(width: 30),
          //     ],
          //   ),
          // ),
          // SizedBox(
          //   height: 30,
          // ),
          // Container(
          //   height: 200,
          //   child: Row(
          //     children: <Widget>[
          //       SizedBox(
          //         width: 40,
          //       ),
          //       Container(
          //         height: 100,
          //         color: Colors.green,
          //       ),
          //       SizedBox(width: 20),
          //       Container(
          //         height: 100,
          //         color: Colors.purple),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}
