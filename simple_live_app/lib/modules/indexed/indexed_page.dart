import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_live_app/app/app_style.dart';

import 'indexed_controller.dart';

class IndexedPage extends GetView<IndexedController> {
  const IndexedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: Row(
            children: [
              // 横屏时显示侧边导航栏
              if (orientation == Orientation.landscape)
                Obx(
                  () => NavigationRail(
                    selectedIndex: controller.index.value,
                    onDestinationSelected: controller.setIndex,
                    useIndicator: true,
                    indicatorColor: theme.colorScheme.primaryContainer,
                    backgroundColor: theme.brightness == Brightness.dark
                        ? theme.colorScheme.surface
                        : theme.colorScheme.surface,
                    labelType: NavigationRailLabelType.selected,
                    destinations: controller.items
                        .map(
                          (item) => NavigationRailDestination(
                            icon: Icon(item.iconData),
                            selectedIcon: Icon(item.iconData, color: theme.colorScheme.primary),
                            label: Text(item.title),
                            padding: AppStyle.edgeInsetsV12,
                          ),
                        )
                        .toList(),
                  ),
                ),
              
              // 主内容区域
              Expanded(
                child: Obx(
                  () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: KeyedSubtree(
                      key: ValueKey<int>(controller.index.value),
                      child: controller.pages[controller.index.value],
                    ),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          
          // 底部导航栏（竖屏模式）
          bottomNavigationBar: Visibility(
            visible: orientation == Orientation.portrait,
            child: Obx(
              () => NavigationBar(
                selectedIndex: controller.index.value,
                onDestinationSelected: controller.setIndex,
                height: 64,
                elevation: 0,
                backgroundColor: theme.brightness == Brightness.dark
                    ? theme.colorScheme.surface
                    : theme.colorScheme.surface,
                labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
                animationDuration: const Duration(milliseconds: 600),
                destinations: controller.items
                    .map(
                      (item) => NavigationDestination(
                        icon: Icon(item.iconData),
                        selectedIcon: Icon(item.iconData),
                        label: item.title,
                        tooltip: item.title,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

// 页面过渡动画
class FadeThroughTransition extends AnimatedWidget {
  const FadeThroughTransition({
    required Animation<double> animation,
    required Animation<double> secondaryAnimation,
    required this.child,
    this.fillColor,
    Key? key,
  }) : super(key: key, listenable: animation);

  final Widget child;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
