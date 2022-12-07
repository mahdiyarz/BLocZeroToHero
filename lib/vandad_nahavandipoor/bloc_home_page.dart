import 'dart:convert';
import 'dart:io';
import 'dart:developer' as devtools show log;

import 'package:bloc_zero_to_hero/aj_flutter/bloc/bloc_imports.dart';
import 'package:flutter/material.dart';

import 'bloc/bloc_actions.dart';
import 'bloc/person.dart';
import 'bloc/persons_bloc.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

class BlocHomePage extends StatelessWidget {
  const BlocHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              TextButton(
                  onPressed: () {
                    context.read<PersonsBloc>().add(const LoadPersonsAction(
                        url: person1Url, loader: getPersons));
                  },
                  child: Text('get json #1')),
              TextButton(
                  onPressed: () {
                    context.read<PersonsBloc>().add(
                        LoadPersonsAction(url: person2Url, loader: getPersons));
                  },
                  child: Text('get json #2')),
            ],
          ),
          BlocBuilder<PersonsBloc, FetchResult?>(
            buildWhen: (previousResult, currentResult) {
              return previousResult?.persons != currentResult?.persons;
            },
            builder: (context, fetchResult) {
              fetchResult?.log();
              final persons = fetchResult?.persons;
              if (persons == null) {
                return const SizedBox();
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: persons.length,
                  itemBuilder: (context, index) {
                    final person = persons[index];
                    return ListTile(
                      title: Text(person!.name),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
