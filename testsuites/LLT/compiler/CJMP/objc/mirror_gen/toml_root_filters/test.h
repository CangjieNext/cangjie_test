/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct N {
};

void N();

@interface K
@end

@interface U
@end

@interface P
@property U* u;
@end

@interface M
@property struct N* foo;
- (void)foo:(M*)value;
- (void)bar:(P*)value;
@property P* baz;
@end

