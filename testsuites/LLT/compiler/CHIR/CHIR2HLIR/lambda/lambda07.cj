// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func test(): Int64 {
    func f(a: Int64, b: Int64): Int64 {
        return a + b
    }
    let sum = {f: (Int64, Int64) -> Int64, a: Int64, b: Int64 => f(a, b)}
    return sum(f, 0, 0)
}

main(): Int64 {
    return test()
}
