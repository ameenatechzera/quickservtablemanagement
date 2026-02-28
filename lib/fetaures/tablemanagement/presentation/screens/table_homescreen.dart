import 'package:flutter/material.dart';
import 'package:quickservtablemanagement/core/theme/colors.dart';
import 'package:quickservtablemanagement/fetaures/sale/presentation/screens/sale_screen.dart';

class TableHomescreen extends StatelessWidget {
  TableHomescreen({super.key});

  /// true = Dine-In
  /// false = Takeaway
  final ValueNotifier<bool> isDineIn = ValueNotifier<bool>(true);

  /// 0 = Home, 1 = Settings
  final ValueNotifier<int> selectedBottomIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: ValueListenableBuilder<int>(
            valueListenable: selectedBottomIndex,
            builder: (context, index, _) {
              return Column(
                children: [
                  /// ---------------- TOP BAR ----------------
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 60,
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

                  /// ---------------- TOGGLE BUTTON ----------------
                  if (index == 0) ...[
                    ValueListenableBuilder<bool>(
                      valueListenable: isDineIn,
                      builder: (context, value, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
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

                    /// ---------------- TAB BAR ----------------
                    const TabBar(
                      indicatorColor: Colors.orange,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "All"),
                        Tab(text: "Available Tables"),
                        Tab(text: "Running Tables"),
                      ],
                    ),

                    /// ---------------- TAB VIEW ----------------
                    Expanded(
                      child: TabBarView(
                        children: [_tabContent(), _tabContent(), _tabContent()],
                      ),
                    ),
                  ],
                  if (index == 1)
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Settings Screen",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
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
                    _bottomItem(
                      icon: Icons.home,
                      label: "Home",
                      isSelected: index == 0,
                      onTap: () => selectedBottomIndex.value = 0,
                    ),
                    _bottomItem(
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
      ),
    );
  }

  /// ---------------- BOTTOM ITEM ----------------
  static Widget _bottomItem({
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

  /// ---------------- TOGGLE BUTTON ----------------
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

  /// ---------------- TAB CONTENT ----------------
  static Widget _tabContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          /// -------- INDOOR --------
          _sectionTitle("Indoor"),
          const SizedBox(height: 12),
          _tableGrid(),

          const SizedBox(height: 20),

          /// -------- OUTDOOR --------
          _sectionTitle("Outdoor"),
          const SizedBox(height: 12),
          _tableGrid(),
        ],
      ),
    );
  }

  /// ---------------- SECTION TITLE ----------------
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

  /// ---------------- TABLE GRID ----------------
  static Widget _tableGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) {
        return _tableCard(context);
      },
    );
  }

  /// ---------------- TABLE CARD ----------------
  static Widget _tableCard(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return SaleScreen();
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xfff3e2b9),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// -------- TOP CONTENT --------
            Column(
              children: [
                /// Icon + Table Name
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
                    const Expanded(
                      child: Text(
                        "Table -1",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                /// Seat Count (Perfectly Centered)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.table_restaurant_outlined, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "4",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            /// -------- ADD BUTTON --------
            Container(
              height: 32,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
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
