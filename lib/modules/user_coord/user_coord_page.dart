import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/widgets/button.dart';
import '../../../core/ui/widgets/text_form_field.dart';
import 'user_coord_controller.dart';

class UserCoordPage extends StatefulWidget {
  const UserCoordPage({Key? key}) : super(key: key);

  @override
  _UserCoordPageState createState() => _UserCoordPageState();
}

class _UserCoordPageState extends State<UserCoordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Coordenadas'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 20, right: 20),
          child: SizedBox(
            width: 500,
            height: 500,
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo1.png',
                  height: 150,
                  fit: BoxFit.fill,
                ),
                CoordenatesForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// #########################################################

class CoordenatesForm extends StatefulWidget {
  const CoordenatesForm({Key? key}) : super(key: key);

  @override
  _CoordenatesFormState createState() => _CoordenatesFormState();
}

class _CoordenatesFormState extends ModularState<CoordenatesForm, UserCoordController> {
  final collectTimeEC = TextEditingController();
  final coordinatesEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    collectTimeEC.dispose();
    coordinatesEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 20),
          CoordTextFormField(
            key: Key('textformfield'),
            label: 'Tempo de Coleta (minutos)',
            controller: collectTimeEC,
            validator: Validatorless.multiple([
              Validatorless.required('Preenchimento obrigatorio'),
              Validatorless.number('Campo numerico'),
            ]),
          ),
          SizedBox(height: 20),
          CoordTextFormField(
            label: 'Coordenadas (Lat,Long)',
            obscureText: false,
            controller: coordinatesEC,
            validator: Validatorless.multiple([
              Validatorless.required('Preenchimento obrigatorio'),
            ]),
          ),
          SizedBox(height: 20),
          CoordDefaultButton(
            label: 'Enviar',
            onPressed: () {
              final formValid = _formKey.currentState?.validate() ?? false;

              if (formValid) {
                controller.sendCoordinates(collectTimeEC.text, coordinatesEC.text);
              }
            },
          )
        ],
      ),
    );
  }
}
