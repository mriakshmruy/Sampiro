import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sampiro/dependency_injection.dart';
import 'package:sampiro/features/dashboard/presentation/bloc/bloc.dart';
import 'package:sampiro/features/video/domain/repositories/iparish_video_repository.dart';
import 'package:sampiro/features/video/presentation/bloc/video_bloc.dart';
import 'package:sampiro/features/video/presentation/widgets/video_view.dart';

@RoutePage()
class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VideoBloc(parishVideoRepository: getIt<IParishVideoRepository>())..add(const VideosFetched()),
      child: const VideoView(),
    );
  }
}
