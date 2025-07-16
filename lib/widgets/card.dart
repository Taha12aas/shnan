import 'package:flutter/material.dart';
import 'package:chnan/utils/const.dart';

class QuantityInput extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onQuantityChanged;
  final String itemName;
  final VoidCallback onDelete;

  const QuantityInput({
    super.key,
    this.initialQuantity = 1,
    required this.onQuantityChanged,
    required this.itemName,
    required this.onDelete,
  });

  @override
  State<QuantityInput> createState() => _QuantityInputState();
}

class _QuantityInputState extends State<QuantityInput> {
  late int quantity;
  late TextEditingController _controller;
  bool _isEditingTextField = false;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
    _controller = TextEditingController(text: quantity.toString());
    _controller.addListener(() {
      if (_isEditingTextField) {
        final text = _controller.text;
        final parsed = int.tryParse(text);
        if (parsed != null && parsed >= 1) {
          quantity = parsed;
          widget.onQuantityChanged(quantity);
        }
      }
    });
  }

  void _updateQuantity(int newQuantity) {
    if (newQuantity < 1) return;
    setState(() {
      quantity = newQuantity;
      _controller.text = quantity.toString();
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    });
    widget.onQuantityChanged(quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.redAccent,
                  ),
                  onPressed: widget.onDelete,
                  tooltip: 'حذف المادة',
                ),
                Expanded(
                  child: Text(
                    widget.itemName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIconButton(
                  Icons.remove,
                  () => _updateQuantity(quantity - 1),
                ),
                const SizedBox(width: 12),
                _buildQuantityTextField(),
                const SizedBox(width: 12),
                _buildIconButton(
                  Icons.add,
                  () => _updateQuantity(quantity + 1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: kAppColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: Icon(icon, color: kAppColor, size: 24),
      ),
    );
  }

  Widget _buildQuantityTextField() {
    return SizedBox(
      width: 60,
      child: Focus(
        onFocusChange: (hasFocus) {
          _isEditingTextField = hasFocus;
          if (!hasFocus) {
            final parsed = int.tryParse(_controller.text);
            if (parsed == null || parsed < 1) {
              setState(() {
                _controller.text = quantity.toString();
              });
            } else {
              if (parsed != quantity) {
                setState(() {
                  quantity = parsed;
                });
                widget.onQuantityChanged(quantity);
              }
            }
          }
        },
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            contentPadding: const EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kAppColor.withOpacity(0.4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: kAppColor, width: 1.5),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
