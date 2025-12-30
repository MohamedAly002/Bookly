import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.5 / 4,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                        image: AssetImage(AssetsData.booktest),
                        fit: BoxFit.fill))),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Text(
                  "Harry Potter and the Goblet of Fire",
                  style: Styles.textStyle20.copyWith(fontFamily: kGtSectraFine),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const   SizedBox(
                height: 8),
              Text(
                "J.K Rowling",
                style: Styles.textStyle14.copyWith(color: Colors.grey.shade400),
              ),
             const SizedBox(
                height: 11,),
              Row(
                children: [
                 const  Text(
                    "19.99\$",
                    style: Styles.textStyle20,
                  ),
                  const Spacer(),
                  const Icon(
                    FontAwesomeIcons.solidStar,
                    size: 14,
                    color: Color(0xffFFDD4F),
                  ),
                  const SizedBox(
                    width: 6.3,
                  ),
                  const Text(
                    "4.8",
                    style: Styles.textStyle16,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "(2390)",
                    style: Styles.textStyle14
                        .copyWith(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
