//
//  YTNetworkManager.m
//  蓦然
//
//  Created by yt on 15/12/3.
//  Copyright © 2015年 yt. All rights reserved.
//

#import "YTNetworkManager.h"

#define SERVER_ADDR @"http://moran.chinacloudapp.cn/moran/web"

#define REGIST              @"/user/register"   //注册
#define LOGIN               @"/user/login"      //登陆
#define RENAME              @"/user/rename"     //更改用户名
#define UPDATE_PROFILE      @"/user/avatar"     //上传头像
#define GET_PROFILE         @"/user/show"       //显示头像

#define GET_COMMENT         @"/comment"         //获取评论列表
#define VIEW_COMMET         @"/comment/view"    //查看评论
#define CREATE_COMMET       @"/comment/create"  //创建评论
#define UPDATE_COMMENT      @"/comment/update"  //编辑评论
#define DELETE_COMMNET      @"/comment/delete"  //删除评论

#define GET_LOCATION        @"/node/list"       //获取地理位置列表
#define PICTURE_CREATE      @"/picture/create"  //上传图片
#define PICTURE_READ        @"/picture/read"    //访问图片


@implementation YTNetworkManager

+ (YTNetworkManager *) manager {
    static YTNetworkManager * s_networkManager = nil;
    static dispatch_once_t s_onceToken;
    
    dispatch_once(&s_onceToken, ^{
        s_networkManager = [YTNetworkManager new];
    });
    
    return s_networkManager;
}

- (instancetype) init {
    if (self = [super init]) {
        
    }
    return self;
}

//@flag 发送请求信息
- (void) postRequest:(NSDictionary *)paramDic subAddr:(NSString *) subAddr {
    
    NSURL *url = [NSURL URLWithString:[SERVER_ADDR stringByAppendingString:subAddr]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.timeoutInterval = 5.0;
    request.HTTPMethod = @"POST";
    
    NSMutableString * paramStr = [NSMutableString new];
    NSArray *keyArray = [paramDic allKeys];
    for (NSString *key in keyArray) {
        NSString *subParam = [NSString stringWithFormat:@"&%@=%@", key, [paramDic valueForKey:key]];
        [paramStr appendString:subParam];
    }
    
    [paramStr deleteCharactersInRange:NSMakeRange(0, 1)];
    request.HTTPBody = [paramStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLConnection *urlConnection;
    urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnection delegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    if (!_replyData) {
        _replyData = [NSMutableData new];
    } else {
        [_replyData setLength:0];
    }
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data{
    [_replyData appendData:data];
}

- (void) connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error{
    NSLog(@"Connection failed! Error - %@ %@",[error localizedDescription],[[error userInfo] objectForKey:NSURLErrorFailingURLErrorKey]);
}

- (void) connectionDidFinishLaoding:(NSJSONSerialization *)connection{
    NSError *error = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:_replyData options:NSJSONReadingMutableContainers error:&error];
    
    _replyData = nil;
    
    if (error) {
        NSLog(@"解码失败！%@",[error localizedDescription]);
        return;
    }
    
    if (jsonDic.count <= 0) {
        NSLog(@"未能获取数据！");
        return;
    }
               
}

#pragma mark - requireMethod


//@flag 注册
- (void)registWithName:(NSString *)name password:(NSString *)password email:(NSString *)email gid:(NSString *)gid{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      name,     @"username",
                                      password, @"password",
                                      email,    @"email",
                                      gid,      @"gid",
                                      nil];
    [self postRequest:paramDic subAddr:REGIST];
}

//@flag 登陆
- (void) login:(NSString *)email password:(NSString *)password gid:(NSString *)gid{
    NSMutableDictionary * paramDic = [NSMutableDictionary dictionaryWithObjectsAndKeys:
                                      email,    @"email",
                                      password, @"password",
                                      gid,      @"gid",
                                      nil];
    [self postRequest:paramDic subAddr:LOGIN];
}

@end
