/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import <Foundation/Foundation.h>
struct S  {
int x;
int y;
};

@protocol P <NSObject>
- (void)pFoo;
@end

@interface M :NSObject <P>
- (id)init;
- (void)mFoo;
- (struct S*)mFoo1:(struct S*)p0;
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0;
- (M*)mFoo3:(M*)p0;
- (id<P>)mFoo4:(id<P>)p0;
@end
