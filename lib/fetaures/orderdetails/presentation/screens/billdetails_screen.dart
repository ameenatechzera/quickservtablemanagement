import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_billdetails_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/cubit/billdetails/billdetails_cubit.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/screens/orderdetails_screen.dart';
import 'package:quickservtablemanagement/services/shared_preference_helper.dart';

class BillsScreen extends StatelessWidget {
  final int tableId;
  const BillsScreen({super.key, required this.tableId});

  @override
  Widget build(BuildContext context) {
    /// Call API when screen opens
    Future.microtask(() async {
      final helper = SharedPreferenceHelper();
      final int? userId = await helper.getUserId();
      final String currentDate = DateFormat(
        'yyyy-MM-dd',
      ).format(DateTime.now());
      context.read<BilldetailsCubit>().fetchBillDetails(
        FetchBillDetailsParameter(
          fromDate: currentDate,
          toDate: currentDate,
          userId: userId ?? 0,
          tableId: tableId,
          orderType: "dinein",
          branchId: 1,
        ),
      );
    });

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

      body: BlocBuilder<BilldetailsCubit, BilldetailsState>(
        builder: (context, state) {
          /// Loading
          if (state is BilldetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          /// Error
          if (state is BilldetailsError) {
            return Center(child: Text(state.message));
          }

          /// Loaded
          if (state is BilldetailsLoaded) {
            final bills = state.billDetails.data ?? [];

            if (bills.isEmpty) {
              return const Center(child: Text("No Bills Found"));
            }

            return ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: bills.length,
              separatorBuilder: (_, __) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final b = bills[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return OrderDetailsScreen(
                            tableId: tableId,
                            orderMasterId: b.orderMasterId!,
                          );
                        },
                      ),
                    );
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
                        /// Icon
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

                        /// Bill Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Name + Guest
                              Row(
                                children: [
                                  Text(
                                    b.customerName ?? 'No Name',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '${b.seatsUsed}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              /// Phone + Order
                              Row(
                                children: [
                                  Text(
                                    b.phoneNo ?? "No Phone",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "Order : ${b.orderNo ?? 0}",
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              /// Token + Amount
                              Row(
                                children: [
                                  Text(
                                    "Token No : ${b.tokens?.map((e) => e.tokenNo).join(", ") ?? ''}",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "₹ ${b.totalBillAmount ?? 0}",
                                    style: const TextStyle(
                                      fontSize: 13,
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
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
