import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_bloc.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_event.dart';
import 'package:learning_wonderland/features/home/domain/bloc/home_state.dart';
import 'package:learning_wonderland/config/theme/app_colors.dart';
import 'package:learning_wonderland/config/theme/app_text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomeData());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Harikalar Diyarı Haritası",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              ),
            );
          } else if (state is HomeLoaded) {
            return Stack(
              children: [
                Image.asset(
                  'assets/images/backgrounds/bacground_map.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
                Positioned(
                  top: 100,
                  left: 50,
                  child: Text(
                    'Hello Kitty Modülü',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 150,
                  child: Text(
                    'Cinnamoroll Modülü',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ],
            );
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.message,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.red),
              ),
            );
          } else {
            return const Center(child: Text("Bilinmeyen Durum"));
          }
        },
      ),
    );
  }
}
