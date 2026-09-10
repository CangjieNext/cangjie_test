/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A
- (void)foo;
- (void)foo:(int)x;
@end

@interface B : A
@end

@protocol P1
- (void)bar;
@end

@protocol P2
- (void)baz:(int)x;
@end

@protocol P3
- (void)baz;
@end

@interface M : B <P1, P2>
- (void)foo;
- (void)foo:(int)x;
@end
