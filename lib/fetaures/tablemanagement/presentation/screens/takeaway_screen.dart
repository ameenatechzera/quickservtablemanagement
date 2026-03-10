import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/screens/orderdetails_screen.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/screens/sale_screen.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/presentation/cubit/table_cubit.dart';

class TakeawayScreen extends StatelessWidget {
  const TakeawayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Fetch API when screen loads
    context.read<TableCubit>().fetchTakeawayOrders();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),

          /// Running Orders Title
          const Text(
            "Running Orders",
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 6),
          const Divider(thickness: 2, color: Colors.orange),

          /// Orders List
          Expanded(
            child: BlocBuilder<TableCubit, TableState>(
              builder: (context, state) {
                /// Loading
                if (state is TakeawayOrderLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                /// Error
                if (state is TakeawayOrderError) {
                  return Center(child: Text(state.message));
                }

                /// Success
                if (state is TakeawayOrderLoaded) {
                  final orders = state.response.takeawayOrders ?? [];

                  if (orders.isEmpty) {
                    return const Center(child: Text("No running orders"));
                  }

                  return ListView.builder(
                    padding: const EdgeInsets.fromLTRB(8, 10, 8, 90),
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      final order = orders[index];
                      final orderMasterId = order.orderMasterId;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return OrderDetailsScreen(
                                  tableId: null,
                                  orderMasterId: orderMasterId!,
                                );
                              },
                            ),
                          );
                        },
                        child: _orderCard(
                          tokenNo: order.tokenNo ?? "",
                          customerName: order.customerName ?? "",
                          itemCount: order.phoneNo ?? "",
                          amount: "₹${order.grandTotal ?? "0"}",
                        ),
                      );
                    },
                  );
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),

      /// Add Button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return SaleScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }

  Widget _orderCard({
    required String tokenNo,
    required String customerName,
    required String itemCount,
    required String amount,
  }) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 8, right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xffeeeeee),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            /// Token Number
            Container(
              height: 34,
              width: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xfff2f7eb),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xff8cc27d), width: 1.2),
              ),
              child: Text(
                '#$tokenNo',
                style: const TextStyle(
                  color: Color(0xff63a84d),
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(width: 14),

            /// Name + Items
            Expanded(
              child: Column(
                children: [
                  Text(
                    customerName,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    itemCount,
                    style: const TextStyle(fontSize: 14, color: Colors.black45),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 14),

            /// Amount
            Text(
              amount,
              style: const TextStyle(
                color: Color(0xff5aa84c),
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
