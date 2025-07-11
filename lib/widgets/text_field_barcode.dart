import 'package:audioplayers/audioplayers.dart';
import 'package:chnan/utils/const.dart';
import 'package:chnan/widgets/text_field_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class TextFieldBaracode extends StatefulWidget {
  const TextFieldBaracode({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextFieldBaracode> createState() => _TextFieldBaracodeState();
}

class _TextFieldBaracodeState extends State<TextFieldBaracode> {
  bool showScanner = false;
  final MobileScannerController scannerController = MobileScannerController();
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // دعم قارئ USB (يكتب داخل الحقل)
    widget.controller.addListener(() {
      final text = widget.controller.text.trim();
      if (text.length >= 5 && text.endsWith('\n')) {
        _onBarcodeDetected(text.trim());
      }
    });
  }

  void _toggleScanner() {
    setState(() {
      showScanner = !showScanner;
    });
  }

  void _onBarcodeDetected(String code) {
    widget.controller.text = code;
    _playBeepSound();
    scannerController.stop();
    setState(() {
      showScanner = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldAndDetails(
          focusNode: FocusNode(),
          icon: IconButton(
            onPressed: _toggleScanner,
            icon: Icon(FontAwesomeIcons.barcode, size: 20, color: kAppColor),
          ),
          controller: widget.controller,
          hintText: 'الباركود',
        ),
        if (showScanner && !kIsWeb) // لا تعرض الماسح إذا كنا على الويب
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              child: MobileScanner(
                controller: scannerController,
                onDetect: (capture) {
                  final String? code = capture.barcodes.first.rawValue;
                  if (code != null && code.isNotEmpty) {
                    _onBarcodeDetected(code);
                  }
                },
              ),
            ),
          ),
      ],
    );
  }

  Future<void> _playBeepSound() async {
    await _audioPlayer.play(AssetSource('sounds/beep.mp3'));
  }
}
