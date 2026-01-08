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
    printf("pFoo\n");
}
- (void)mFoo {
    printf("mFoo\n");
}
- (struct S*)mFoo1:(struct S*)p0 {
    printf("mFoo1");
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
- (void)testBox:(id)b {
    printf("testBox\n");
    if ([b respondsToSelector: @selector(mFoo)]) {
        printf("typecast in oc side success\n");
        [b mFoo];
    } else {
        printf("does not support mFoo\n");
    }
}
@end

@implementation Box

- (instancetype)initWithContent:(id)content {
    self = [super init];
    if (self) {
        _content = content;
    }
    return self;
}

- (id)getContent {
    return _content;
}

- (void)printContentType {
    printf("printContentType\n");
    if ([_content isKindOfClass: [M class]]) {
        M *m = (M *)_content;
        [m mFoo];
    }
}

@end
