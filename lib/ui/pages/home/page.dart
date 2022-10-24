import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_bulb/domain/blocs/light_bulb/light_bulb_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LightBulbBloc(),
      child: BlocListener<LightBulbBloc, LightBulbState>(
        listener: (context, state) {
          if (state is LightBulbOff) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 1),
                behavior: SnackBarBehavior.floating,
                content: Text('Light bulb is off'),
              ),
            );
          }
        },
        child: Scaffold(
          appBar: AppBar(title: const Text('TechTalk BLoC')),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const _ActionButtons(),
          body: const _Body(),
        ),
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
        Flexible(
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
        ),
        Center(
          child: BlocBuilder<LightBulbBloc, LightBulbState>(
            builder: (context, state) {
              String color = '';
              if (state is LightBulbOn) {
                color = state.lightBulb.color;
              }
              return Text(
                color,
                style: Theme.of(context).textTheme.headline3,
              );
            },
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
          onPressed: () =>
              context.read<LightBulbBloc>().add(const LightBulbBackEvent()),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<LightBulbBloc>().add(const LightBulbToggleEvent()),
          child: const Icon(Icons.electric_bolt),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<LightBulbBloc>().add(const LightBulbNextEvent()),
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
