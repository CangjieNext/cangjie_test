/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

void f(int64_t* a) {printf("in oc f, %lld\n", *a);}

@implementation M
- (id)init{
self = [super init];
self->fptr = f;
return self;
}
- (void)pFoo {
    printf("pFoo\n");
}
- (void)mFoo {
    printf("mFoo\n");
}
- (struct S*)mFoo1:(struct S*)p0 {
    printf("mFoo1\n");
    return p0;
}
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0 {
    printf("mFoo2");
    return p0;
}
- (M*)mFoo3:(M*)p0 {
    printf("mFoo3");
    return p0;
}
- (id<P>)mFoo4:(id<P>)p0 {
    printf("mFoo4");
    return p0;
}
- (M**)mFoo5:(M**)p0 {
    printf("mFoo5");
    return p0;
}
@end
