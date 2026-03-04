import 'package:flutter/material.dart';

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bills = <BillItem>[
      BillItem(
        name: "Serin Johnson",
        phone: "65367829292",
        orderNo: 200,
        guestCount: 3,
        tokenNo: 123,
        amount: 1358.00,
      ),
      BillItem(
        name: "Serin Johnson",
        phone: "65367829292",
        orderNo: 200,
        guestCount: 3,
        tokenNo: 123,
        amount: 1358.00,
      ),
      BillItem(
        name: "Serin Johnson",
        phone: "65367829292",
        orderNo: 200,
        guestCount: 3,
        tokenNo: 123,
        amount: 1358.00,
      ),
      BillItem(
        name: "Serin Johnson",
        phone: "65367829292",
        orderNo: 200,
        guestCount: 3,
        tokenNo: 123,
        amount: 1358.00,
      ),
    ];

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
          "Bills",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
        itemCount: bills.length,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          final b = bills[index];

          return InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              // TODO: open bill details
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left icon circle
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD36A),
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: const Icon(
                      Icons.receipt_long,
                      color: Colors.black,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Middle content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Top row: name + right side mini info
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              b.name,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Spacer(),

                            Text(
                              "Gust : ${b.guestCount}",
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Phone
                        Row(
                          children: [
                            Text(
                              b.phone,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Spacer(),

                            Text(
                              "Gust : ${b.guestCount}",
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        // Bottom row: token + amount
                        Row(
                          children: [
                            Text(
                              "Token No : ${b.tokenNo}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              "₹ ${b.amount.toStringAsFixed(2)}",
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class BillItem {
  final String name;
  final String phone;
  final int orderNo;
  final int guestCount;
  final int tokenNo;
  final double amount;

  BillItem({
    required this.name,
    required this.phone,
    required this.orderNo,
    required this.guestCount,
    required this.tokenNo,
    required this.amount,
  });
}
