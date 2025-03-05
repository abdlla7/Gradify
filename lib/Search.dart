import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SearchBar(
            leading: const Icon(Icons.arrow_back),
            trailing:  [SvgPicture.asset('assets/icons/search.svg')],
            hintText: 'Search',
          ),
        ),
      ),
    );
  }
}