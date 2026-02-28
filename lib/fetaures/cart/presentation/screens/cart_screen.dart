import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickservtablemanagement/fetaures/cart/presentation/widgets/cart_item.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final ValueNotifier<String> selectedPayment = ValueNotifier<String>('Cash');
  final ValueNotifier<double> multiCashAmount = ValueNotifier<double>(0);
  final ValueNotifier<double> multiCardAmount = ValueNotifier<double>(0);

  final ValueNotifier<List<_CartUiItem>> items =
      ValueNotifier<List<_CartUiItem>>([
        _CartUiItem(name: "Brost 4 Pcs", sub: "2 X 199", qty: 2, price: 398.00),
        _CartUiItem(name: "Brost 4 Pcs", sub: "2 X 199", qty: 2, price: 398.00),
        _CartUiItem(name: "Brost 4 Pcs", sub: "2 X 199", qty: 2, price: 398.00),
        _CartUiItem(name: "Brost 4 Pcs", sub: "2 X 199", qty: 2, price: 398.00),
      ]);

  double get subTotal {
    final list = items.value;
    return list.fold(0.0, (s, e) => s + (e.unitPrice * e.qty));
  }

  double get discount => 0.0;

  double get tax => 13.0; // UI dummy like screenshot

  double get total => subTotal - discount + tax;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: ValueListenableBuilder<List<_CartUiItem>>(
        valueListenable: items,
        builder: (context, list, _) {
          if (list.isEmpty) {
            return const Center(child: Text("Your cart is empty"));
          }
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            itemCount: list.length,
            itemBuilder: (context, index) {
              //final item = list[index];
              return CartItemRow(
                index: index + 1,

                onMinus: () {
                  final newList = List<_CartUiItem>.from(items.value);
                  final q = newList[index].qty;
                  if (q > 1) {
                    newList[index] = newList[index].copyWith(qty: q - 1);
                    items.value = newList;
                  }
                },
                onPlus: () {
                  final newList = List<_CartUiItem>.from(items.value);
                  final q = newList[index].qty;
                  newList[index] = newList[index].copyWith(qty: q + 1);
                  items.value = newList;
                },
                onDelete: () {
                  final newList = List<_CartUiItem>.from(items.value);
                  newList.removeAt(index);
                  items.value = newList;
                },
                productName: 'Product',
                qty: 2,
                salesRate: 2,
                totalPrice: 2,
              );
            },
          );
        },
      ),
      bottomNavigationBar: ValueListenableBuilder<List<_CartUiItem>>(
        valueListenable: items,
        builder: (context, list, _) {
          if (list.isEmpty) return const SizedBox.shrink();

          return Container(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ✅ Summary box (same style)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      summaryRow(
                        "Sub Total :",
                        "₹ ${subTotal.toStringAsFixed(2)}",
                      ),
                      const SizedBox(height: 8),
                      summaryRow(
                        "Discount :",
                        "₹ ${discount.toStringAsFixed(2)}",
                      ),
                      const SizedBox(height: 8),
                      summaryRow("Tax :", "₹ ${tax.toStringAsFixed(2)}"),
                      const SizedBox(height: 10),
                      const Divider(height: 8),
                      const SizedBox(height: 8),
                      summaryRow(
                        "Total :",
                        "₹ ${total.toStringAsFixed(2)}",
                        isBold: true,
                        bigValue: true,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 14),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Payment",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),

                const SizedBox(height: 10),

                ValueListenableBuilder<String>(
                  valueListenable: selectedPayment,
                  builder: (context, payment, _) {
                    return Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              multiCashAmount.value = 0;
                              multiCardAmount.value = 0;
                              selectedPayment.value = "Cash";
                            },
                            child: PaymentOption(
                              title: "Cash",
                              selected: payment == "Cash",
                              amountText: "₹ 100.00",
                              icon: Icons.account_balance_wallet_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              multiCashAmount.value = 0;
                              multiCardAmount.value = 0;
                              selectedPayment.value = "Card";
                            },
                            child: PaymentOption(
                              title: "Card",
                              selected: payment == "Card",
                              amountText: "",
                              icon: Icons.credit_card_outlined,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              final prev = selectedPayment.value;
                              _showMultiPaymentModal(
                                context,
                                total: total,
                                prevPayment: prev,
                                onCancel: () => selectedPayment.value = prev,
                                onOk: () => selectedPayment.value = "Multi",
                              );
                            },
                            child: ValueListenableBuilder<double>(
                              valueListenable: multiCashAmount,
                              builder: (context, cash, _) {
                                return ValueListenableBuilder<double>(
                                  valueListenable: multiCardAmount,
                                  builder: (context, card, __) {
                                    final sub = (cash == 0 && card == 0)
                                        ? ""
                                        : "Cash ${cash.toStringAsFixed(0)} | Card ${card.toStringAsFixed(0)}";
                                    return PaymentOption(
                                      title: "Multi",
                                      selected: payment == "Multi",
                                      amountText: sub,
                                      icon: Icons.dashboard_customize_outlined,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 14),

                // ✅ Confirm button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEAB307),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      // UI only
                    },
                    child: const Text(
                      "Confirm Sale",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ===== Multi Payment UI bottom sheet (UI only) =====
  void _showMultiPaymentModal(
    BuildContext context, {
    required double total,
    required String prevPayment,
    required VoidCallback onCancel,
    required VoidCallback onOk,
  }) {
    final bool wasMulti = prevPayment == "Multi";

    final double initialCash = wasMulti
        ? multiCashAmount.value
        : (prevPayment == "Cash" ? total : 0);

    final double initialCard = wasMulti
        ? multiCardAmount.value
        : (prevPayment == "Card" ? total : 0);

    double tempCash = initialCash;
    double tempCard = initialCard;

    final cashCtrl = TextEditingController(
      text: initialCash == 0 ? "" : initialCash.toStringAsFixed(2),
    );
    final cardCtrl = TextEditingController(
      text: initialCard == 0 ? "" : initialCard.toStringAsFixed(2),
    );

    bool isAutoUpdating = false;
    bool closedByButton = false;

    double _parse(String v) => double.tryParse(v.trim()) ?? 0;

    void _setText(TextEditingController c, double value) {
      final t = value == 0 ? "" : value.toStringAsFixed(2);
      c.value = TextEditingValue(
        text: t,
        selection: TextSelection.collapsed(offset: t.length),
      );
    }

    TextInputFormatter _maxTotalFormatter(double total) {
      return TextInputFormatter.withFunction((oldValue, newValue) {
        final t = newValue.text.trim();
        if (t.isEmpty) return newValue;
        if (t == ".") return newValue;

        final v = double.tryParse(t);
        if (v == null) return oldValue;
        if (v > total) return oldValue;

        return newValue;
      });
    }

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            if (!closedByButton) onCancel();
            return true;
          },
          child: Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 16,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Multi Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Total: ₹ ${total.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const SizedBox(width: 140, child: Text("Cash")),
                    Expanded(
                      child: TextField(
                        controller: cashCtrl,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}$'),
                          ),
                          _maxTotalFormatter(total),
                        ],
                        decoration: InputDecoration(
                          hintText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (v) {
                          if (isAutoUpdating) return;
                          isAutoUpdating = true;

                          final cash = _parse(v);
                          final card = total - cash;

                          tempCash = cash;
                          tempCard = card;

                          _setText(cardCtrl, card);

                          isAutoUpdating = false;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const SizedBox(width: 140, child: Text("Card")),
                    Expanded(
                      child: TextField(
                        controller: cardCtrl,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                            RegExp(r'^\d*\.?\d{0,2}$'),
                          ),
                          _maxTotalFormatter(total),
                        ],
                        decoration: InputDecoration(
                          hintText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onChanged: (v) {
                          if (isAutoUpdating) return;
                          isAutoUpdating = true;

                          final card = _parse(v);
                          final cash = total - card;

                          tempCard = card;
                          tempCash = cash;

                          _setText(cashCtrl, cash);

                          isAutoUpdating = false;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          closedByButton = true;
                          onCancel();
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEAB307),
                          foregroundColor: Colors.black,
                        ),
                        onPressed: () {
                          closedByButton = true;
                          multiCashAmount.value = tempCash;
                          multiCardAmount.value = tempCard;
                          onOk();
                          Navigator.pop(context);
                        },
                        child: const Text("OK"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ).whenComplete(() {
      if (!closedByButton) onCancel();
    });
  }
}

// =======================
// UI widgets (UI only)
// =======================

class _CartUiItem {
  final String name;
  final String sub;
  final int qty;
  final double price; // optional
  final double unitPrice;

  _CartUiItem({
    required this.name,
    required this.sub,
    required this.qty,
    required this.price,
  }) : unitPrice = _safeUnit(price, qty);

  static double _safeUnit(double total, int qty) {
    if (qty <= 0) return 0;
    return total / qty;
  }

  _CartUiItem copyWith({int? qty}) {
    final newQty = qty ?? this.qty;
    final newTotal = unitPrice * newQty;
    return _CartUiItem(name: name, sub: sub, qty: newQty, price: newTotal);
  }
}

/// ✅ summaryRow UI (same look)
Widget summaryRow(
  String title,
  String value, {
  bool isBold = false,
  bool bigValue = false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      Text(
        value,
        style: TextStyle(
          fontSize: bigValue ? 20 : 13,
          fontWeight: isBold ? FontWeight.w800 : FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    ],
  );
}

/// ✅ PaymentOption UI (same style like screenshot)
class PaymentOption extends StatelessWidget {
  final String title;
  final bool selected;
  final String amountText; // can be "", or "₹ 100.00", or "Cash 50 | Card 50"
  final IconData icon;

  const PaymentOption({
    super.key,
    required this.title,
    required this.selected,
    required this.amountText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? Colors.black : const Color(0xFFF7F7F7);
    final fg = selected ? Colors.white : Colors.black87;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Icon(icon, color: fg, size: 22),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            amountText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: fg,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
