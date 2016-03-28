//
//  DBFMClient.m
//  DoubanFM
//
//  Created by cc on 16/3/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "DBFMClient.h"

@implementation User

- (void)updateWithDict:(id)json {
    self.user_id = json[@"user_id"];
    self.token = json[@"token"];
    self.expire = json[@"expire"];
    self.user_name = json[@"user_name"];
    self.email = json[@"email"];
}

@end


@implementation DBFMClient
+ (DBFMClient *)sharedClient {
    static DBFMClient *_self = NULL;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _self = [[DBFMClient alloc] init];
    });
    return _self;
}

- (instancetype)init {
    if (self = [super init]) {
        _user = [[User alloc] init];
    }
    return self;
}


@end
