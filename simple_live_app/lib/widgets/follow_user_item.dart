import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simple_live_app/app/app_style.dart';
import 'package:simple_live_app/app/sites.dart';
import 'package:simple_live_app/models/db/follow_user.dart';
import 'package:simple_live_app/widgets/net_image.dart';

class FollowUserItem extends StatelessWidget {
  final FollowUser item;
  final Function()? onRemove;
  final Function()? onTap;
  final bool playing;
  const FollowUserItem({
    required this.item,
    this.onRemove,
    this.onTap,
    this.playing = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var site = Sites.allSites[item.siteId]!;
    final theme = Theme.of(context);
    
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        onLongPress: onRemove,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // 头像
              Hero(
                tag: 'user_${item.roomId}_${item.siteId}',
                child: Stack(
                  children: [
                    NetImage(
                      item.face,
                      width: 52,
                      height: 52,
                      borderRadius: 26,
                    ),
                    Obx(
                      () => Positioned(
                        right: 0,
                        bottom: 0,
                        child: Offstage(
                          offstage: item.liveStatus.value != 2,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: theme.cardColor,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              AppStyle.hGap16,
              
              // 用户信息
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.userName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: theme.colorScheme.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        
                        // 平台图标
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primaryContainer,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(
                                site.logo,
                                width: 14,
                                height: 14,
                              ),
                              AppStyle.hGap4,
                              Text(
                                site.name.substring(0, 2),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    
                    AppStyle.vGap8,
                    
                    // 直播状态
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: Container(
                          key: ValueKey<int>(item.liveStatus.value),
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: _getStatusColor(item.liveStatus.value, theme),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getStatusIcon(item.liveStatus.value),
                                size: 14,
                                color: _getStatusIconColor(item.liveStatus.value, theme),
                              ),
                              AppStyle.hGap4,
                              Text(
                                _getStatus(item.liveStatus.value),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: _getStatusIconColor(item.liveStatus.value, theme),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // 操作按钮
              if (playing)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "正在观看",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                )
              else if (onRemove != null)
                IconButton(
                  onPressed: onRemove,
                  icon: Icon(
                    Remix.delete_bin_line,
                    color: theme.colorScheme.error.withOpacity(0.8),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: theme.colorScheme.errorContainer.withOpacity(0.2),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getStatus(int status) {
    if (status == 0) {
      return "读取中";
    } else if (status == 1) {
      return "未开播";
    } else {
      return "直播中";
    }
  }
  
  IconData _getStatusIcon(int status) {
    if (status == 0) {
      return Icons.hourglass_empty;
    } else if (status == 1) {
      return Icons.videocam_off_outlined;
    } else {
      return Icons.videocam;
    }
  }
  
  Color _getStatusColor(int status, ThemeData theme) {
    if (status == 0) {
      return theme.colorScheme.secondaryContainer;
    } else if (status == 1) {
      return theme.colorScheme.surfaceVariant;
    } else {
      return Colors.green.withOpacity(0.2);
    }
  }
  
  Color _getStatusIconColor(int status, ThemeData theme) {
    if (status == 0) {
      return theme.colorScheme.secondary;
    } else if (status == 1) {
      return theme.colorScheme.onSurfaceVariant;
    } else {
      return Colors.green;
    }
  }
}
