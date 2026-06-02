// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// (not O2) ASSERT: scan 20
// (O2) ASSERT: scan 10

import std.collection.*

class C {
    let x1 = 42
    let x2 = 42
    let x3 = 42
    let x4 = 42
    let x5 = 42
}

main(): Int64 {
    try {
        let arrayVar = Array<Int64>(1000000000, {i => i * 2})
        print(10.toString())
    } catch (oom: OutOfMemoryError) {
        print(20.toString())
    }
    return 0
}
