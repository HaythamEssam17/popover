import 'package:flutter/painting.dart';

import 'popover_direction.dart';

final class PopoverPath {
  final double arrowRadius;
  final double bodyRadius;

  const PopoverPath(
    this.arrowRadius,
    this.bodyRadius,
  );

  Path draw(
    PopoverDirection? direction,
    Rect? arrowRect,
    Rect bodyRect,
  ) {
    final path = Path();

    if (arrowRect != null) {
      switch (direction) {
        case PopoverDirection.top:
          _drawTopElement(path, arrowRect, bodyRect);
          break;
        case PopoverDirection.right:
          _drawRightElement(path, arrowRect, bodyRect);
          break;
        case PopoverDirection.left:
          _drawLeftElement(path, arrowRect, bodyRect);
          break;
        case PopoverDirection.bottom:
        default:
          _drawBottomElement(path, arrowRect, bodyRect);
          break;
      }
    }

    return path;
  }

  void _drawBottomElement(Path path, Rect arrowRect, Rect bodyRect) {
    final centerX = arrowRect.left + arrowRect.width / 2;
    final tipY = arrowRect.top;
    final baseY = arrowRect.bottom;

    // Arrow
    path.moveTo(arrowRect.left, baseY);
    path.lineTo(centerX - arrowRadius, tipY + arrowRadius);
    path.quadraticBezierTo(
        centerX, tipY, centerX + arrowRadius, tipY + arrowRadius);
    path.lineTo(arrowRect.right, baseY);

    // Body
    path.lineTo(bodyRect.right - bodyRadius, bodyRect.top);
    path.conicTo(bodyRect.right, bodyRect.top, bodyRect.right,
        bodyRect.top + bodyRadius, 1);
    path.lineTo(bodyRect.right, bodyRect.bottom - bodyRadius);
    path.conicTo(bodyRect.right, bodyRect.bottom, bodyRect.right - bodyRadius,
        bodyRect.bottom, 1);
    path.lineTo(bodyRect.left + bodyRadius, bodyRect.bottom);
    path.conicTo(bodyRect.left, bodyRect.bottom, bodyRect.left,
        bodyRect.bottom - bodyRadius, 1);
    path.lineTo(bodyRect.left, bodyRect.top + bodyRadius);
    path.conicTo(bodyRect.left, bodyRect.top, bodyRect.left + bodyRadius,
        bodyRect.top, 1);
  }

  void _drawTopElement(Path path, Rect arrowRect, Rect bodyRect) {
    final centerX = arrowRect.left + arrowRect.width / 2;
    final tipY = arrowRect.top;
    final baseY = arrowRect.bottom;

    // Arrow
    path.moveTo(arrowRect.left, tipY);
    path.lineTo(centerX - arrowRadius, baseY - arrowRadius);
    path.quadraticBezierTo(
        centerX, baseY, centerX + arrowRadius, baseY - arrowRadius);
    path.lineTo(arrowRect.right, tipY);

    // Body
    path.lineTo(bodyRect.right - bodyRadius, bodyRect.bottom);
    path.conicTo(bodyRect.right, bodyRect.bottom, bodyRect.right,
        bodyRect.bottom - bodyRadius, 1);
    path.lineTo(bodyRect.right, bodyRect.top + bodyRadius);
    path.conicTo(bodyRect.right, bodyRect.top, bodyRect.right - bodyRadius,
        bodyRect.top, 1);
    path.lineTo(bodyRect.left + bodyRadius, bodyRect.top);
    path.conicTo(bodyRect.left, bodyRect.top, bodyRect.left,
        bodyRect.top + bodyRadius, 1);
    path.lineTo(bodyRect.left, bodyRect.bottom - bodyRadius);
    path.conicTo(bodyRect.left, bodyRect.bottom, bodyRect.left + bodyRadius,
        bodyRect.bottom, 1);
  }

  void _drawLeftElement(Path path, Rect arrowRect, Rect bodyRect) {
    final centerY = arrowRect.top + arrowRect.height / 2;

    // Arrow with radius
    path.moveTo(arrowRect.left, arrowRect.top);
    path.lineTo(arrowRect.right - arrowRadius, centerY - arrowRadius);
    path.quadraticBezierTo(
      arrowRect.right,
      centerY,
      arrowRect.right - arrowRadius,
      centerY + arrowRadius,
    );
    path.lineTo(arrowRect.left, arrowRect.bottom);

    // Body as is
    path.lineTo(bodyRect.right, bodyRect.bottom - bodyRadius);
    path.conicTo(bodyRect.right, bodyRect.bottom, bodyRect.right - bodyRadius,
        bodyRect.bottom, 1);
    path.lineTo(bodyRect.left + bodyRadius, bodyRect.bottom);
    path.conicTo(bodyRect.left, bodyRect.bottom, bodyRect.left,
        bodyRect.bottom - bodyRadius, 1);
    path.lineTo(bodyRect.left, bodyRect.top + bodyRadius);
    path.conicTo(bodyRect.left, bodyRect.top, bodyRect.left + bodyRadius,
        bodyRect.top, 1);
    path.lineTo(bodyRect.right - bodyRadius, bodyRect.top);
    path.conicTo(bodyRect.right, bodyRect.top, bodyRect.right,
        bodyRect.top + bodyRadius, 1);
  }

  void _drawRightElement(Path path, Rect arrowRect, Rect bodyRect) {
    final centerY = arrowRect.top + arrowRect.height / 2;

    // Arrow with radius
    path.moveTo(arrowRect.right, arrowRect.top);
    path.lineTo(arrowRect.left + arrowRadius, centerY - arrowRadius);
    path.quadraticBezierTo(
      arrowRect.left,
      centerY,
      arrowRect.left + arrowRadius,
      centerY + arrowRadius,
    );
    path.lineTo(arrowRect.right, arrowRect.bottom);

    // Body as is
    path.lineTo(bodyRect.left, bodyRect.bottom - bodyRadius);
    path.conicTo(bodyRect.left, bodyRect.bottom, bodyRect.left + bodyRadius,
        bodyRect.bottom, 1);
    path.lineTo(bodyRect.right - bodyRadius, bodyRect.bottom);
    path.conicTo(bodyRect.right, bodyRect.bottom, bodyRect.right,
        bodyRect.bottom - bodyRadius, 1);
    path.lineTo(bodyRect.right, bodyRect.top + bodyRadius);
    path.conicTo(bodyRect.right, bodyRect.top, bodyRect.right - bodyRadius,
        bodyRect.top, 1);
    path.lineTo(bodyRect.left + bodyRadius, bodyRect.top);
    path.conicTo(bodyRect.left, bodyRect.top, bodyRect.left,
        bodyRect.top + bodyRadius, 1);
  }
}
