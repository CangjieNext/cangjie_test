/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: echo "ast=%libdir/ast/ast.cjo" > ast.conf
// EXEC: %compiler %cmp_opt  %f %use_ast -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.ast.*

func test(): Option<Int64> {
    Some(quote(a)) ?? quote(a)
    return Some(0)
}

main(): Int64 {
    return test() ?? 1
}
