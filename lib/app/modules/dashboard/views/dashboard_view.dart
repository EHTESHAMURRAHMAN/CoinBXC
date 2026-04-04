import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return _DashboardContent(controller: controller);
  }
}

class _DashboardContent extends StatefulWidget {
  final DashboardController controller;

  const _DashboardContent({required this.controller});

  @override
  State<_DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<_DashboardContent>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  double _lastScrollPosition = 0;
  bool _isNavBarVisible = true;

  DashboardController get dashboardController => widget.controller;

  final List<Widget> _pages = const [
    _PageContent(title: 'Home', icon: Icons.home),
    _PageContent(title: 'Search', icon: Icons.search),
    _PageContent(title: 'Favourites', icon: Icons.favorite),
    _PageContent(title: 'Profile', icon: Icons.person),
  ];

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation =
        Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0, 1), // slides DOWN to hide
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final currentPosition = _scrollController.position.pixels;
    final delta = currentPosition - _lastScrollPosition;

    // Scroll DOWN → hide BottomNavBar
    if (delta > 5 && _isNavBarVisible) {
      _isNavBarVisible = false;
      _animationController.forward();
    }
    // Scroll UP → show BottomNavBar
    else if (delta < -5 && !_isNavBarVisible) {
      _isNavBarVisible = true;
      _animationController.reverse();
    }

    _lastScrollPosition = currentPosition;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard'), centerTitle: true),
      body: Stack(
        children: [
          // Page content with scroll
          Obx(
            () => _ScrollWrapper(
              scrollController: _scrollController,
              child: _pages[dashboardController.currentIndex.value],
            ),
          ),

          // Animated BottomNavigationBar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SlideTransition(
              position: _slideAnimation,
              child: Obx(
                () => BottomNavigationBar(
                  currentIndex: dashboardController.currentIndex.value,
                  onTap: dashboardController.changeTab,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.blue,
                  unselectedItemColor: Colors.grey,
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favourites',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.person),
                      label: 'Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Wrapper that injects the shared ScrollController into each page
class _ScrollWrapper extends StatelessWidget {
  final ScrollController scrollController;
  final Widget child;

  const _ScrollWrapper({required this.scrollController, required this.child});

  @override
  Widget build(BuildContext context) {
    return PrimaryScrollController(controller: scrollController, child: child);
  }
}

// Sample page content — replace with your actual tab pages
class _PageContent extends StatelessWidget {
  final String title;
  final IconData icon;

  const _PageContent({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final bottomNavHeight =
        kBottomNavigationBarHeight + MediaQuery.of(context).padding.bottom;

    return ListView.builder(
      // Uses PrimaryScrollController automatically
      padding: EdgeInsets.only(bottom: bottomNavHeight),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(icon),
          title: Text('$title Item ${index + 1}'),
          subtitle: Text('Subtitle for $title item ${index + 1}'),
        );
      },
    );
  }
}
