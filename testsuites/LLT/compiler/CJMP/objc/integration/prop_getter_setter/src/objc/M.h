// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

#import <Foundation/Foundation.h>
#import <stddef.h>

@interface M : NSObject

@property (getter=getFoo, setter=updateFoo:) int64_t foo;
@property (getter=getBar) double_t bar;
@property (setter=applyBaz:) int32_t baz;
@property (getter=isQux) bool _qux;
@property (setter=writeCar:) int64_t _car;
@property (getter=retrieveMap, setter=sendMap:) int64_t _map;
@property (class, getter=takeHat, setter=putHat:) int32_t hat;

- (id)init;

@end
