import 'package:flutter/material.dart';
import 'package:startfirstdemo/DatabaseHelper.dart';
import 'package:startfirstdemo/MyData.dart';

import 'package:provider/provider.dart';

final DatabaseHelper db = DatabaseHelper();
MyData datamodel = MyData();

class LIST extends StatefulWidget {
  const LIST({super.key});

  @override
  State<LIST> createState() => _LISTState();
}

class _LISTState extends State<LIST> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MyData>(
      builder: (context, dataModel, child) {
        return ListView.builder(
          itemCount: dataModel.updated_data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(dataModel.updated_data[index].title),
              leading: const Icon(Icons.circle),
              trailing: IconButton(
                  onPressed: () {
                    Provider.of<MyData>(context, listen: false)
                        .deleteData(dataModel.updated_data[index].title);
                  },
                  icon: const Icon(Icons.delete)),
            );
          },
        );
      },
    );
  }
}
