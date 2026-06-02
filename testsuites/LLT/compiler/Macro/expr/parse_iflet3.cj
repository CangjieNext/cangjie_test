// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import std.ast.*

main() {
    var a = quote(let a <- 1)
    var b = (parseExpr(a) as LetPatternExpr).getOrThrow()
    var res = match (b) {
        case x: LetPatternExpr => 0
        case _ => 1
    }
    if (res != 0) {
        return res
    }
    res = match ((b.pattern as VarOrEnumPattern).getOrThrow()) {
        case y: VarOrEnumPattern => 0
        case _ => 2
    }
    if (res != 0) {
        return res
    }
    res = match ((b.expr as LitConstExpr).getOrThrow()) {
        case z: LitConstExpr => 0
        case _ => 3
    }
    return res
}
