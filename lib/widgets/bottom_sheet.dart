import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  final Widget child;
  String title;

  CustomBottomSheet({Key? key, required this.child, this.title = ""})
      : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Widget makeDismissable({required Widget child}) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Navigator.of(context).pop(),
          child: GestureDetector(
            onTap: () {},
            child: child,
          ),
        );

    return makeDismissable(
        child: DraggableScrollableSheet(
            initialChildSize: 0.9,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            builder: (_, controller) => Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  padding:
                      const EdgeInsets.only(right: 16, left: 16, bottom: 16),
                  child: ListView(controller: controller, children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 18),
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text('Done'),
                        ),
                        Container(
                          height: 40.0,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Center(
                            heightFactor: 2.0,
                            child: Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    widget.child,
                  ]),
                )));
  }
}
