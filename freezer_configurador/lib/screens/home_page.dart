import 'package:flutter/material.dart';

class MonitoramentoPage extends StatefulWidget {
  const MonitoramentoPage({Key? key}) : super(key: key);

  @override
  State<MonitoramentoPage> createState() => _MonitoramentoPageState();
}

class _MonitoramentoPageState extends State<MonitoramentoPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.list,
                size: 35,
              ),
              tooltip: 'Configurações',
              onPressed: () {
                // handle the press
              },
            ),
          ],
          title: const Text("BeCooler"),
          bottom: TabBar(controller: _tabController, tabs: const <Widget>[
            Tab(
              text: "Freezer 1",
            ),
            Tab(
              text: "Freezer 2",
            ),
            Tab(
              text: "Freezer 3",
            ),
            Tab(
              text: "Freezer 4",
            ),
          ])),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          Center(
            child: Text("It's cloudy here"),
          ),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
        ],
      ),
    );
  }
}
