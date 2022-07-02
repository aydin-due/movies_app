import 'package:flutter/material.dart';
import 'package:movies_app/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            'no-movie'; //argumentos pasados en la nav
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        //solo se pueden poner widgets hederados de fam sliver
        _CustomAppBar(),

        SliverList(
          delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            _Overview(),
            _Overview(),
            _Overview(),
            CastingCards()
            ]
          )),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: 10),
            color: Colors.black12,
            child: const Text(
              'movie.title',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
            placeholder: AssetImage('assets/loading.gif'),
            image: NetworkImage('https://via.placeholder.com/500x300'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            image: NetworkImage('https://via.placeholder.com/200x300'),
            height: 150,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'movie.title',
              style: textTheme.headline5,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(
              'movie.originalTitle',
              style: textTheme.subtitle1,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.start,
                  size: 15,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'movie.voteAverage',
                  style: textTheme.caption,
                )
              ],
            )
          ],
        )
      ]),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'Eu eiusmod est incididunt aliqua excepteur sit. Eu nostrud magna cillum excepteur magna consequat aute deserunt do ut fugiat in aliqua tempor. Proident nisi minim cillum excepteur anim ut aliquip proident laboris dolor aute. Cillum ullamco elit in reprehenderit laboris laborum. Sit reprehenderit id commodo in proident ex cillum non nulla anim id esse eu aliqua. Eu fugiat aliquip in id eiusmod dolore aute ex consequat consectetur irure eu duis ex. Id aute quis est mollit cillum ipsum ullamco incididunt nulla consequat.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,

        ),

    );
  }
}
