// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// (Linux) EXEC-PIPE-1: export cjHeapSize=1GB && export JETVMPROP=-Xmx4G && %run %run_opt %output 2>&1 | compare %f
// (Windows) EXEC-PIPE-1: (set cjHeapSize=1GB) && (set JETVMPROP=-Xmx4G) && %run %run_opt %output 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan Out of memory

internal import std.collection.*

class C {
    let x1 = 42
    let x2 = 42
    let x3 = 42
    let x4 = 42
    let x5 = 42
}

main() {
    var a = ArrayList<C>()
    var b = [C(), C()]
    while (true) {
        a.add(all: b)
    }
    return 0
}
