import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

/// Hand-painted icon set matching the exact SVG paths used in
/// `doc/design/Oasis policyholder mobile app/Oasis Policyholder App.dc.html`
/// (bottom-nav glyphs, policy-type glyphs, document/camera/gallery, bell,
/// check-circle) — pixel-accurate rather than approximated with the closest
/// Material icon.
class DsIcon {
  const DsIcon._();

  static Widget home({bool active = false, double size = 22}) => _painted(
        size,
        _HomeIconPainter(active ? AppColors.primary : AppColors.textHint),
      );

  static Widget document({bool active = false, double size = 22}) => _painted(
        size,
        _DocumentIconPainter(active ? AppColors.primary : AppColors.textHint),
      );

  static Widget claim({bool active = false, double size = 22}) => _painted(
        size,
        _StarIconPainter(active ? AppColors.primary : AppColors.textHint),
      );

  static Widget profile({bool active = false, double size = 22}) => _painted(
        size,
        _ProfileIconPainter(active ? AppColors.primary : AppColors.textHint),
      );

  static Widget motor({Color? color, double size = 20}) =>
      _painted(size, _MotorIconPainter(color ?? AppColors.primary));

  static Widget property({Color? color, double size = 20}) =>
      _painted(size, _PropertyIconPainter(color ?? AppColors.primary));

  static Widget medical({Color? color, double size = 20}) =>
      _painted(size, _MedicalIconPainter(color ?? AppColors.primary));

  static Widget file({Color? color, double size = 18}) =>
      _painted(size, _FileIconPainter(color ?? AppColors.textHint));

  static Widget camera({Color? color, double size = 24}) =>
      _painted(size, _CameraIconPainter(color ?? AppColors.primary));

  static Widget gallery({Color? color, double size = 24}) =>
      _painted(size, _GalleryIconPainter(color ?? AppColors.primary));

  static Widget bell({Color? color, double size = 22}) =>
      _painted(size, _BellIconPainter(color ?? Colors.white));

  static Widget checkCircle({Color? color, double size = 20}) =>
      _painted(size, _CheckCircleIconPainter(color ?? AppColors.primary));

  static Widget _painted(double size, CustomPainter painter) {
    final s = size.w;
    return SizedBox(
      width: s,
      height: s,
      child: CustomPaint(painter: painter),
    );
  }
}

Paint _stroke(Color color, {double width = 1.7}) => Paint()
  ..color = color
  ..style = PaintingStyle.stroke
  ..strokeWidth = width
  ..strokeCap = StrokeCap.round
  ..strokeJoin = StrokeJoin.round;

/// All paths below are drawn against a 24×24 viewBox, scaled to the
/// widget's actual size.
abstract class _ViewBoxPainter extends CustomPainter {
  const _ViewBoxPainter();

  void paintAt(Canvas canvas, Paint paint);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 24, size.height / 24);
    paintAt(canvas, _paint);
    canvas.restore();
  }

  Paint get _paint;

  @override
  bool shouldRepaint(covariant _ViewBoxPainter oldDelegate) => false;
}

class _HomeIconPainter extends _ViewBoxPainter {
  final Color color;
  const _HomeIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.8);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(4, 11.5)
      ..lineTo(12, 4)
      ..lineTo(20, 11.5)
      ..lineTo(20, 20)
      ..cubicTo(20, 20.55, 19.55, 21, 19, 21)
      ..lineTo(15, 21)
      ..lineTo(15, 15)
      ..lineTo(9, 15)
      ..lineTo(9, 21)
      ..lineTo(5, 21)
      ..cubicTo(4.45, 21, 4, 20.55, 4, 20)
      ..close();
    canvas.drawPath(path, paint);
  }
}

