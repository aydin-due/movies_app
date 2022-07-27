import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [Text('buildActions')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return Text('buildWidget');
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('buildReesults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('buildSuggestion: $query');
  }
}
