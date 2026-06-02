// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    func add(n: Int64, m: Int64, k: Int64, l: Int64) {
        n + m + k + l
    }
    var mul = {n: Int64, m: Int64, k: Int64, l: Int64 => m * n * k * l}
    return mul(1, 2, 3, 4) - add(1, 2, 3, 4) - 14
}
