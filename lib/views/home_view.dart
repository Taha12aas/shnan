import 'package:chnan/views/material_statement_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:chnan/views/accounts_view.dart';
import 'package:chnan/views/bills_view.dart';
import 'package:chnan/views/material_view.dart';
import 'package:chnan/utils/box_shado.dart';
import 'package:chnan/utils/const.dart';
import 'package:chnan/utils/font_style.dart';
import 'package:chnan/utils/responsive_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    BillsView(),
    MaterialView(),

    AccountsAndMaterialsTab(),
    MaterialStatementView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'الرئيسية',
            style: FontStyleApp.white18.copyWith(
              fontSize: getResponsiveText(context, 18),
            ),
          ),
        ),
        backgroundColor: kAppColor,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SafeArea(child: _pages[_currentIndex]),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [bosShadow()],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BottomNavigationBar(
                      currentIndex: _currentIndex,
                      onTap: (index) => setState(() => _currentIndex = index),
                      type: BottomNavigationBarType.fixed,
                      backgroundColor: Colors.white,
                      selectedItemColor: kAppColor,
                      unselectedItemColor: Colors.black,
                      selectedLabelStyle: FontStyleApp.white18.copyWith(
                        fontSize: getResponsiveText(context, 12),
                      ),
                      unselectedLabelStyle: FontStyleApp.white18.copyWith(
                        fontSize: getResponsiveText(context, 12),
                      ),
                      elevation: 0,
                      items: [
                        _buildNavItem(
                          'assets/img/Home/lets-icons_paper-light.svg',
                          'فواتير',
                          0,
                        ),
                        _buildNavItem(
                          'assets/img/Home/carbon_report-data.svg',
                          'المواد',
                          1,
                        ),

                        _buildNavItem(
                          'assets/img/Home/tree-structure-thin-svgrepo-com.svg',
                          'الحسابات',
                          2,
                        ),
                        _buildNavItem(
                          'assets/img/Home/si_inventory-line.svg',
                          'كشف حساب',
                          3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    String assetPath,
    String label,
    int index,
  ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        assetPath,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(
          _currentIndex == index ? kAppColor : kBlack,
          BlendMode.srcIn,
        ),
      ),
      label: label,
    );
  }
}

class AccountsAndMaterialsTab extends StatelessWidget {
  const AccountsAndMaterialsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const AccountsView(); 
  }
}
