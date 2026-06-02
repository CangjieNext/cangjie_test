// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func run(n: Int64): Bool {
    if (n > 3) {
        true
    } else {
        false
    }
}

main(): Int64 {
    var a = 11
    if (run(a)) {
        a = a + 10
    }
    return a - 21
}
