import 'package:auto_route/auto_route.dart';
import 'package:cinema/features/details/cubit/details_state.dart';
import 'package:cinema/features/details/models/details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/details_cupit.dart';
import '../repo/details_repo.dart';

@RoutePage()
class SecoundView extends StatelessWidget {
  const SecoundView({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_){
      return DetailsCubit(DetailsRepo());

      },
      child: SecoundPage(
        movieId: movieId,
      ),
    );
  }
}

class SecoundPage extends StatefulWidget {
  const SecoundPage({super.key, required this.movieId});

  final int movieId;

  @override
  State<SecoundPage> createState() => _SecoundPageState();
}

class _SecoundPageState extends State<SecoundPage> {
  @override
  void initState() {
    super.initState();
    final detailsCubit = context.read<DetailsCubit>();

    detailsCubit.getMovieDetails(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color(0xff081933),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsSuccess) {
            var genresList = state.popularDetailsModel.genres;
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned.fill(
                        child: Image(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500/${state.popularDetailsModel.image}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 20.0,
                            child: Icon(
                              Icons.play_arrow,
                              size: 15.0,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Text(
                          'IMDP 6.8',
                          style: TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        state.popularDetailsModel.vote.toString(),
                        style: TextStyle(color: Colors.yellow, fontSize: 20.0),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '(118k reviews)',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        state.popularDetailsModel.title,
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: SizedBox(
                    height: 28.0,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 15.0,),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index)=>buildGenreItem(genresList[index]),
                        itemCount: genresList.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      state.popularDetailsModel.overview,
                      style: TextStyle(color: Colors.grey, fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: Colors.orange),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Get Reservation',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
  Widget buildGenreItem(String genre)=>Container(
    decoration: BoxDecoration(
      color: Color(0xff434d5c),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    child: Text(
      genre,
      style: TextStyle(color: Colors.white, fontSize: 20.0),
    ),
  );
}
