/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_macro %f

macro package define

import std.ast.*

public macro test(input:Int64):Int64{ 
    input
}
// ASSERT: scan parse_macro_illegal_param_type
// ASSERT: scan parse_macro_illegal_ret_type
