import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightbulb/domain/blocs/lightbulb/lightbulb_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LightbulbBloc(),
      child: BlocListener<LightbulbBloc, LightbulbState>(
        listener: (context, state) {
          if (state is LightbulbOff) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Lightbulb is off'),
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
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LightbulbBloc, LightbulbState>(
            builder: (context, state) {
              IconData iconData;
              int? hexCode;
              if (state is LightbulbOn) {
                iconData = Icons.lightbulb;
                hexCode = state.lightbulb.hexCode;
              } else {
                iconData = Icons.lightbulb_outline;
              }
              return Icon(
                iconData,
                size: 400,
                color: hexCode == null ? null : Color(hexCode),
              );
            },
          ),
          BlocBuilder<LightbulbBloc, LightbulbState>(
            builder: (context, state) {
              String color = '';
              if (state is LightbulbOn) {
                color = state.lightbulb.color;
              }
              return Text(
                color,
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
      ),
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
              context.read<LightbulbBloc>().add(const LightbulbBackEvent()),
          child: const Icon(Icons.arrow_back),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<LightbulbBloc>().add(const LightbulbToggleEvent()),
          child: const Icon(Icons.electric_bolt),
        ),
        FloatingActionButton(
          onPressed: () =>
              context.read<LightbulbBloc>().add(const LightbulbNextEvent()),
          child: const Icon(Icons.arrow_right),
        ),
      ],
    );
  }
}
