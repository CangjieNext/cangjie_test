// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %diag_json %f -o %output
// ASSERT: scan-1 macro_expect_one_expr
// ASSERT: scan the error originates in the macro `TwoExpr` (consider using `--debug-macro` for more info)


import define.*

func add(a: Int64, b: Int64): ?Int64 {
    let result = a + b

    return match {
        case @TwoExpr(a > 0) => result
        case _ => None
    }
}

main() {
    @Two var a = 1
    println(a)
    println(b)
}
