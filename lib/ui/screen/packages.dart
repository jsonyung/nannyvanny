import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/packages/packages_bloc.dart';
import '../../values/app_color.dart';
import '../../widgets/package_card.dart';

class Packages extends StatelessWidget {
  const Packages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Packages',
                  style: TextStyle(
                    color: AppColors.customBlue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              BlocBuilder<PackagesBloc, PackagesState>(
                builder: (context, state) {
                  if (state is PackagesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PackagesLoaded) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.packages.length,
                      itemBuilder: (context, index) {
                        return PackageCard(
                          package: state.packages[index],
                          index: index,
                        );
                      },
                    );
                  } else if (state is PackagesError) {
                    return Center(
                      child: Text('Error: ${state.error}'),
                    );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
