import 'package:flutter/material.dart';

class SearchResultListview extends StatelessWidget {
  const SearchResultListview({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text('data'),
          // child: NewestBookItem(imagurl: 'https://www.freepik.com/free-photo/closeup-scarlet-macaw-from-side-view-scarlet-macaw-closeup-head_27271706.htm#fromView=keyword&page=1&position=0&uuid=cdfed68e-9a5e-4468-a8f7-5c8932e0099d&query=Animale',
            ),
        ),
      
    );
  }
}
