/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"

struct S global_struct = {
    1,
    2
};

@implementation M
- (id)init{
    self = [super init];
    if (self) {
        self->instanceVariable0 = ^{
            printf("instanceVariable0\n");
        };
        self->instanceVariable1 = ^(int input) {
            printf("instanceVariable1, input = %d\n", input);
            return input + 1;
        };
        self.instanceProperty0 = ^{
            printf("instanceProperty0\n");
            return;
        };
        self.instanceProperty1 = ^(float input){
            printf("instanceProperty1, input = %f\n", input);
            return input + 1.0;
        };
        self->v0 = &global_struct;
    }
    return self;
}
- (void)pFoo {
    printf("pFoo\n");
}
- (void (^)(void))P_instanceMethod:(void (^)(void))callBack {
    printf("P_instanceMethod\n");
    callBack();
    return callBack;
}
+ (void (^)(void))P_staticMethod:(void (^)(void))callBack {
    printf("P_staticMethod\n");
    callBack();
    return callBack;
}
- (void (^)(void))P_required_instanceMethod:(void (^)(void))callBack {
    printf("P_required_instanceMethod\n");
    callBack();
    return callBack;
}
+ (void (^)(void))P_required_staticMethod:(void (^)(void))callBack {
    printf("P_required_staticMethod\n");
    callBack();
    return callBack;
}
- (void)P_normal_optional_func {
    printf("P_normal_optional_func\n");
}
+ (void)P_normal_optional_static_method {
    printf("P_normal_optional_static_method\n");
}
- (void (^)(void))P_optional_instanceMethod:(void (^)(void))callBack {
    printf("P_optional_instanceMethod\n");
    callBack();
    return callBack;
}
+ (void (^)(void))P_optional_staticMethod:(void (^)(void))callBack {
    printf("P_optional_staticMethod\n");
    callBack();
    return callBack;
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
- (void)instanceMethod:(void (^)(void))callBack {
    printf("instanceMethod\n");
    if (callBack) {
        callBack();
    }
}
+ (void)staticMethod:(void (^)(void))callBack {
    printf("staticMethod\n");
    if (callBack) {
        callBack();
    }
}
@end
