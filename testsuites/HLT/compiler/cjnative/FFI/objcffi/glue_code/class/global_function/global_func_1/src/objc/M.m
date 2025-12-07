/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
@implementation M
- (id)init{
self = [super init];
return self;
}
- (void)pFoo {
    NSLog(@"pFoo");
}
- (void)mFoo {
    NSLog(@"mFoo");
}
- (struct S*)mFoo1:(struct S*)p0 {
    NSLog(@"mFoo1");
    return p0;
}
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0 {
    NSLog(@"mFoo2");
    return p0;
}
- (M*)mFoo3:(M*)p0 {
    NSLog(@"mFoo3");
    return p0;
}
- (id<P>)mFoo4:(id<P>)p0 {
    NSLog(@"mFoo4");
    return p0;
}
- (M**)mFoo5:(M**)p0 {
    NSLog(@"mFoo5");
    return p0;
}
@end
