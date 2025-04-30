import 'package:flutter/painting.dart';

import 'popover_direction.dart';

final class PopoverPath {
  final double arrowRadius;

  const PopoverPath(this.arrowRadius);

  Path draw(
    PopoverDirection? direction,
    Rect? arrowRect,
    Rect bodyRect,
  ) {
    final path = Path();

    if (arrowRect != null) {
      if (direction == PopoverDirection.top) {
        _drawTopElement(path, arrowRect, bodyRect);
      } else if (direction == PopoverDirection.right) {
        _drawRightElement(path, arrowRect, bodyRect);
      } else if (direction == PopoverDirection.left) {
        _drawLeftElement(path, arrowRect, bodyRect);
      } else {
        _drawBottomElementWithRoundedArrow(
          path,
          arrowRect,
          bodyRect,
        );
      }
      path.close();
      return path;
    } else {
      path.close();
      return path;
    }
  }

  void _drawBottomElementWithRoundedArrow(
      Path path, Rect arrowRect, Rect bodyRect) {
    final centerX = arrowRect.left + arrowRect.width / 2;
    final tipY = arrowRect.top;
    final baseY = arrowRect.bottom;
    // final cornerarrowRadius = 6.0;

    path.moveTo(arrowRect.left, baseY);
    path.lineTo(centerX - arrowRadius, tipY + arrowRadius);

    path.quadraticBezierTo(
      centerX,
      tipY,
      centerX + arrowRadius,
      tipY + arrowRadius,
    );

    path.lineTo(arrowRect.right, baseY);

    path.close();

    path.lineTo(bodyRect.right - arrowRadius!, bodyRect.top);
    path.conicTo(
      bodyRect.right,
      bodyRect.top,
      bodyRect.right,
      bodyRect.top + arrowRadius,
      1,
    );

    path.lineTo(bodyRect.right, bodyRect.bottom - arrowRadius);
    path.conicTo(
      bodyRect.right,
      bodyRect.bottom,
      bodyRect.right - arrowRadius,
      bodyRect.bottom,
      1,
    );

    path.lineTo(bodyRect.left + arrowRadius, bodyRect.bottom);
    path.conicTo(
      bodyRect.left,
      bodyRect.bottom,
      bodyRect.left,
      bodyRect.bottom - arrowRadius,
      1,
    );

    path.lineTo(bodyRect.left, bodyRect.top + arrowRadius);
    path.conicTo(
      bodyRect.left,
      bodyRect.top,
      bodyRect.left + arrowRadius,
      bodyRect.top,
      1,
    );
  }

  void _drawLeftElement(Path path, Rect arrowRect, Rect bodyRect) {
    path.moveTo(arrowRect.left, arrowRect.top);
    path.lineTo(arrowRect.right, arrowRect.top + arrowRect.height / 2);
    path.lineTo(arrowRect.left, arrowRect.bottom);

    path.lineTo(bodyRect.right, bodyRect.bottom - arrowRadius);
    path.conicTo(
      bodyRect.right,
      bodyRect.bottom,
      bodyRect.right - arrowRadius,
      bodyRect.bottom,
      1,
    );

    path.lineTo(bodyRect.left + arrowRadius, bodyRect.bottom);
    path.conicTo(
      bodyRect.left,
      bodyRect.bottom,
      bodyRect.left,
      bodyRect.bottom - arrowRadius,
      1,
    );

    path.lineTo(bodyRect.left, bodyRect.top + arrowRadius);
    path.conicTo(
      bodyRect.left,
      bodyRect.top,
      bodyRect.left + arrowRadius,
      bodyRect.top,
      1,
    );

    path.lineTo(bodyRect.right - arrowRadius, bodyRect.top);
    path.conicTo(
      bodyRect.right,
      bodyRect.top,
      bodyRect.right,
      bodyRect.top + arrowRadius,
      1,
    );
  }

  void _drawRightElement(Path path, Rect arrowRect, Rect bodyRect) {
    path.moveTo(arrowRect.right, arrowRect.top);
    path.lineTo(arrowRect.left, arrowRect.top + arrowRect.height / 2);
    path.lineTo(arrowRect.right, arrowRect.bottom);

    path.lineTo(bodyRect.left, bodyRect.bottom - arrowRadius);
    path.conicTo(
      bodyRect.left,
      bodyRect.bottom,
      bodyRect.left + arrowRadius,
      bodyRect.bottom,
      1,
    );

    path.lineTo(bodyRect.right - arrowRadius, bodyRect.bottom);
    path.conicTo(
      bodyRect.right,
      bodyRect.bottom,
      bodyRect.right,
      bodyRect.bottom - arrowRadius,
      1,
    );

    path.lineTo(bodyRect.right, bodyRect.top + arrowRadius);
    path.conicTo(
      bodyRect.right,
      bodyRect.top,
      bodyRect.right - arrowRadius,
      bodyRect.top,
      1,
    );

    path.lineTo(bodyRect.left + arrowRadius, bodyRect.top);
    path.conicTo(
      bodyRect.left,
      bodyRect.top,
      bodyRect.left,
      bodyRect.top + arrowRadius,
      1,
    );
  }

  void _drawTopElement(Path path, Rect arrowRect, Rect bodyRect) {
    final centerX = arrowRect.left + arrowRect.width / 2;
    final tipY = arrowRect.top;
    final baseY = arrowRect.bottom;

    path.moveTo(arrowRect.left, tipY);
    path.lineTo(centerX - arrowRadius, baseY - arrowRadius);

    path.quadraticBezierTo(
      centerX,
      baseY,
      centerX + arrowRadius,
      baseY - arrowRadius,
    );

    path.lineTo(arrowRect.right, tipY);

    path.close();

    path.lineTo(bodyRect.right - arrowRadius, bodyRect.bottom);
    path.conicTo(
      bodyRect.right,
      bodyRect.bottom,
      bodyRect.right,
      bodyRect.bottom - arrowRadius,
      1,
    );

    path.lineTo(bodyRect.right, bodyRect.top + arrowRadius);
    path.conicTo(
      bodyRect.right,
      bodyRect.top,
      bodyRect.right - arrowRadius,
      bodyRect.top,
      1,
    );

    path.lineTo(bodyRect.left + arrowRadius, bodyRect.top);
    path.conicTo(
      bodyRect.left,
      bodyRect.top,
      bodyRect.left,
      bodyRect.top + arrowRadius,
      1,
    );

    path.lineTo(bodyRect.left, bodyRect.bottom - arrowRadius);
    path.conicTo(
      bodyRect.left,
      bodyRect.bottom,
      bodyRect.left + arrowRadius,
      bodyRect.bottom,
      1,
    );
  }
}
