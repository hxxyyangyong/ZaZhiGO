//
//  BuyersRelativeUrlCenter.h
//  CtSizeWithFontAnBoundingRectWithSize
//
//  Created by yangyong on 15/12/14.
//  Copyright © 2015年 com.zhuocheng. All rights reserved.
//

#import <Foundation/Foundation.h>

//登录
#define BuyersRelativeUrl_login @"act=login"
//注册
#define BuyersRelativeUrl_register @"act=login&op=register"

//注销
#define BuyersRelativeUrl_logout @"act=logout"
//我的商城
#define BuyersRelativeUrl_member_index @"act=member_index"
//收藏列表
#define BuyersRelativeUrl_favorites_list @"act=member_favorites&op=favorites_list"
//收藏添加
#define BuyersRelativeUrl_favorites_add @"act=member_favorites&op=favorites_add"
//收藏删除
#define BuyersRelativeUrl_favorites_del @"act=member_favorites&op=favorites_del"

//地址列表
#define BuyersRelativeUrl_address_list @"act=member_address&op=address_list"
//地址详细信息
#define BuyersRelativeUrl_address_info @"act=member_address&op=address_info"
//地址删除
#define BuyersRelativeUrl_address_del @"act=member_address&op=address_del"
//地址添加
#define BuyersRelativeUrl_address_add @"act=member_address&op=address_add"
//地址编辑
#define BuyersRelativeUrl_address_edit @"act=member_address&op=address_edit"

//地区列表
#define BuyersRelativeUrl_area_list @"act=member_address&op=area_list"

//订单列表
#define BuyersRelativeUrl_order_list @"act=member_order&op=order_list"
//订单取消(未付款)
#define BuyersRelativeUrl_order_cancel @"act=member_order&op=order_cancel"
//订单确认收货
#define BuyersRelativeUrl_order_receive @"act=member_order&op=order_receive"

//订单物流信息
#define BuyersRelativeUrl_search_deliver @"act=member_order&op=search_deliver"

//购物车列表
#define BuyersRelativeUrl_cart_list @"act=member_cart&op=cart_list"
//购物车添加
#define BuyersRelativeUrl_cart_add @"act=member_cart&op=cart_add"
//购物车删除
#define BuyersRelativeUrl_cart_del @"act=member_cart&op=cart_del"
//购物车修改数量
#define BuyersRelativeUrl_cart_edit_quantity @"act=member_cart&op=cart_edit_quantity"

//发票列表
#define BuyersRelativeUrl_invoice_list @"act=member_invoice&op=invoice_list"
//发票添加
#define BuyersRelativeUrl_invoice_add @"act=member_invoice&op=invoice_add"
//发票删除
#define BuyersRelativeUrl_invoice_del @"act=member_invoice&op=invoice_del"
//发票内容列表
#define BuyersRelativeUrl_invoice_content_list @"act=member_invoice&op=invoice_content_list"


//购买第一步
#define BuyersRelativeUrl_buy_step1 @"act=member_buy&op=buy_step1"
//更换收货地址
#define BuyersRelativeUrl_buy_change_address @"act=member_buy&op=change_address"
//验证支付密码
#define BuyersRelativeUrl_buy_check_password @"act=member_buy&op=check_password"
//购买第二步
#define BuyersRelativeUrl_buy_step2 @"act=member_buy&op=buy_step2"
//可用支付方式列表
#define BuyersRelativeUrl_payment_list @"act=member_payment&op=payment_list"
//支付
#define BuyersRelativeUrl_payment_pay @"act=member_payment&op=pay"
//获取微信APP支付信息
#define BuyersRelativeUrl_payment_wx_app_pay @"act=member_payment&op=wx_app_pay"
//获取微信APP支付信息(v3)
#define BuyersRelativeUrl_payment_wx_app_pay3 @"act=member_buy&op=buy_step2"
//买家代金券列表
#define BuyersRelativeUrl_voucher_list @"act=member_voucher&op=voucher_list"
//

#pragma mark - 商城的URL CENTER
////////////////////////////////////////////////////////////////////////////////////
//首页数据接口(get)
#define MallRelativeUrl_index @"act=index"
//专题接口(get)
#define MallRelativeUrl_special @"act=index&op=special"

//商品分类 - 一级分类接口
#define MallRelativeUrl_goods_class @"act=goods_class"
//商品分类 - 指定分类接口
#define MallRelativeUrl_goods_class_gcid @"index.php?act=goods_class&gc_id=2"
//商品列表接口(get)
#define MallRelativeUrl_goods_list @"act=goods&op=goods_list"
//商品详细信息接口(get)
#define MallRelativeUrl_goods_detail @"act=goods&op=goods_detail"
//商品介绍信息
#define MallRelativeUrl_goods_body @"act=goods&op=goods_body"
//地区列表
#define MallRelativeUrl_area_list @"act=area&op=area_list"
//意见反馈
#define MallRelativeUrl_feedback_add @"act=member_feedback&op=feedback_add"
//意见反馈
#define MallRelativeUrl_recommend_list @"act=brand&op=recommend_list"





@interface BuyersRelativeUrlCenter : NSObject

@end
