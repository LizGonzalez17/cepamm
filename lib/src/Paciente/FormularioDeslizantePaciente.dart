import 'package:flutter/material.dart';
import 'package:residencia_cepamm/src/Paciente/agregar.dart';
import 'package:residencia_cepamm/src/secretaria/consultar.dart';

class Formulariodeslizantepaciente extends StatefulWidget {
  const Formulariodeslizantepaciente({super.key});

  @override
  State<Formulariodeslizantepaciente> createState() =>
      _FormulariodeslizantepacienteState();
}

class _FormulariodeslizantepacienteState
    extends State<Formulariodeslizantepaciente> {
  PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: PageView(
        controller: _pageController,
        physics: BouncingScrollPhysics(),
        children: [Agregar(), Consultar()],
      ),
    );
  }
}
