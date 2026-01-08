/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "P.h"
#import <Foundation/Foundation.h>
struct S  {
int x;
int y;
};

@interface M :NSObject <P> {
    struct S* v0;
    NSObject<P> *v1;
    M* v2;
    id<P> v3;
    @public
    // 定义 block 成员变量
    void (^instanceVariable0)(void);
    int (^instanceVariable1)(int input);
}
- (id)init;
- (void)mFoo;
- (struct S*)mFoo1:(struct S*)p0;
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0;
- (M*)mFoo3:(M*)p0;
- (id<P>)mFoo4:(id<P>)p0;
- (M**)mFoo5:(M**)p0;
// 实例方法入参类型和返回类型为block类型
- (void)instanceMethod:(void (^)(void))completion;
+ (void)staticMethod:(void (^)(void))callBack;

@property (nonatomic, readwrite) struct S* p0;
@property (nonatomic, readwrite) NSObject<P> * p1;
@property (nonatomic, readwrite) M* p2;
@property (nonatomic, readwrite) id<P> p3;
@property (nonatomic, copy) void (^instanceProperty0)(void);
@property (nonatomic, copy) double (^instanceProperty1)(float);
@end
