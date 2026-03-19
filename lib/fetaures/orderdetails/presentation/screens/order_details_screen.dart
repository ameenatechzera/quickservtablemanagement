import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_orderdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/cubit/ordermaster/ordermaster_cubit.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int tokenId;
  final int branchId;
  final String orderNo;

  const OrderDetailsScreen({
    super.key,
    required this.tokenId,
    required this.branchId,
    required this.orderNo,
  });

  @override
  Widget build(BuildContext context) {
    /// API CALL
    context.read<OrderMasterCubit>().fetchOrderDetails(
      FetchOrderDetailsParameter(tokenId: tokenId, branchId: branchId),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Order Details",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),

      body: BlocConsumer<OrderMasterCubit, OrderMasterState>(
        listener: (context, state) {},

        builder: (context, state) {
          /// LOADING
          if (state is OrderDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          /// ERROR
          if (state is OrderDetailsError) {
            return Center(child: Text(state.message));
          }

          /// SUCCESS
          if (state is OrderDetailsLoaded) {
            final items = state.response.details ?? [];

            double total = 0;
            for (var item in items) {
              total += double.tryParse(item.totalamount ?? "0") ?? 0;
            }

            final tokenNo = items.isNotEmpty
                ? items.first.tokenno?.toString() ?? ""
                : "";

            return Column(
              children: [
                const SizedBox(height: 10),

                /// ORDER INFO
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order No: $orderNo",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "TokenNo: $tokenNo",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Total: ${total.toStringAsFixed(2)}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// TABLE HEADER
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "SNo",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Product",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Qty",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rate",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Total",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

                /// PRODUCT LIST
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];

                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 4),
                          ],
                        ),
                        child: Row(
                          children: [
                            /// SNO
                            SizedBox(
                              width: 40,
                              child: Center(child: Text("${index + 1}")),
                            ),

                            /// PRODUCT
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                child: Text(
                                  item.productname ?? "",

                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),

                            /// QTY
                            SizedBox(
                              width: 70,
                              child: Text("${item.qty ?? 0}"),
                            ),

                            /// RATE
                            SizedBox(
                              width: 70,
                              child: Text("${item.salesrate ?? 0}"),
                            ),

                            /// TOTAL
                            SizedBox(
                              width: 40,
                              child: Text(
                                "${item.totalamount ?? 0}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