class _DocumentIconPainter extends _ViewBoxPainter {
  final Color color;
  const _DocumentIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.8);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final body = Path()
      ..moveTo(6, 3)
      ..lineTo(15, 3)
      ..lineTo(19, 7)
      ..lineTo(19, 20)
      ..cubicTo(19, 20.55, 18.55, 21, 18, 21)
      ..lineTo(6, 21)
      ..cubicTo(5.45, 21, 5, 20.55, 5, 20)
      ..lineTo(5, 4)
      ..cubicTo(5, 3.45, 5.45, 3, 6, 3)
      ..close();
    canvas.drawPath(body, paint);
    canvas.drawLine(const Offset(9, 12), const Offset(15, 12), paint);
    canvas.drawLine(const Offset(9, 16), const Offset(15, 16), paint);
  }
}

class _StarIconPainter extends _ViewBoxPainter {
  final Color color;
  const _StarIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.8);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(12, 2)
      ..lineTo(14.6, 7.3)
      ..lineTo(20.5, 8.2)
      ..lineTo(16.3, 12.3)
      ..lineTo(17.3, 18.1)
      ..lineTo(12, 15.3)
      ..lineTo(6.7, 18.1)
      ..lineTo(7.7, 12.3)
      ..lineTo(3.5, 8.2)
      ..lineTo(9.4, 7.3)
      ..close();
    canvas.drawPath(path, paint);
  }
}

class _ProfileIconPainter extends _ViewBoxPainter {
  final Color color;
  const _ProfileIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.8);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    canvas.drawCircle(const Offset(12, 8), 3.5, paint);
    final path = Path()
      ..moveTo(4.5, 20)
      ..cubicTo(5.7, 16.2, 8.7, 14.5, 12, 14.5)
      ..cubicTo(15.3, 14.5, 18.3, 16.2, 19.5, 20);
    canvas.drawPath(path, paint);
  }
}

class _MotorIconPainter extends _ViewBoxPainter {
  final Color color;
  const _MotorIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.7);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final body = Path()
      ..moveTo(5, 16)
      ..lineTo(6.2, 11.2)
      ..cubicTo(6.4, 10.4, 7.2, 9.7, 8.1, 9.7)
      ..lineTo(15.9, 9.7)
      ..cubicTo(16.8, 9.7, 17.6, 10.4, 17.8, 11.2)
      ..lineTo(19, 16)
      ..moveTo(5, 16)
      ..lineTo(19, 16)
      ..lineTo(19, 19)
      ..cubicTo(19, 19.55, 18.55, 20, 18, 20)
      ..lineTo(17, 20)
      ..cubicTo(16.45, 20, 16, 19.55, 16, 19)
      ..lineTo(16, 18)
      ..lineTo(8, 18)
      ..lineTo(8, 19)
      ..cubicTo(8, 19.55, 7.55, 20, 7, 20)
      ..lineTo(6, 20)
      ..cubicTo(5.45, 20, 5, 19.55, 5, 19)
      ..close();
    canvas.drawPath(body, paint);
    canvas.drawCircle(const Offset(7.5, 16), 1.1, paint..style = PaintingStyle.fill);
    canvas.drawCircle(const Offset(16.5, 16), 1.1, paint);
  }
}

class _PropertyIconPainter extends _ViewBoxPainter {
  final Color color;
  const _PropertyIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.7);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(6, 21)
      ..lineTo(6, 6)
      ..cubicTo(6, 5.45, 6.45, 5, 7, 5)
      ..lineTo(17, 5)
      ..cubicTo(17.55, 5, 18, 5.45, 18, 6)
      ..lineTo(18, 21)
      ..moveTo(9, 21)
      ..lineTo(9, 17)
      ..lineTo(15, 17)
      ..lineTo(15, 21);
    canvas.drawPath(path, paint);
    for (final dx in [9.0, 14.0]) {
      canvas.drawLine(Offset(dx, 9), Offset(dx + 1, 9), paint);
      canvas.drawLine(Offset(dx, 13), Offset(dx + 1, 13), paint);
    }
  }
}

class _MedicalIconPainter extends _ViewBoxPainter {
  final Color color;
  const _MedicalIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.7);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    canvas.drawCircle(const Offset(12, 12), 9, paint);
    canvas.drawLine(const Offset(12, 8), const Offset(12, 16), paint);
    canvas.drawLine(const Offset(8, 12), const Offset(16, 12), paint);
  }
}

