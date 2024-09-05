import 'package:drawerbehavior/drawerbehavior.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nannyvanny/ui/screen/bookings.dart';
import 'package:nannyvanny/ui/screen/home.dart';
import 'package:nannyvanny/ui/screen/packages.dart';
import 'package:nannyvanny/ui/screen/profile.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../bloc/main_page/main_page_bloc.dart';
import '../values/app_color.dart';
import '../widgets/custom_nav_bar.dart';
import '../widgets/menu_header.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late DrawerScaffoldController _controller;
  late PersistentTabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = DrawerScaffoldController();
    _tabController = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _showExitConfirmationDialog(context);
      },
      child: DrawerScaffold(
        controller: _controller,
        drawers: [
          SideDrawer(
            percentage: 0.75,
            drawerWidth: 250,
            menu: Menu(items: [
              _buildMenuItem('Home'),
              _buildMenuItem('Book A Nanny'),
              _buildMenuItem('How It Works'),
              _buildMenuItem('Why Nanny Vanny'),
              _buildMenuItem('My Bookings'),
              _buildMenuItem('My Profile'),
              _buildMenuItem('Support'),
            ]),
            itemBuilder: (context, item, isSelected) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(vertical: -4),
                      title: Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.customBlue,
                        ),
                      ),
                      onTap: () {
                        final menuItemData = item.data;
                        if (menuItemData != null) {
                          _onMenuItemSelected(menuItemData);
                        }
                      },
                    ),
                    const Divider(
                      color: AppColors.customPink,
                      thickness: 0.2,
                      indent: 16,
                      endIndent: 26,
                    ),
                  ],
                ),
              );
            },
            headerView: _buildMenuHeader(),
            animation: true,
            alignment: Alignment.topLeft,
          ),
        ],
        body: BlocBuilder<TabNavigationBloc, TabNavigationState>(
          builder: (context, state) {
            return PersistentTabView(
              controller: _tabController,
              tabs: _buildTabs(),
              navBarBuilder: (navBarConfig) => CustomNavBar(
                navBarConfig: navBarConfig,
              ),
              navBarHeight: kBottomNavigationBarHeight,
              backgroundColor: Colors.white,
              onTabChanged: (index) {
                context.read<TabNavigationBloc>().add(ChangeTab(index));
              },
            );
          },
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Exit"),
            content: const Text("Are you sure you want to exit?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/signIn', // Replace with your sign-in route
                    (route) => false,
                  );
                },
                child: const Text("Yes"),
              ),
            ],
          ),
        ) ??
        false;
  }

  void _onMenuItemSelected(String item) {
    bool shouldCloseDrawer = false;

    switch (item) {
      case 'Home':
        _tabController.jumpToTab(0);
        shouldCloseDrawer = true;
        break;
      case 'My Bookings':
        _tabController.jumpToTab(2);
        shouldCloseDrawer = true;
        break;
      case 'My Profile':
        _tabController.jumpToTab(3);
        shouldCloseDrawer = true;
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('$item button is clicked'),
            duration: const Duration(seconds: 2),
          ),
        );
        break;
    }

    if (shouldCloseDrawer) {
      _controller.closeDrawer();
    }
  }

  List<PersistentTabConfig> _buildTabs() {
    return [
      PersistentTabConfig(
        screen: Home(
          drawerController: _controller,
        ),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/home.svg',
            height: 24,
            width: 24,
            color:
                _tabController.index == 0 ? AppColors.customPink : Colors.grey,
          ),
          title: "Home",
        ),
      ),
      PersistentTabConfig(
        screen: const Packages(),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/sale.svg',
            height: 24,
            width: 24,
            color:
                _tabController.index == 1 ? AppColors.customPink : Colors.grey,
          ),
          title: "Sale",
        ),
      ),
      PersistentTabConfig(
        screen: const Bookings(),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/clock.svg',
            height: 24,
            width: 24,
            color:
                _tabController.index == 2 ? AppColors.customPink : Colors.grey,
          ),
          title: "Bookings",
        ),
      ),
      PersistentTabConfig(
        screen: const Profile(),
        item: ItemConfig(
          icon: SvgPicture.asset(
            'assets/user.svg',
            height: 24,
            width: 24,
            color:
                _tabController.index == 3 ? AppColors.customPink : Colors.grey,
          ),
          title: "Profile",
        ),
      ),
    ];
  }

  Widget _buildMenuHeader() {
    return const MenuHeader();
  }

  MenuItem _buildMenuItem(String title) {
    return MenuItem(
      title: title,
      data: title,
    );
  }
}
