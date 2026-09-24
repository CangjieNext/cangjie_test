/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A
// Should be renamed to 'foo_' because of a conflict with the property
- (void)foo:(int)x;

@property int foo;
- (void)bar:(int)x;
@property int baz;
@end

@interface M : A
// Should be renamed to 'foo_' because the base method is renamed
- (void)foo:(int)x;

// Should be hidden, the base property exists
@property int foo;

// Should be renamed to 'bar_' because of a conflict with the base method
@property int bar;

// Should be renamed to 'baz_' because of a conflict with the base property
- (void)baz:(int)x;

// Should be renamed to 'bazStatic' because of a conflict with an instance
// member.  But it conflicts with the already existing method. So, it should be
// 'bazStatic_'.
+ (void)baz:(int)x;

- (void)bazStatic;

// Should be renamed because of a conflict with the property.  It cannot be
// 'qux_' because of a conflict with the already existed method.  So, it should
// be 'qux__'.
- (void)qux:(int)x;

@property int qux;
- (void)qux_;
@end
