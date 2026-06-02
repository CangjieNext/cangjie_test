// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt_chir2hlir %noColor %f -o %output
// EXEC-PIPE-0: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan-4 ok

internal import std.ast.*

main() {
    var input = quote(f(inout a, inout b, inout c, inout d))
    let expr = parseExpr(input)
    if (expr is CallExpr) {
        var ce = (expr as CallExpr).getOrThrow()
        var args = ce.arguments
        for (arg in args) {
            println("ok")
        }
    }
    return 0
}
