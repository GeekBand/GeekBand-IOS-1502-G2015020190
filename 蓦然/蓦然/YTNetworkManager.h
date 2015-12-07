//
//  YTNetworkManager.h
//  蓦然
//
//  Created by yt on 15/12/3.
//  Copyright © 2015年 yt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YTNetworkManager : NSObject

//应答数据
@property (nonatomic) NSMutableData *replyData;

+ (YTNetworkManager *) manager;

- (void) registWithName: (NSString *)name password:(NSString *)password email:(NSString *)email gid:(NSString *)gid;

- (void) login: (NSString *)email password:(NSString *)password gid:(NSString *)gid;


@end
