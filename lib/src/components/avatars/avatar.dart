import 'package:flutter/material.dart';
import 'package:snap_ui/src/themes/theme.dart';

enum AvatarSize { xs, sm, md, lg, xl, xxl }

enum AvatarVariant { circle, rounded, square }

class SnapAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final IconData? icon;
  final AvatarSize size;
  final AvatarVariant variant;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWidth;
  final bool isOnline;
  final bool isOffline;
  final bool isAway;
  final bool isBusy;
  final VoidCallback? onTap;

  const SnapAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.icon,
    this.size = AvatarSize.md,
    this.variant = AvatarVariant.circle,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderWidth,
    this.isOnline = false,
    this.isOffline = false,
    this.isAway = false,
    this.isBusy = false,
    this.onTap,
  }) : assert(
         (imageUrl != null) || (initials != null) || (icon != null),
         'Either imageUrl, initials, or icon must be provided',
       );

  @override
  Widget build(BuildContext context) {
    final theme = SnapUiThemeProvider.of(context);
    final effectiveSize = _getSize(theme);
    final effectiveBorderRadius = _getBorderRadius(theme);
    final effectiveBackgroundColor = _getBackgroundColor(theme);
    final effectiveTextColor = _getTextColor(theme);
    final effectiveBorderColor = _getBorderColor(theme);
    final effectiveBorderWidth = _getBorderWidth(theme);

    Widget avatarContent;
    if (imageUrl != null) {
      avatarContent = ClipRRect(
        borderRadius: effectiveBorderRadius,
        child: Image.network(
          imageUrl!,
          width: effectiveSize,
          height: effectiveSize,
          fit: BoxFit.cover,
        ),
      );
    } else if (initials != null) {
      avatarContent = Center(
        child: Text(
          initials!,
          style: theme.typography.titleMedium.copyWith(
            color: effectiveTextColor,
          ),
        ),
      );
    } else {
      avatarContent = Icon(
        icon,
        size: effectiveSize * 0.6,
        color: effectiveTextColor,
      );
    }

    Widget avatar = Container(
      width: effectiveSize,
      height: effectiveSize,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: effectiveBorderRadius,
        border:
            effectiveBorderWidth > 0
                ? Border.all(
                  color: effectiveBorderColor,
                  width: effectiveBorderWidth,
                )
                : null,
      ),
      child: avatarContent,
    );

    if (onTap != null) {
      avatar = InkWell(
        onTap: onTap,
        borderRadius: effectiveBorderRadius,
        child: avatar,
      );
    }

    if (isOnline || isOffline || isAway || isBusy) {
      return Stack(
        children: [
          avatar,
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: effectiveSize * 0.3,
              height: effectiveSize * 0.3,
              decoration: BoxDecoration(
                color: _getStatusColor(theme),
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: effectiveSize * 0.05,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return avatar;
  }

  double _getSize(SnapUiTheme theme) {
    switch (size) {
      case AvatarSize.xs:
        return theme.spacing.six;
      case AvatarSize.sm:
        return theme.spacing.eight;
      case AvatarSize.md:
        return theme.spacing.twelve;
      case AvatarSize.lg:
        return theme.spacing.sixteen;
      case AvatarSize.xl:
        return theme.spacing.twentyFour;
      case AvatarSize.xxl:
        return theme.spacing.thirtyTwo;
    }
  }

  BorderRadius _getBorderRadius(SnapUiTheme theme) {
    switch (variant) {
      case AvatarVariant.circle:
        return BorderRadius.circular(_getSize(theme) / 2);
      case AvatarVariant.rounded:
        return theme.borderRadius.lg;
      case AvatarVariant.square:
        return BorderRadius.zero;
    }
  }

  Color _getBackgroundColor(SnapUiTheme theme) {
    if (backgroundColor != null) return backgroundColor!;
    if (imageUrl != null) return Colors.transparent;
    return theme.primaryColor;
  }

  Color _getTextColor(SnapUiTheme theme) {
    if (textColor != null) return textColor!;
    return Colors.white;
  }

  Color _getBorderColor(SnapUiTheme theme) {
    if (borderColor != null) return borderColor!;
    return Colors.white;
  }

  double _getBorderWidth(SnapUiTheme theme) {
    if (borderWidth != null) return borderWidth!;
    return 0;
  }

  Color _getStatusColor(SnapUiTheme theme) {
    if (isOnline) return theme.successColor;
    if (isOffline) return theme.disabledColor;
    if (isAway) return theme.warningColor;
    if (isBusy) return theme.errorColor;
    return Colors.transparent;
  }
}
