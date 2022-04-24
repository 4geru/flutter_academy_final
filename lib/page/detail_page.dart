import 'package:flutter/material.dart';

import 'detail_page_argument.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailPageArgument;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.tvListResultObject.originalName),
      ),
      body: Center(
        child: Column(
          children: [
            Text(args.tvId),
            Text(args.year.toString()),
            Text('${args.tvListResultObject.firstAirDate}~'),
            Image.network('https://image.tmdb.org/t/p/w300/${args.tvListResultObject.posterPath}'),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
