import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:plant_app/const/constants.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final scanWindow = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 2),
      width: 250,
      height: 250,
    );
    CustomPaint(size: size, painter: _ScannerOverlayPainter(scanWindow));

    return Scaffold(
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            scanWindow: scanWindow,
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              print(barcode.rawValue);
            },
          ),
          CustomPaint(size: size, painter: _ScannerOverlayPainter(scanWindow)),
          IgnorePointer(
            child: Center(
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 3),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          // app bar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  // x button
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Constants.primaryColor.withValues(alpha: 0.1),
                    ),
                    child: const Icon(Icons.close, color: Colors.white),
                  ),
                ),
                // torch button
                Container(
                  width: 40.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    color: Constants.primaryColor.withValues(alpha: 0.1),
                  ),
                  child: IconButton(
                    onPressed: () {
                      cameraController.toggleTorch();
                      setState(() {});
                    },
                    icon: cameraController.torchEnabled
                        ? const Icon(Icons.flash_on)
                        : const Icon(Icons.flash_off),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlayPainter extends CustomPainter {
  final Rect scanRect;

  _ScannerOverlayPainter(this.scanRect);

  @override
  void paint(Canvas canvas, Size size) {
    final background = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final cutout = Path()
      ..addRRect(RRect.fromRectAndRadius(scanRect, const Radius.circular(12)));

    final overlayPath = Path.combine(
      PathOperation.difference,
      background,
      cutout,
    );

    final paint = Paint()..color = Colors.black.withValues(alpha: 0.6);

    canvas.drawPath(overlayPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
