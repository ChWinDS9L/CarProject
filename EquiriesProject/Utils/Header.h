//
//  Header.h
//  EquiriesProject
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 HXH. All rights reserved.
//

#ifndef EquiriesProject_Header_h
#define EquiriesProject_Header_h

#define Width [UIScreen mainScreen].bounds.size.width
#define Height [UIScreen mainScreen].bounds.size.height
//代驾
#define DesDrivingURL @"http://h5.edaijia.cn/app/index.html?&from=01050715&wza=wz&wzc=110100&wzd=866132021387497&wzg=1445585623693&wzp=2&wzq=wz_autohome&wzt=1445951157&wzu=1475856&wzutk=2275a000a413658b&wzv=3.5.0&wzs=a83dee1e55a816fd4994c848dc717ba3"


//天气
#define urlString @"http://wz.qichecdn.com/ashx/GetWeather.ashx?&cityid=110100&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

#define addressUrlStr @"http://wz.qichecdn.com/ashx/UpdateAllCityNew.ashx?&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"
//品牌找车
#define BrandUrl @"http://price.m.autohome.com.cn/?&DevId=866132021387497&SiteId=80&rgb=DB325A&wza=wz&wzc=110100&wzd=866132021387497&wzg=1445585623693&wzp=2&wzq=kqzs_cpa_test_w&wzt=1445589497&wzu=0&wzv=3.2.0&wzs=108611e7fad8b9098cbe535cc844b4c9"

//精准找车
//车系结果

#define CarRequestURLStr @"http://price.m.autohome.com.cn/0/0_9999_20_1.html"

//汽车详情(雪铁龙)
#define CarDeatilesURLStr @"http://price.m.autohome.com.cn/CarSeriesIndex/CarSeriesIndexView?id=2945&provinceId=0&cityID=0"

//询问底价

#define askLowPrice @"http://price.m.autohome.com.cn/CarSeriesIndex/CarSeriesIndexView?id=2945&provinceId=0&cityID=0"

//行车生活
#define DriveLifeUrlStr @"http://wz.qichecdn.com/ashx/getnewsindex.ashx?&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//用车日报
#define DailyCarUrl @"http://wz.qichecdn.com/ashx/getnewslist.ashx?&id=1&page=%d&pagesize=30&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//用车日报详情
#define dailyDeatilesUrl @"http://wz.qichecdn.com/articleinfo.aspx?&article_id=%@&wza=wz&wzc=110100&wzd=866132021387497&wzg=1445585623693&wzp=2&wzq=kqzs_cpa_test_w&wzt=1445597667&wzu=0&wzv=3.2.0&wzs=dd6f6b3afdbde4c926543706ca57587c"

//车祸事故分析

#define AccidentAnalyseUrl @"http://wz.qichecdn.com/ashx/getnewslist.ashx?&id=10935&page=1&pagesize=30&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//留言终结者
#define MessageEndUrl @"http://apipool.37degree.com/open/?method=setting_srv.srv_list_get&did=2775bce6bbdff63b12d7a7e03d39e7ff"

//留言终结者详情
#define MessageEndDetailsUrl @"http://cont.app.autohome.com.cn/autov4.8.8/content/news/newscontent-n877840-t0.json"

//低价车险使用指南
#define lowPriceUrl @"http://m.wxb.com.cn/activity/autohome_help/index.html"

//二手车估价
//爱车估值
#define loveCarevaluateUrl @"http://m.che168.com/pinggu/?&appversionbuy=2.08V&appversionsell=2.04V&buymark=oaha10020&hidead=1&hideheadfoot=1&pvareaid=101362&sellmark=oaha10021&wza=wz&wzc=110100&wzd=866132021387497&wzg=1445585623693&wzp=2&wzq=kqzs_cpa_test_w&wzt=1445599999&wzu=0&wzv=3.2.0&wzs=5e2792010e395532b9f7916424dba409"

//大家都在查
#define SeekUrl @"http://m.che168.com/Handler/Evaluate/History.ashx"

//汽车品牌
#define CarBrandUrl @"http://m.che168.com/handler/select/getallbrand.ashx?areaid=0"

//摇号提醒页面

#define RemindUrl @"http://m.wz.qichecdn.com/yaohao/add.aspx?&wza=wz&wzc=110100&wzd=866132021387497&wzg=1445585623693&wzp=2&wzq=kqzs_cpa_test_w&wzt=1445737420&wzu=1475856&wzv=3.2.0&wzs=ee6c4d320545b246bd3dd71864853086"

//摇号结果页面
#define ResultPageUrl @"http://m.wz.qichecdn.com/yaohao/js/js.js"

//交通队
#define LineUrl @"http://wz.qichecdn.com/ashx/getaddress.ashx?&cityid=110100&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//停车场
#define CarParkUrl @"http://wz.qichecdn.com/ashx/GetByServiceCateId.ashx?&_appid=wz&cityid=110100&serviceCateId=41&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445601972&_sign=9f99fb151bffd5f8d446d3b1ecf44bee"

//汽车美容
#define CarFacial @"http://wz.qichecdn.com/ashx/GetByServiceCateId.ashx?&_appid=wz&cityid=110100&serviceCateId=41&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445602196&_sign=4b2672e66924b3ee73bf71326d82819f"

