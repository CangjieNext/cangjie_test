// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(): Int64 {
    return 10
}

main(): Int64 {
    // literal
    var lit: Int64 = Int64(1 + 2 + 3 + 4 - 10);
    // binaryExpr
    var a: Int32 = 1
    var b: Int32 = 1
    var c: Int32 = 2
    var bin1: Int64 = Int64(a + b - c)
    // nested
    var nested = Int64(Int64(Int64(a + b - c)))
    // call function
    var func2 = Int64(test() - 10)

    if (lit != 0 || bin1 != 0) {
        return 1
    }
    if (nested != 0) {
        return 2
    }
    if (func2 != 0) {
        return 3
    }
    return 0
}
