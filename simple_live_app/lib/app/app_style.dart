import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppColors {
  // 使用更鲜艳的主要颜色
  static const Color primaryColor = Color(0xFF5271FF);
  static const Color accentColor = Color(0xFF00D1FF);
  static const Color errorColor = Color(0xFFFF5252);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color black333 = Color(0xFF333333);
  static const Color textColor = Color(0xFF424242);
  static const Color secondaryTextColor = Color(0xFF757575);
  static const Color cardColor = Color(0xFFFCFCFC);
  static const Color dividerColor = Color(0xFFEEEEEE);
  
  static ColorScheme lightColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.light,
    primary: primaryColor,
    secondary: accentColor,
    error: errorColor,
    background: Colors.white,
    surface: cardColor,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: Colors.white,
    onBackground: textColor,
    onSurface: textColor,
  );
  
  static ColorScheme darkColorScheme = ColorScheme.fromSeed(
    seedColor: primaryColor,
    brightness: Brightness.dark,
    primary: primaryColor,
    secondary: accentColor,
    error: errorColor,
    background: Color(0xFF121212),
    surface: Color(0xFF1E1E1E),
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onError: Colors.white,
    onBackground: Colors.white,
    onSurface: Colors.white,
  );
}

class AppStyle {
  static ThemeData lightTheme = ThemeData(
    colorScheme: AppColors.lightColorScheme,
    useMaterial3: true,
    fontFamily: Platform.isWindows ? "Microsoft YaHei" : null,
    visualDensity: VisualDensity.standard,
    scaffoldBackgroundColor: Colors.white,
    
    // 卡片样式
    cardTheme: CardTheme(
      color: AppColors.cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.zero,
    ),
    
    // 按钮样式
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    
    // AppBar样式
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.black333,
      ),
      iconTheme: IconThemeData(color: AppColors.black333),
      foregroundColor: AppColors.black333,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    
    // 底部导航栏样式
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.primaryColor.withOpacity(0.1),
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: AppColors.primaryColor, size: 24);
        }
        return IconThemeData(color: AppColors.secondaryTextColor, size: 24);
      }),
    ),
    
    // TabBar样式
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.secondaryTextColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.primaryColor,
        ),
        insets: EdgeInsets.symmetric(horizontal: 16),
      ),
    ),
    
    // 文本主题
    textTheme: TextTheme(
      displayLarge: TextStyle(color: AppColors.textColor),
      displayMedium: TextStyle(color: AppColors.textColor),
      displaySmall: TextStyle(color: AppColors.textColor),
      headlineLarge: TextStyle(color: AppColors.textColor),
      headlineMedium: TextStyle(color: AppColors.textColor),
      headlineSmall: TextStyle(color: AppColors.textColor),
      titleLarge: TextStyle(color: AppColors.textColor),
      titleMedium: TextStyle(color: AppColors.textColor),
      titleSmall: TextStyle(color: AppColors.textColor),
      bodyLarge: TextStyle(color: AppColors.textColor),
      bodyMedium: TextStyle(color: AppColors.textColor),
      bodySmall: TextStyle(color: AppColors.secondaryTextColor),
      labelLarge: TextStyle(color: AppColors.primaryColor),
      labelMedium: TextStyle(color: AppColors.primaryColor),
      labelSmall: TextStyle(color: AppColors.primaryColor),
    ),
    
    // 输入框样式
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dividerColor.withOpacity(0.5),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: AppColors.darkColorScheme,
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    scaffoldBackgroundColor: AppColors.darkColorScheme.background,
    
    // 卡片样式
    cardTheme: CardTheme(
      color: AppColors.darkColorScheme.surface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.zero,
    ),
    
    // 按钮样式
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    
    // AppBar样式
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.darkColorScheme.background,
      elevation: 0,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
      foregroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.transparent,
      ),
    ),
    
    // 底部导航栏样式
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.darkColorScheme.surface,
      indicatorColor: AppColors.primaryColor.withOpacity(0.2),
      labelTextStyle: MaterialStateProperty.all(
        TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
      iconTheme: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return IconThemeData(color: AppColors.primaryColor, size: 24);
        }
        return IconThemeData(color: Colors.white70, size: 24);
      }),
    ),
    
    // TabBar样式
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.white70,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.primaryColor,
        ),
        insets: EdgeInsets.symmetric(horizontal: 16),
      ),
    ),
    
    // 输入框样式
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.08),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.primaryColor, width: 1),
      ),
    ),
    
    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: Platform.isWindows ? "Microsoft YaHei" : null,
    ),
    primaryTextTheme: ThemeData().textTheme.apply(
      fontFamily: Platform.isWindows ? "Microsoft YaHei" : null,
    ),
  );
  
  // 保留原有的间距定义
  static const vGap4 = SizedBox(height: 4);
  static const vGap8 = SizedBox(height: 8);
  static const vGap12 = SizedBox(height: 12);
  static const vGap24 = SizedBox(height: 24);
  static const vGap32 = SizedBox(height: 32);
  static const vGap48 = SizedBox(height: 48);

  static const hGap4 = SizedBox(width: 4);
  static const hGap8 = SizedBox(width: 8);
  static const hGap12 = SizedBox(width: 12);
  static const hGap16 = SizedBox(width: 16);
  static const hGap24 = SizedBox(width: 24);
  static const hGap32 = SizedBox(width: 32);
  static const hGap48 = SizedBox(width: 48);

  static const edgeInsetsH4 = EdgeInsets.symmetric(horizontal: 4);
  static const edgeInsetsH8 = EdgeInsets.symmetric(horizontal: 8);
  static const edgeInsetsH12 = EdgeInsets.symmetric(horizontal: 12);
  static const edgeInsetsH16 = EdgeInsets.symmetric(horizontal: 16);
  static const edgeInsetsH20 = EdgeInsets.symmetric(horizontal: 20);
  static const edgeInsetsH24 = EdgeInsets.symmetric(horizontal: 24);

  static const edgeInsetsV4 = EdgeInsets.symmetric(vertical: 4);
  static const edgeInsetsV8 = EdgeInsets.symmetric(vertical: 8);
  static const edgeInsetsV12 = EdgeInsets.symmetric(vertical: 12);
  static const edgeInsetsV24 = EdgeInsets.symmetric(vertical: 24);

  static const edgeInsetsA4 = EdgeInsets.all(4);
  static const edgeInsetsA8 = EdgeInsets.all(8);
  static const edgeInsetsA12 = EdgeInsets.all(12);
  static const edgeInsetsA16 = EdgeInsets.all(16);
  static const edgeInsetsA20 = EdgeInsets.all(20);
  static const edgeInsetsA24 = EdgeInsets.all(24);

  static const edgeInsetsR4 = EdgeInsets.only(right: 4);
  static const edgeInsetsR8 = EdgeInsets.only(right: 8);
  static const edgeInsetsR12 = EdgeInsets.only(right: 12);
  static const edgeInsetsR16 = EdgeInsets.only(right: 16);
  static const edgeInsetsR20 = EdgeInsets.only(right: 20);
  static const edgeInsetsR24 = EdgeInsets.only(right: 24);

  static const edgeInsetsL4 = EdgeInsets.only(left: 4);
  static const edgeInsetsL8 = EdgeInsets.only(left: 8);
  static const edgeInsetsL12 = EdgeInsets.only(left: 12);
  static const edgeInsetsL16 = EdgeInsets.only(left: 16);
  static const edgeInsetsL20 = EdgeInsets.only(left: 20);
  static const edgeInsetsL24 = EdgeInsets.only(left: 24);

  static const edgeInsetsT4 = EdgeInsets.only(top: 4);
  static const edgeInsetsT8 = EdgeInsets.only(top: 8);
  static const edgeInsetsT12 = EdgeInsets.only(top: 12);
  static const edgeInsetsT24 = EdgeInsets.only(top: 24);

  static const edgeInsetsB4 = EdgeInsets.only(bottom: 4);
  static const edgeInsetsB8 = EdgeInsets.only(bottom: 8);
  static const edgeInsetsB12 = EdgeInsets.only(bottom: 12);
  static const edgeInsetsB24 = EdgeInsets.only(bottom: 24);

  static BorderRadius radius4 = BorderRadius.circular(4);
  static BorderRadius radius8 = BorderRadius.circular(8);
  static BorderRadius radius12 = BorderRadius.circular(12);
  static BorderRadius radius16 = BorderRadius.circular(16);
  static BorderRadius radius24 = BorderRadius.circular(24);
  static BorderRadius radius32 = BorderRadius.circular(32);
  static BorderRadius radius48 = BorderRadius.circular(48);

  /// 顶部状态栏的高度
  static double get statusBarHeight => MediaQuery.of(Get.context!).padding.top;

  /// 底部导航条的高度
  static double get bottomBarHeight => MediaQuery.of(Get.context!).padding.bottom;

  // 优化分割线样式
  static Divider get divider => Divider(
        height: 1,
        thickness: 1,
        indent: 16,
        endIndent: 16,
        color: Colors.grey.withAlpha(20),
      );
      
  // 阴影效果
  static List<BoxShadow> get lightShadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 8,
      offset: Offset(0, 2),
    )
  ];
}
