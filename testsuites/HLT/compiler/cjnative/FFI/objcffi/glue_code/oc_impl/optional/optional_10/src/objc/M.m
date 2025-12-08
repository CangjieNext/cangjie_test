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
- (PM*)pFoo:(PM*)p0 {
    printf("pFoo\n");
    return p0;
}
- (void)mFoo {
    printf("mFoo\n");
}
- (struct S*)mFoo1:(struct S*)p0 {
    printf("mFoo1\n");
    return p0;
}
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0 {
    printf("mFoo2\n");
    return p0;
}
- (M*)mFoo3:(M*)p0 {
    printf("mFoo3\n");
    return p0;
}
- (id<P>)mFoo4:(id<P>)p0 {
    printf("mFoo4\n");
    return p0;
}
- (M**)mFoo5:(M**)p0 {
    printf("mFoo5\n");
    return p0;
}
@end
