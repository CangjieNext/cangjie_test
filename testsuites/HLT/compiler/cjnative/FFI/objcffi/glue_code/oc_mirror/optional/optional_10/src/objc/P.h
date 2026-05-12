/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 #import <Foundation/Foundation.h>

@interface PM :NSObject
- (id)init;
- (void)pmFoo;
@end

@protocol P <NSObject>
- (PM*)pFoo:(PM*)p0;
@property (nonatomic, readwrite) struct S* pp0;
@property (nonatomic, readwrite) PM* pp2;
@property (nonatomic, readwrite, assign) int pp3;
@end
