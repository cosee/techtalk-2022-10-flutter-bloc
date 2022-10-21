import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_bulb/domain/blocs/light_bulb/light_bulb_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO add BlocProvider for LightBulbBloc
    // TODO use BlocListener to show light bulb off message
    return Scaffold(
      appBar: AppBar(title: const Text('TechTalk BLoC')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const _ActionButtons(),
      body: const _Body(),
    );
  }

  void _showLightBulbOffMessage(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        content: Text('Light bulb is off'),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        //const _LightBulb(),
        Center(
          // TODO add BlocBuilder to change color name
          child: Text(
            'Color',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  const _ActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () {
            // TODO send LightBulbBackEvent
          },
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        FloatingActionButton(
          onPressed: () {
            // TODO send LightBulbOnEvent
          },
          child: const Icon(Icons.electric_bolt),
        ),
        FloatingActionButton(
          onPressed: () {
            // TODO send LightBulbNextEvent
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}

class _LightBulb extends StatelessWidget {
  const _LightBulb();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: BlocBuilder<LightBulbBloc, LightBulbState>(
          builder: (context, state) {
            IconData iconData;
            int? hexCode;
            if (state is LightBulbOn) {
              iconData = Icons.lightbulb;
              hexCode = state.lightBulb.hexCode;
            } else {
              iconData = Icons.lightbulb_outline;
            }
            return Icon(
              iconData,
              color: hexCode == null ? null : Color(hexCode),
            );
          },
        ),
      ),
    );
  }
}
