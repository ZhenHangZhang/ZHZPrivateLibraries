//
//  Person.h
//  ZHZPrivateLibraries
//
//  Created by zhanghangzhen on 2016/11/18.
//  Copyright © 2016年 zhanghangzhen. All rights reserved.
//

#import <Realm/Realm.h>

@interface Person : RLMObject

@property NSString *firstName;
@property NSString *lastName;

@property NSString *yearsSinceBirth;
@property NSString *email;

@end
