import 'package:flutter/material.dart';
import 'package:quickservtablemanagement/core/theme/colors.dart';

/// ✅ UI ONLY version of CartItemRow
/// - Same UI
/// - No CartManager
/// - You pass callbacks from parent
class CartItemRow extends StatelessWidget {
  final int index;
  final String productName;
  final int qty;
  final double salesRate;
  final double totalPrice;

  final VoidCallback? onMinus;
  final VoidCallback? onPlus;
  final VoidCallback? onDelete;

  const CartItemRow({
    super.key,
    required this.index,
    required this.productName,
    required this.qty,
    required this.salesRate,
    required this.totalPrice,
    this.onMinus,
    this.onPlus,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: index.isOdd ? AppColors.white : const Color(0xFFF6F6F6),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$index.', style: const TextStyle(fontSize: 13)),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '$qty x  ${salesRate.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 35,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300, width: 1.4),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: onMinus,
                  child: const Icon(Icons.remove, size: 18),
                ),
                const SizedBox(width: 10),
                Text(
                  qty.toString().padLeft(2, '0'),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onPlus,
                  child: const Icon(Icons.add, size: 18),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            totalPrice.toStringAsFixed(2),
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onDelete,
            child: const Icon(Icons.close, color: AppColors.red, size: 20),
          ),
        ],
      ),
    );
  }
}
