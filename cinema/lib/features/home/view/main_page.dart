import 'package:auto_route/auto_route.dart';
import 'package:cinema/features/home/cubit/home_cubit.dart';
import 'package:cinema/features/home/repo/home_repo.dart';
import 'package:cinema/routes/app_router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> item = [
    'Action',
    'Comedy',
    'Romance',
    'Horror',
  ];

  int current = 0;
  int currentindex = 0;
  var _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final homeCubit = context.read<HomeCubit>();
    homeCubit.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff081933),
      appBar: AppBar(
        title: Text('main'),
        elevation: 0.0,
        backgroundColor: Color(0xff081933),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // Add padding around the search bar
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        // Use a Material design search bar
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _searchController,
                          decoration: InputDecoration(
                            fillColor: Color(0xff434d5c),
                            filled: true,
                            hintText: 'Search Movie..',
                            hintStyle: TextStyle(color: Colors.white),
                            // Add a clear button to the search bar
                            suffixIcon: IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () => _searchController.clear(),
                            ),
                            // Add a search icon or button to the search bar
                            prefixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: () {
                                // Perform the search here
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:10.0 ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff434d5c),
                                borderRadius: BorderRadiusDirectional.horizontal(start:Radius.circular(10.0),end: Radius.circular(10.0)),
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff434d5c),
                                borderRadius: BorderRadiusDirectional.horizontal(start:Radius.circular(10.0),end: Radius.circular(10.0)),
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff434d5c),
                                borderRadius: BorderRadiusDirectional.horizontal(start:Radius.circular(10.0),end: Radius.circular(10.0)),
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,

                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xff434d5c),
                                borderRadius: BorderRadiusDirectional.horizontal(start:Radius.circular(10.0),end: Radius.circular(10.0)),
                              ),
                              child: InkWell(
                                onTap: (){},
                                child: Text(
                                  'Action',
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: 20.0,

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Latest Movie',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                          Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'View All',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: state.popularMoviesModel.results.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.router.push(SecoundRoute( movieId: state.popularMoviesModel.results[index].id,));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(25),
                                  child: Image(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/${state.popularMoviesModel.results[index].image}'),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                state.popularMoviesModel.results[index].title,
                                maxLines: 1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is HomeLoading) {
            return CircularProgressIndicator();
          }

          return const SizedBox();
        },
      ),
    );
  }
}
