import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_template/core/design_system/widgets/column.dart';
import 'package:flutter_template/core/design_system/widgets/row.dart';
import 'package:flutter_template/core/extensions/interaction_extensions.dart';

import '../../../design_system/theme/color.dart';
import '../../../design_system/theme/shape.dart';
import '../../../design_system/theme/size.dart';
import '../../../design_system/theme/type.dart';
import '../../../design_system/widgets/space.dart';
import '../../../model/entity/goods/goods.dart';

/// 商品卡片组件
class GoodsListCard extends StatelessWidget {
  final Goods goods;
  final VoidCallback onTap;

  const GoodsListCard({super.key, required this.goods, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return [
          // 左侧商品图片
          _buildProductImage(),

          const SpaceHorizontalMedium(),

          // 中间商品信息区域
          _buildProductInfo().expanded(),
        ]
        .toRowTop()
        .padding(all: spacePaddingLarge)
        .ripple()
        .backgroundColor(backgroundContainer)
        .clipRRect(all: radiusLarge)
        .tapScale(onTap: onTap);
  }

  /// 构建商品图片
  Widget _buildProductImage() {
    // 安全处理：当主图为空或非法时显示占位
    final url = goods.mainPic;
    if (url.isEmpty) {
      return Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: backgroundSecondaryContainer,
          borderRadius: BorderRadius.circular(radiusMedium),
        ),
        child: const Icon(Icons.image_not_supported),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(radiusMedium),
      child: Image.network(
        url,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stack) => Container(
          width: 100,
          height: 100,
          color: backgroundSecondaryContainer,
          child: const Icon(Icons.image_not_supported),
        ),
      ),
    );
  }

  /// 构建商品信息
  Widget _buildProductInfo() {
    return [
      // 商品标题和标签行
      _buildTitleWithTags(),

      const SpaceVerticalSmall(),

      // 副标题（如果有）
      if (goods.subTitle?.isNotEmpty == true) ...[
        Text(
          goods.subTitle!,
          style: fontBodySmall?.copyWith(color: textSecondary),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SpaceVerticalXSmall(),
      ],

      [
        _buildPriceInfo(),
        Text(
          '已售 ${goods.sold}',
          style: fontMarkSmall?.copyWith(color: textPlaceholder),
        ),
      ].toRowBetween(),
    ].toColumnStart();
  }

  /// 构建标题和标签
  Widget _buildTitleWithTags() {
    return [
      // 商品标题
      Text(
        goods.title,
        style: fontTitleMedium?.copyWith(
          color: textPrimary,
          fontWeight: fontWeightBold,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ).expanded(),
    ].toRowTop();
  }

  /// 构建价格信息
  Widget _buildPriceInfo() {
    // 价格为整型时直接展示；若需要两位小数请改为除以100再格式化
    return Text(
      '¥${goods.price}',
      style: fontTitleLarge?.copyWith(color: error, fontWeight: fontWeightBold),
    );
  }
}
