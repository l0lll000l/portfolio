import 'package:Portfolio/Utils/constants/colors.dart';
import 'package:Portfolio/Utils/constants/sizes.dart';
import 'package:Portfolio/Utils/loaders/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatefulWidget {
  const TRoundedImage({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.imageurl,
    this.applyImageRadius = false,
    this.border,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.backGroundColor = TColors.light,
    this.borderRadius = TSizes.md,
    this.imageradius = TSizes.md,
    this.nocacheNetworkImage = false,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final Color backGroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double imageradius;
  final bool nocacheNetworkImage;

  @override
  State<TRoundedImage> createState() => _TRoundedImageState();
}

class _TRoundedImageState extends State<TRoundedImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onPressed,
        child: Container(
            height: widget.height,
            width: widget.width,
            padding: widget.padding,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: widget.border,
                color: widget.backGroundColor),
            child: ClipRRect(
              borderRadius: widget.applyImageRadius
                  ? BorderRadius.circular(widget.imageradius)
                  : BorderRadius.zero,
              child: widget.nocacheNetworkImage
                  ? Image.network('${widget.imageurl}')
                  : widget.isNetworkImage
                      ? CachedNetworkImage(
                          fit: widget.fit,
                          imageUrl: widget.imageurl,
                          progressIndicatorBuilder: (context, url, progress) =>
                              const TShimmerEffect(
                                width: double.infinity,
                                height: 190,
                                radius: 15,
                              ),
                          errorWidget: (context, url, error) {
                            return const Icon(Icons.error);
                          })
                      : Image(
                          fit: widget.fit,
                          // clip: Clip.hardEdge,

                          image: AssetImage(widget.imageurl)),
            )));
  }
}
