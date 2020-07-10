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
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),
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
        title: Text("WidgetSpacer State"),
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
        title: Text("WidgetDivider"),
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
        title: Text("Coloured Filter"),
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
    );
  }
}
