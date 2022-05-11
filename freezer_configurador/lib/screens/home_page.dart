import 'package:flutter/material.dart';
import 'package:freezer_configurador/widgets/menu_options.dart';
import 'equipment/equipment_view.dart';

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
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: const [MenuOpcoes()],
          title: const Text("BeCooler"),
          bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              tabs: const <Widget>[
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
                Tab(
                  icon: Icon(Icons.add),
                )
              ])),
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          EquipamentoView(),
          Center(
            child: Text("It's rainy here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(
            child: Text("It's sunny here"),
          ),
          Center(child: Text("Cadastro"))
        ],
      ),
    );
  }
}
