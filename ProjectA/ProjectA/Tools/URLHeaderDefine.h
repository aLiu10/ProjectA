//
//  URLHeaderDefine.h
//  ProjectA
//
//  Created by lanou on 16/5/31.
//  Copyright © 2016年 Aliu. All rights reserved.
//

#ifndef URLHeaderDefine_h
#define URLHeaderDefine_h

//阅读列表
#define READLIST_URL @"http://api2.pianke.me/read/columns"
//阅读详情列表
#define READDETAILLIST_URL @"http://api2.pianke.me/read/columns_detail"

#define READCONTENT_URL        @"http://api2.pianke.me/article/info"  // 文章详情

//  评论
#define GETCOMMENT_url         @"http://api2.pianke.me/comment/get" // 获取评论
#define ADDCOMMENT_url         @"http://api2.pianke.me/comment/add" // 发表评论
#define DELCOMMENT_url         @"http://api2.pianke.me/comment/del" // 删除评论
//  电台模块
#define RADIOLIST_URL          @"http://api2.pianke.me/ting/radio"  // 电台列表
#define RADIOMLISTORE_URL      @"http://api2.pianke.me/ting/radio_list" // 上拉电台列表
#define RADIODETAILLIST_URL    @"http://api2.pianke.me/ting/radio_detail" // 电台详细列表
#define RADIODETAILMORE_URL    @"http://api2.pianke.me/ting/radio_detail_list"

//  良品模块
#define SHOPLIST_URL @"http://api2.pianke.me/pub/shop"  // 良品列表

//  话题模块
#define TOPICLIST_URL          @"http://api2.pianke.me/group/posts_hotlist"  // 话题列表
#define TOPICINFO_URL          @"http://api2.pianke.me/group/posts_info"  // 话题详情

#endif /* URLHeaderDefine_h */
