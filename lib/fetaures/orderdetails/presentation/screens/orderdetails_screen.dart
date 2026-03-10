import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/fetch_ordermaster_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/finish_order_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/domain/parameters/print_parameter.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/cubit/ordermaster/ordermaster_cubit.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/screens/sale_screen.dart';

class OrderDetailsScreen extends StatelessWidget {
  final int? tableId;
  final int orderMasterId;
  const OrderDetailsScreen({
    super.key,
    required this.tableId,
    required this.orderMasterId,
  });
  @override
  Widget build(BuildContext context) {
    String orderNo = "";

    final String salesType = tableId == null ? "takeaway" : "dinein";

    /// Call API after screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<OrderMasterCubit>().fetchOrderMaster(
        FetchOrderMasterParameter(branchId: 1, orderMasterId: orderMasterId),
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
          "Order Details",
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
            child: BlocBuilder<OrderMasterCubit, OrderMasterState>(
              builder: (context, state) {
                if (state is OrderMasterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is OrderMasterError) {
                  return Center(child: Text(state.message));
                }

                if (state is OrderMasterLoaded) {
                  final order = state.order.details;

                  // Top Section Data
                  orderNo = order?.orderNo ?? "";
                  final customerName = order?.createdUser ?? "Guest";
                  // Order List Data
                  final orders = order?.orderDetails ?? [];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// Left Group (Table)
                          Row(
                            children: [
                              Icon(
                                Icons.table_restaurant_outlined,
                                size: 16,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 6),
                              Text(
                                tableId == null
                                    ? "Takeaway"
                                    : "Table - $tableId",
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
                            children: [
                              Icon(
                                Icons.inventory_2_outlined,
                                size: 16,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Order No : $orderNo",
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
                            children: [
                              Icon(
                                Icons.person_outline,
                                size: 16,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 6),
                              Text(
                                customerName,
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
                        child: orders.isEmpty
                            ? const Center(child: Text("No Orders Found"))
                            : ListView.separated(
                                itemCount: orders.length,
                                separatorBuilder: (_, __) =>
                                    const SizedBox(height: 12),
                                itemBuilder: (context, index) {
                                  final order = orders[index];
                                  return _orderCard(
                                    context,
                                    tokenNo: order.tokenNo ?? 0,
                                    orderNo: order.orderId.toString(),
                                    amount:
                                        double.tryParse(
                                          order.totalAmount ?? "0",
                                        ) ??
                                        0,
                                    onTap: () {},
                                    onPrint: () {},
                                    onMore: () {},
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
          ),

          // yellow + button (floating)
          Positioned(
            right: 18,
            bottom: 30,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return SaleScreen(
                          tableId: tableId,
                          tableName: '',
                          orderMasterId: orderMasterId,
                          orderNo: orderNo,
                        );
                      },
                    ),
                  );
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
                child: BlocConsumer<OrderMasterCubit, OrderMasterState>(
                  listener: (context, state) {
                    if (state is FinishOrderLoaded) {
                      context.read<OrderMasterCubit>().printPdf(
                        PrintParameter(
                          voucherType: "Sales",
                          masterId: state.response.details!.salesMasterId ?? 0,
                          noOfCopies: 2,
                          printerName: "HP-Laser-1010",
                          printStatus: true,
                          createdUser: "1",
                          branchId: 1,
                        ),
                      );
                    }

                    if (state is PrintPdfLoaded) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Bill Printed Successfully"),
                        ),
                      );
                    }

                    if (state is PrintPdfError) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(state.message)));
                    }
                  },
                  builder: (context, state) {
                    return InkWell(
                      onTap: () {
                        if (state is OrderMasterLoaded) {
                          final order = state.order.details;
                          final orders = order?.orderDetails ?? [];

                          final salesDetails = orders.map((e) {
                            return SalesDetail(
                              productCode: e.productCode,
                              productName: e.productName,
                              qty: e.qty,
                              unitId: e.unitId,
                              purchaseCost:
                                  double.tryParse(e.purchaseCost ?? "0") ?? 0,
                              salesRate:
                                  double.tryParse(e.salesRate ?? "0") ?? 0,
                              excludeRate:
                                  double.tryParse(e.excludeRate ?? "0") ?? 0,
                              subtotal: double.tryParse(e.subtotal ?? "0") ?? 0,
                              vatId: e.vatId,
                              vatAmount:
                                  double.tryParse(e.vatAmount ?? "0") ?? 0,
                              totalAmount:
                                  double.tryParse(e.totalAmount ?? "0") ?? 0,
                              conversionRate: 1,
                            );
                          }).toList();
                          final subTotal =
                              double.tryParse(order?.subTotal ?? "0") ?? 0;
                          final discountAmount =
                              double.tryParse(order?.discountAmount ?? "0") ??
                              0;
                          final vatAmount =
                              double.tryParse(order?.vatAmount ?? "0") ?? 0;
                          final grandTotal =
                              double.tryParse(order?.grandTotal ?? "0") ?? 0;

                          final cashLedgerId = order?.cashLedgerId ?? 0;
                          final cashAmount =
                              double.tryParse(order?.cashAmount ?? "0") ?? 0;

                          final cardLedgerID = order?.cardLedgerId ?? 0;
                          final cardAmount =
                              double.tryParse(order?.cardAmount ?? "0") ?? 0;

                          final creditAmount =
                              double.tryParse(order?.creditAmount ?? "0") ?? 0;

                          final ledgerId = order?.ledgerId ?? 0;
                          final branchId = order?.branchId ?? 1;

                          final invoiceDate = order?.orderDate ?? "";
                          final invoiceTime = order?.orderTime ?? "";

                          //final createdUser = order?.userId ?? 1;

                          final billTokenNo =
                              order?.orderDetails?.isNotEmpty == true
                              ? order!.orderDetails!.first.tokenNo
                              : 0;

                          context.read<OrderMasterCubit>().finishOrder(
                            FinishOrderParameter(
                              salesMasterId: 0,
                              orderMasterId: orderMasterId,
                              billStatus: 'Pending',
                              invoiceDate: invoiceDate,
                              invoiceTime: invoiceTime,
                              ledgerId: ledgerId,
                              subTotal: subTotal,
                              discountAmount: discountAmount,
                              vatAmount: vatAmount,
                              grandTotal: grandTotal,
                              cashLedgerId: cashLedgerId,
                              cashAmount: cashAmount,
                              cardLedgerID: cardLedgerID,
                              cardAmount: cardAmount,
                              creditAmount: creditAmount,
                              totalTax: vatAmount,
                              salesType: salesType,
                              billTokenNo: billTokenNo,
                              supplierId: 1,
                              cashierId: 1,
                              tableId: tableId,
                              branchId: branchId,
                              createdUser: '',
                              invoiceNoUpdate: '',
                              salesDetails: salesDetails,
                            ),
                          );
                        }
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
                    );
                  },
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
