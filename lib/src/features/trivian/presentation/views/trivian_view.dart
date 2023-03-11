import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trivian_app/src/features/trivian/presentation/bloc/trivian_bloc.dart';

import 'widgets/trivian_text_widget.dart';

class TrivianView extends StatelessWidget {
  TrivianView({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int? valueNew;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeData.dark().backgroundColor,
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TrivianTextWidget(),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'El Campo no debe estar Vacio';
                    } else if (int.tryParse(value) == null) {
                      return 'Solo debe Insertar Numero enteros';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    valueNew = int.tryParse(value ?? '0');
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      hintText: 'Search a Number',
                      labelText: 'Search a Number')),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50)),
                      onPressed: () => searchNumber(context),
                      child: const Text('Search Number')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 50)),
                      onPressed: () => BlocProvider.of<TrivianBloc>(context)
                          .add(TrivianEvent.getRandomNumberEvent()),
                      child: const Text(
                        'Search Random Number',
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void searchNumber(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<TrivianBloc>(context)
          .add(TrivianEvent.getTrivianNumberEvent(valueNew ?? 0));
    }
  }
}
