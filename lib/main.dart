import 'package:exam_flutter/features/product_list/bloc_main/product_bloc.dart';
import 'package:exam_flutter/features/product_list/bloc_pagination/pagination_bloc.dart';
import 'package:exam_flutter/features/product_list/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ProductBloc(),
            ),
            BlocProvider(
              create: (context) => PaginationBloc()..add(NextPageEvent(0, 10)),
            ),
          ],
          child: const ProductList(),
        ),
      ),
    );
  }
}
