import 'package:flutter/material.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:freezer_configurador/repositories/equipment.dart';
import 'package:freezer_configurador/widgets/menu_options.dart';
import 'equipment/equipment_view.dart';
import 'equipment_form/equipment_form.dart';

class MonitoramentoPage extends StatefulWidget {
  const MonitoramentoPage({Key? key}) : super(key: key);

  @override
  State<MonitoramentoPage> createState() => _MonitoramentoPageState();
}

class _MonitoramentoPageState extends State<MonitoramentoPage>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Equipment>>(
        stream: EquipmentRepository().getEquipments(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<Equipment>? equipamentos = snapshot.data;
            TabController _tabController =
                TabController(length: equipamentos!.length + 1, vsync: this);

            return Scaffold(
              appBar: AppBar(
                  actions: [MenuOpcoes(equipments: equipamentos)],
                  title: Row(children: const [
                    Image(
                      height: 50,
                      image: AssetImage('assets/images/BeCooler.png'),
                    ),
                    Text("BeCooler"),
                  ]),
                  bottom: TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      tabs: getTabs(equipamentos))),
              body: TabBarView(
                  controller: _tabController, children: getViews(equipamentos)),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  List<Widget> getViews(List<Equipment> equipamentos) {
    List<Widget> views = [];
    for (var equip in equipamentos) {
      views.add(EquipamentoView(equipment: equip));
    }

    views.add(const EquipamentoCadastro());
    return views;
  }

  List<Widget> getTabs(List<Equipment> equipamentos) {
    List<Widget> tabs = [];
    for (var equip in equipamentos) {
      tabs.add(Tab(child: Text(equip.name)));
    }

    tabs.add(const Tab(
      icon: Icon(Icons.add),
    ));

    return tabs;
  }
}