class _FileIconPainter extends _ViewBoxPainter {
  final Color color;
  const _FileIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.6);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(7, 3)
      ..lineTo(14, 3)
      ..lineTo(18, 7)
      ..lineTo(18, 21)
      ..cubicTo(18, 21.55, 17.55, 22, 17, 22)
      ..lineTo(7, 22)
      ..cubicTo(6.45, 22, 6, 21.55, 6, 21)
      ..lineTo(6, 4)
      ..cubicTo(6, 3.45, 6.45, 3, 7, 3)
      ..close()
      ..moveTo(14, 3)
      ..lineTo(14, 7)
      ..lineTo(18, 7);
    canvas.drawPath(path, paint);
  }
}

class _CameraIconPainter extends _ViewBoxPainter {
  final Color color;
  const _CameraIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.6);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(4, 8)
      ..lineTo(7, 8)
      ..lineTo(8.5, 6)
      ..lineTo(15.5, 6)
      ..lineTo(17, 8)
      ..lineTo(20, 8)
      ..cubicTo(20.55, 8, 21, 8.45, 21, 9)
      ..lineTo(21, 18)
      ..cubicTo(21, 18.55, 20.55, 19, 20, 19)
      ..lineTo(4, 19)
      ..cubicTo(3.45, 19, 3, 18.55, 3, 18)
      ..lineTo(3, 9)
      ..cubicTo(3, 8.45, 3.45, 8, 4, 8)
      ..close();
    canvas.drawPath(path, paint);
    canvas.drawCircle(const Offset(12, 13), 3.4, paint);
  }
}

class _GalleryIconPainter extends _ViewBoxPainter {
  final Color color;
  const _GalleryIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.6);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        const Rect.fromLTWH(4, 5, 16, 14),
        const Radius.circular(2),
      ),
      paint,
    );
    canvas.drawCircle(
      const Offset(9, 10),
      1.4,
      paint..style = PaintingStyle.fill,
    );
    final trail = Path()
      ..moveTo(5, 17)
      ..lineTo(9.5, 12.5)
      ..lineTo(12.5, 15.5)
      ..lineTo(17, 10)
      ..lineTo(20, 15);
    canvas.drawPath(trail, paint..style = PaintingStyle.stroke);
  }
}

class _BellIconPainter extends _ViewBoxPainter {
  final Color color;
  const _BellIconPainter(this.color);

  @override
  Paint get _paint => _stroke(color, width: 1.7);

  @override
  void paintAt(Canvas canvas, Paint paint) {
    final path = Path()
      ..moveTo(6, 9)
      ..cubicTo(6, 5.7, 8.7, 3, 12, 3)
      ..cubicTo(15.3, 3, 18, 5.7, 18, 9)
      ..cubicTo(18, 13, 19.5, 14.5, 19.5, 14.5)
      ..lineTo(4.5, 14.5)
      ..cubicTo(4.5, 14.5, 6, 13, 6, 9)
      ..close();
    canvas.drawPath(path, paint..style = PaintingStyle.stroke);
    final clapper = Path()
      ..moveTo(9.5, 17)
      ..cubicTo(9.5, 18.4, 10.6, 19.5, 12, 19.5)
      ..cubicTo(13.4, 19.5, 14.5, 18.4, 14.5, 17);
    canvas.drawPath(clapper, paint);
  }
}

class _CheckCircleIconPainter extends _ViewBoxPainter {
  final Color color;
  const _CheckCircleIconPainter(this.color);

  @override
  Paint get _paint => Paint()..color = color;

  @override
  void paintAt(Canvas canvas, Paint paint) {
    canvas.drawCircle(const Offset(12, 12), 9, paint..style = PaintingStyle.fill);
    final check = Path()
      ..moveTo(8, 12.5)
      ..lineTo(10.5, 15)
      ..lineTo(16, 9.5);
    canvas.drawPath(
      check,
      Paint()
        ..color = Colors.white
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );
  }
}
