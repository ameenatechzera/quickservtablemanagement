import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int tableId;
  // final int orderMasterId;
  const OrderDetailsScreen({
    super.key,
    required this.tableId,
    // required this.orderMasterId,
  });

  @override
  Widget build(BuildContext context) {
    // dummy list (replace with your API data)
    final items = List.generate(
      5,
      (i) => _OrderItem(tokenNo: 123, orderNo: "00023", amount: 0.00),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Order# 200",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        centerTitle: false,
      ),

      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Left Group (Table)
                    Row(
                      children: const [
                        Icon(
                          Icons.table_restaurant_outlined,
                          size: 16,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Table -1",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    /// Middle Group (Order)
                    Row(
                      children: const [
                        Icon(
                          Icons.inventory_2_outlined,
                          size: 16,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Order No : 200",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),

                    /// Right Group (Customer)
                    Row(
                      children: const [
                        Icon(
                          Icons.person_outline,
                          size: 16,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Shamil Mk",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                const Text(
                  "Order Details",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 12),

                Expanded(
                  child: ListView.separated(
                    itemCount: items.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final it = items[index];
                      return _orderCard(
                        context,
                        tokenNo: it.tokenNo,
                        orderNo: it.orderNo,
                        amount: it.amount,
                        onTap: () {},
                        onPrint: () {},
                        onMore: () {},
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // yellow + button (floating)
          Positioned(
            right: 18,
            bottom: 92,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: add item
                },
                borderRadius: BorderRadius.circular(28),
                child: Container(
                  height: 54,
                  width: 54,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAB307),
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, size: 28, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),

      // bottom actions
      bottomNavigationBar: SafeArea(
        top: false,
        child: Container(
          height: 60,
          decoration: const BoxDecoration(color: Colors.white),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    // TODO: cancel order
                  },
                  child: Container(
                    color: const Color(0xFFF2F2F2),
                    alignment: Alignment.center,
                    child: const Text(
                      "Cancel Order",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    // TODO: finish order
                  },
                  child: Container(
                    color: const Color(0xFFEAB307),
                    alignment: Alignment.center,
                    child: const Text(
                      "Finish Order",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderCard(
    BuildContext context, {
    required int tokenNo,
    required String orderNo,
    required double amount,
    required VoidCallback onTap,
    required VoidCallback onPrint,
    required VoidCallback onMore,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),

        /// LEFT ICON
        leading: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: const Color(0xFFFFD36A),
            borderRadius: BorderRadius.circular(22),
          ),
          child: const Icon(
            Icons.confirmation_number_outlined,
            color: Colors.black,
            size: 22,
          ),
        ),

        /// TITLE
        title: Text(
          "Token No : $tokenNo",
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),

        /// SUBTITLE
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            "Order No : $orderNo",
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Colors.black54,
            ),
          ),
        ),

        /// RIGHT SIDE
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              amount.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: onPrint,
              child: const Icon(
                Icons.print_outlined,
                size: 20,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItem {
  final int tokenNo;
  final String orderNo;
  final double amount;

  _OrderItem({
    required this.tokenNo,
    required this.orderNo,
    required this.amount,
  });
}
