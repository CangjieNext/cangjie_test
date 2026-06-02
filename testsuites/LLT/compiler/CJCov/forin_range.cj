// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

func run(): Int64 {
    var a: Int64 = 0
    var b: Int64 = 100
    for (i in 0..b) {
        a = a + 1
    }
    if (a == b) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