//洗车
#define WashCarUrl @"http://wz.qichecdn.com/ashx/GetByServiceCateId.ashx?&_appid=wz&cityid=110100&serviceCateId=41&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445601102&_sign=8e469eba0bd4870a9a790ed8a92910ea"

//违章查询
//北京:
#define equiriesUrl @"http://wz.qichecdn.com/ashx/GetUserInfo.ashx?&drivertimestamp=1445673746&userid=1475856&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445737099&_sign=db899f436564fc079709a277f59e03ba"

//上海
#define SHEquiriesUrl @"http://wz.qichecdn.com/ashx/GetUserInfo.ashx?&drivertimestamp=1445673746&userid=1475856&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445736976&_sign=2884cb487f5871ecfd15a88b74d4d225"

//违章高发地
#define BreakeRulesurl @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=40.122461&lng=116.257872&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445602470&_sign=31310428c6e486d035b1b7ad5dcbadeb"

//违章高发地导航栏有按钮选择项
//全部:
#define AllUrl @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=40.122517&lng=116.257897&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445735721&_sign=9bc1b847ddac5d8039de35f55258deaa"

//超速
#define SpeedUrl @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=40.00849&lng=115.796646&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445736241&_sign=17b4eaba8800aa58118ccd719730ffaa"

//闯红灯
#define JumpRedlight @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=33.386128&lng=109.259282&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445736322&_sign=88fddc7d143087a387df654f20bd197e"

////限行
#define RestrictionUrl @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=25.037905&lng=106.974954&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445736408&_sign=9c645090436bd4e51ff0c4a185e96349"

////违规停车
#define BreakeRulesUrl @"http://wz.qichecdn.com/ashx/hvlocation.ashx?&cityid=-1&lat=40.016116&lng=116.332899&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445736478&_sign=cde4b5e53ed1b19b37922cb11fce6371"

//养车特惠
//养车之家

//城市选择
#define SelectedCityUrl @"http://yc.m.autohome.com.cn/atmtapi/api/banner/city?_=1445604361879"

//筛选
#define SelectedUrl @"http://yc.m.autohome.com.cn/atmtapi/api/baokuan/catelist?_=1445602784859"
//筛选 全部
#define SelectedAllUrl @"http://yc.m.autohome.com.cn/atmtapi/api/v2/baokuan/list?pageIndex=1&_=1445602987963"

//玻璃修复
#define RepairUrl @"http://yc.m.autohome.com.cn/atmtapi/api/v2/baokuan/list?pageIndex=1&typeId=32&iconType=53&_=1445603231545"

//更换空调芯
#define RenewUrl @"http://yc.m.autohome.com.cn/atmtapi/api/v2/baokuan/list?pageIndex=1&typeId=32&iconType=61&_=1445603353179"

//洗车
//服务列表
#define ServiesListUrl @"http://yc.m.autohome.com.cn/detail.html?parent_cate_id=128"

//服务列表 4s店
#define ServiesList4sUrl @"http://yc.m.autohome.com.cn/detail.html?ps=20&parent_cate_id=128&-is4S=1&gp=zone_id&ProvinceId=110000"

//意见反馈 常见问题
#define QuestionUrl @"http://wz.qichecdn.com/ashx/getwztips.ashx?&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//精品应用
#define FineWorksUrl @"http://wz.qichecdn.com/ashx/getapprecommend.ashx?&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w"

//服务协议接口
#define ServiesHttpUrl @"http://wz.qichecdn.com/info.html?&t=1445588376065"

//推送设置接口
#define SendUrl @"http://wz.qichecdn.com/ashx/getappinfo.ashx?&channel=kqzs_cpa_test_w&citys_timestamp=2015-09-03+07%3A50%3A00&limitnums_timestamp=0&maproadcity_timestamp=2013-12-17+13%3A14%3A00&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445588013&_sign=782ec32ee2877ab95a5e777eba57df91"
//注册:
#define ResigterUrl @"http://apipool.37degree.com/open/?method=setting_srv.srv_list_get&did=2775bce6bbdff63b12d7a7e03d39e7ff"

//发送验证码
#define VirifyUrl @"http://wz.qichecdn.com/ashx/user/wzverifymobilecode.ashx?&mobile=gcAHu57imFcSLJgFKS066g%3D%3D&validcodetype=1&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445673609&_sign=cb27b02b47d8cc25de577802a7f17974"

////返回注册成功
#define ResigterSuccessUrl @"http://wz.qichecdn.com/ashx/user/wzregist.ashx?&deviceid=866132021387497&mobile=gcAHu57imFcSLJgFKS066g%3D%3D&userpwd=b2addb85435302c2b404efeb696bc471&validecode=631353&wz_userid=0&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445673740&_sign=fe8131067d6aa2324f96444ca99e6692"

//个人中心
//我的订单
#define MyOrderUrl @"http://wz.qichecdn.com/ashx/order/userorderlist.ashx?&page=1&userid=1475856&usertoken=2275a000a413658b&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445674063&_sign=86cae5c342794d97aad6e6bdccc32195"


//登录
#define LoginUrl @"http://wz.qichecdn.com/ashx/GetUserFavorites.ashx?&user_id=1475856&token=2&platform=2&version=3.2.0&qd=kqzs_cpa_test_w&_timestamp=1445674163&_sign=be6a5b4b4613d1488235b8451bcb296b"


#endif
