import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickservtablemanagement/core/theme/colors.dart';
import 'package:quickservtablemanagement/fetaures/bills/presentation/screens/bill_screen.dart';
import 'package:quickservtablemanagement/fetaures/orderdetails/presentation/screens/orderdetails_screen.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/screens/sale_screen.dart';
import 'package:quickservtablemanagement/fetaures/settings/presentation/screens/settings_dashboard.dart';
import 'package:quickservtablemanagement/fetaures/tablemanagement/presentation/cubit/table_cubit.dart';

class TableHomescreen extends StatefulWidget {
  const TableHomescreen({super.key});

  @override
  State<TableHomescreen> createState() => _TableHomescreenState();
}

class _TableHomescreenState extends State<TableHomescreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<bool> isDineIn = ValueNotifier<bool>(true);
  final ValueNotifier<int> selectedBottomIndex = ValueNotifier<int>(0);

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<TableCubit>().fetchAllTables();
    });

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      if (_tabController.index == 0) {
        context.read<TableCubit>().fetchAllTables();
      } else if (_tabController.index == 2) {
        context.read<TableCubit>().fetchRunningTables();
      } else {
        context.read<TableCubit>().fetchTables();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder<int>(
          valueListenable: selectedBottomIndex,
          builder: (context, index, _) {
            return Column(
              children: [
                if (index == 0)
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu, color: Colors.white),
                          Row(
                            children: [
                              Icon(Icons.store, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                "Kozikkodan",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Icon(Icons.refresh, color: Colors.white),
                        ],
                      ),
                    ),
                  ),

                if (index == 0) ...[
                  ValueListenableBuilder<bool>(
                    valueListenable: isDineIn,
                    builder: (context, value, _) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => BillsScreen(),
                                ),
                              );
                            },
                            icon: const Icon(Icons.ac_unit),
                          ),
                          _toggleButton(
                            text: "Dine-In",
                            selected: value,
                            onTap: () => isDineIn.value = true,
                          ),
                          const SizedBox(width: 12),
                          _toggleButton(
                            text: "Takeaway",
                            selected: !value,
                            onTap: () => isDineIn.value = false,
                          ),
                        ],
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  TabBar(
                    controller: _tabController,
                    indicatorColor: Colors.orange,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(text: "All"),
                      Tab(text: "Available Tables"),
                      Tab(text: "Running Tables"),
                    ],
                  ),

                  Expanded(
                    child: BlocBuilder<TableCubit, TableState>(
                      builder: (context, state) {
                        if (state is TableLoading ||
                            state is RunningTableLoading ||
                            state is AllTableLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (state is TableError) {
                          return Center(child: Text(state.message));
                        }

                        if (state is RunningTableError) {
                          return Center(child: Text(state.message));
                        }
                        if (state is AllTableError) {
                          return Center(child: Text(state.message));
                        }
                        if (state is TableLoaded) {
                          final tables = state.response.tables;

                          /// 🔥 FILTER ONLY status == 0 for Available tab
                          final filteredTables = <String, dynamic>{};

                          tables?.forEach((section, tableList) {
                            final filteredList = (tableList as List)
                                .where((table) => table.status == 0)
                                .toList();

                            if (filteredList.isNotEmpty) {
                              filteredTables[section] = filteredList;
                            }
                          });

                          return TabBarView(
                            controller: _tabController,
                            children: [
                              SizedBox(),
                              tabContent(filteredTables),
                              const SizedBox(),
                            ],
                          );
                        }

                        if (state is RunningTableLoaded) {
                          final tables = state.data.tables;

                          return TabBarView(
                            controller: _tabController,
                            children: [
                              const SizedBox(),
                              const SizedBox(),
                              tabContent(tables),
                            ],
                          );
                        }
                        if (state is AllTableLoaded) {
                          final tables = state.response.tables;

                          return TabBarView(
                            controller: _tabController,
                            children: [
                              tabContent(tables),
                              const SizedBox(),
                              const SizedBox(),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],

                if (index == 1)
                  Expanded(child: Center(child: SettingsScreen())),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedBottomIndex,
        builder: (context, index, _) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  bottomItem(
                    icon: Icons.home,
                    label: "Home",
                    isSelected: index == 0,
                    onTap: () => selectedBottomIndex.value = 0,
                  ),
                  bottomItem(
                    icon: Icons.settings,
                    label: "Settings",
                    isSelected: index == 1,
                    onTap: () => selectedBottomIndex.value = 1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _toggleButton({
    required String text,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.black : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              Icons.restaurant,
              color: selected ? Colors.white : Colors.black,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff1a1a1a) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(icon, color: isSelected ? Colors.amber : Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.amber : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabContent(Map<String, dynamic>? tables) {
    if (tables == null || tables.isEmpty) {
      return const Center(child: Text("No Tables Found"));
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: tables.entries.map((entry) {
          final sectionName = entry.key;
          final tableList = entry.value as List;

          // final filtered = tableList.where((table) {
          //   if (filter == "available") return table.status == 0;
          //   if (filter == "running") return table.status == 1;
          //   return true;
          // }).toList();

          if (tableList.isEmpty) return const SizedBox();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _sectionTitle(sectionName),
              const SizedBox(height: 12),
              _tableGrid(tableList),
              const SizedBox(height: 20),
            ],
          );
        }).toList(),
      ),
    );
  }

  static Widget _sectionTitle(String title) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Color.fromARGB(255, 194, 193, 193),
          ),
        ),
      ],
    );
  }

  static Widget _tableGrid(List<dynamic> tables) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tables.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return _tableCard(context, tables[index]);
      },
    );
  }

  static Widget _tableCard(BuildContext context, dynamic table) {
    final isRunning = table.status == 1;

    return GestureDetector(
      onTap: () {
        if (isRunning) {
          /// 🔴 If table is running → Go to Order Details Screen
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => OrderDetailsScreen(
                tableId: table.tableId!,
                // orderMasterId: table.OrderMasterId,
                // tableName: table.tableNumber!,
              ),
            ),
          );
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SaleScreen(
                tableId: table.tableId!,
                tableName: table.tableNumber!,
              ),
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isRunning ? Colors.red.shade100 : const Color(0xfff3e2b9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                      child: const Icon(
                        Icons.dinner_dining_outlined,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        table.tableNumber ?? "",
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.table_restaurant_outlined, size: 18),
                    const SizedBox(width: 6),
                    Text(
                      "${table.numberOfSeat}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if (isRunning)
              SizedBox(
                height: 32,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SaleScreen(
                          tableId: table.tableId!,
                          tableName: table.tableNumber!,
                        ), // your sales screen
                      ),
                    );
                  },
                  child: const Text(
                    "+ Add",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
