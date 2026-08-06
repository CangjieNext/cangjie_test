/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@protocol P
@end

@interface NSObject
@end

@interface M<T> : NSObject
- (instancetype)initWithThing:(T <P>)thing;
- (instancetype)initWithProtocol:(id<P>)thing;
@end