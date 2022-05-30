

// 子Item大小固定，数量和间距动态变化的Grid布局方式
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class FixedSizeSliverGridDelegate extends SliverGridDelegate {
  final double mainAxisItemExtent;
  final double crossAxisItemExtent;
  final double mainAxisSpacing;
  final double crossAxisMinSpacing;

  const FixedSizeSliverGridDelegate(this.mainAxisItemExtent,
      this.crossAxisItemExtent, this.mainAxisSpacing, this.crossAxisMinSpacing);

  @override
  SliverGridLayout getLayout(SliverConstraints constraints) {

    final double crossAxisExtent = constraints.crossAxisExtent;
    int crossAxisCount = crossAxisExtent ~/ crossAxisItemExtent;
    // TODO: 除0错误
    double crossAxisSpacing = (crossAxisExtent - crossAxisCount * crossAxisItemExtent) / (crossAxisCount - 1);

    while (crossAxisSpacing < crossAxisMinSpacing) {
      crossAxisCount--;
      crossAxisSpacing = (crossAxisExtent - crossAxisCount * crossAxisItemExtent) / (crossAxisCount - 1);
    }

    return SliverGridRegularTileLayout(
      crossAxisCount: crossAxisCount,
      mainAxisStride: mainAxisItemExtent + mainAxisSpacing,
      crossAxisStride: crossAxisItemExtent + crossAxisSpacing,
      childMainAxisExtent: mainAxisItemExtent,
      childCrossAxisExtent: crossAxisItemExtent,
      reverseCrossAxis: axisDirectionIsReversed(constraints.crossAxisDirection),
    );
  }

  @override
  bool shouldRelayout(covariant SliverGridDelegate oldDelegate) {
    // TODO: implement shouldRelayout
    return true;
  }
}
