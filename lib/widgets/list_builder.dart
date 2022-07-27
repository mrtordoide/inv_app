import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// class ListBuilderData {
//   String title;
//   String subtitle;

//   ListBuilderData({required this.title, required this.subtitle});
// }

class ListBuilder extends StatefulWidget {
  Future<List> datalist;
  ListBuilder({Key? key, required this.datalist}) : super(key: key);

  @override
  State<ListBuilder> createState() => _ListBuilder();
}

class _ListBuilder extends State<ListBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.datalist,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: Text("Loading . . ."));
          }
          return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (BuildContext context, int index) {
                return Slidable(
                    groupTag: "1",
                    key: const ValueKey(0),
                    endActionPane: const ActionPane(
                      motion: ScrollMotion(),
                      children: [
                        SlidableAction(
                          // An action can be bigger than the others.
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF7BC043),
                          foregroundColor: Colors.white,
                          icon: Icons.archive,
                          label: 'Archive',
                        ),
                        SlidableAction(
                          onPressed: doNothing,
                          backgroundColor: Color(0xFF0392CF),
                          foregroundColor: Colors.white,
                          icon: Icons.save,
                          label: 'Save',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: const FlutterLogo(size: 40.0),
                      title: Text(snapshot.data[index]["title"]),
                      subtitle: Text(snapshot.data[index]["subtitle"]),
                      isThreeLine: true,
                      dense: true,
                    ));
              });
        });
  }
}

void doNothing(BuildContext context) {}
