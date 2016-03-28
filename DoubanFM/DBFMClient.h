//
//  DBFMClient.h
//  DoubanFM
//
//  Created by cc on 16/3/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property (nonatomic, copy) NSString *user_id;
@property (nonatomic, copy) NSString *token;
@property (nonatomic, copy) NSString *expire;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *email;
- (void)updateWithDict: (id)json;
@end


@interface DBFMClient : NSObject
@property (nonatomic, readonly) User *user;
+ (DBFMClient *)sharedClient;
@end
