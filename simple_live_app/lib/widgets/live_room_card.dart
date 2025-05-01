import 'package:flutter/material.dart';
import 'package:remixicon/remixicon.dart';
import 'package:simple_live_app/app/app_style.dart';
import 'package:simple_live_app/app/constant.dart';
import 'package:simple_live_app/app/sites.dart';
import 'package:simple_live_app/app/utils.dart';
import 'package:simple_live_app/routes/app_navigation.dart';
import 'package:simple_live_app/widgets/net_image.dart';
import 'package:simple_live_core/simple_live_core.dart';

class LiveRoomCard extends StatelessWidget {
  final Site site;
  final LiveRoomItem item;
  const LiveRoomCard(this.site, this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          AppNavigator.toLiveRoomDetail(site: site, roomId: item.roomId);
        },
        child: Container(
          decoration: BoxDecoration(
            boxShadow: AppStyle.lightShadow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // 封面图片
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: NetImage(
                      item.cover,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  
                  // 顶部横条 - 半透明背景，包含平台标识和在线人数
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black54,
                            Colors.transparent,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // 平台标志
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: _getSiteColor(site),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _getSiteShortName(site),
                              style: const TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          
                          // 在线人数
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Remix.fire_fill,
                                color: Colors.white,
                                size: 12,
                              ),
                              AppStyle.hGap4,
                              Text(
                                Utils.onlineToString(item.online),
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // 底部信息 - 主播名称
                  Positioned(
                    right: 0,
                    left: 0,
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 6,
                      ),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black87,
                            Colors.transparent,
                          ],
                          stops: [0.0, 0.9],
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: const Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 12,
                            ),
                          ),
                          AppStyle.hGap4,
                          Expanded(
                            child: Text(
                              item.userName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // 直播标题
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    height: 1.2,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Color _getSiteColor(Site site) {
    switch (site.id) {
      case Constant.kBiliBili:
        return const Color(0xFFFA7298);
      case Constant.kDouyu:
        return const Color(0xFFFF5F23);
      case Constant.kHuya:
        return const Color(0xFFFFBA00);
      case Constant.kDouyin:
        return const Color(0xFF000000);
      default:
        return AppColors.primaryColor;
    }
  }
  
  String _getSiteShortName(Site site) {
    return site.name.substring(0, 2);
  }
}
