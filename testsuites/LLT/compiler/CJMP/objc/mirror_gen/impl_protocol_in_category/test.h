/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@protocol A
@end

@interface M
@end

@interface P <A>
@end

@interface M (Category) <A>
- (void)foo;
@end

@interface P (Category) <A>
- (void)bar;
@end