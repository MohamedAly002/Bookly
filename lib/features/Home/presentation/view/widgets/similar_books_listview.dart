import 'package:bookly/features/Home/presentation/view/widgets/featured_book_image_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const Padding(
              padding: EdgeInsets.only(right: 5),
              child: FeaturedBookImageItem( imageUrl: 'https://www.freepik.com/free-photo/closeup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_27271706.htm#fromView=keyword&page=1&position=0&uuid=cdfed68e-9a5e-4468-a8f7-5c8932e0099d&query=Animale',),
            );
          },
        ),
      ),
    );
  }
}
