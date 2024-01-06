import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:neobis_flutter_chapter8/core/consts/assets_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/colors_consts.dart';
import 'package:neobis_flutter_chapter8/core/consts/text_styles_consts.dart';

class CustomItemWidget extends StatelessWidget {
  final int id;
  final int index;
  final String title;
  final int price;
  final int likes;
  final bool liked;
  final Function(int) onLikeEvent;
  final Function(int) onDetailEvent;

  const CustomItemWidget({
    super.key,
    required this.id,
    required this.index,
    required this.title,
    required this.price,
    required this.likes,
    required this.liked,
    required this.onDetailEvent,
    required this.onLikeEvent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onDetailEvent(id),
      onDoubleTap: () => onLikeEvent(id),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: ColorsConsts.shadowBoxColor,
              blurRadius: 14.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(12),
              ),
              child: Image.asset(
                AssetsConsts.carImage,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: TextStylesConsts.lvl14GrayStyle,
            ),
            Text(
              "$price \$",
              style: TextStylesConsts.lvl14BlueStyle,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () => onLikeEvent(id),
                  child: GestureDetector(
                    child: SvgPicture.asset(
                      AssetsConsts.likedIcon,
                      colorFilter: ColorFilter.mode(
                        liked
                            ? ColorsConsts.lv1RedColor
                            : ColorsConsts.lv2GreyColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text("$likes"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
