import 'package:flutter/material.dart';
import 'package:freezer_configurador/helpers.dart';
import 'package:freezer_configurador/models/equipment/equipment.dart';
import 'package:freezer_configurador/screens/about.dart';
import 'package:freezer_configurador/screens/configuration.dart';
import 'package:freezer_configurador/screens/equipments.dart';

class MenuOpcoes extends StatelessWidget {
  final List<Equipment> equipments;
  const MenuOpcoes({Key? key, required this.equipments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        padding: const EdgeInsets.all(5.0),
        icon: const Icon(
          Icons.menu,
          size: 35,
        ),
        itemBuilder: (context) => [
              const PopupMenuItem<OpcoesMenu>(
                value: OpcoesMenu.configuracoes,
                child: Text("Configuracoes"),
              ),
              const PopupMenuItem<OpcoesMenu>(
                value: OpcoesMenu.equipamentos,
                child: Text("Equipamentos"),
              ),
              const PopupMenuItem<OpcoesMenu>(
                value: OpcoesMenu.sobre,
                child: Text("Sobre"),
              ),
            ],
        onSelected: (OpcoesMenu opcao) => selecionaOpcaoMenu(context, opcao));
  }

  void selecionaOpcaoMenu(BuildContext context, OpcoesMenu opcao) {
    switch (opcao) {
      case OpcoesMenu.configuracoes:
        navigateTo(context, const ConfiguracaoGeralPage());
        break;
      case OpcoesMenu.equipamentos:
        navigateTo(context, const EquipamentosPage());
        break;
      case OpcoesMenu.sobre:
        navigateTo(context, const SobrePage());
        break;
    }
  }
}

enum OpcoesMenu { configuracoes, equipamentos, sobre }
