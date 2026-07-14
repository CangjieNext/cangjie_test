/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@class M;

typedef M* PM;

@interface A
-(PM _Nonnull)foo;
@end

typedef A* PA;

@interface M : A
-(PA _Nullable)foo;
@end
