// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %disableSemaVic  %cmp_opt -Woff unused %n.cj 2>&1 | compare %f
// ASSERT: scan-not variable 'x' is used before initialization


func foo(cond: Bool): Int64 {
    var x: Int64
    if (cond) {
        return 1
    } else {
        x = 1
    }
    println(x)

    if (cond) {
        x = 1
    } else {
        throw Exception()
    }
    println(x)

    if (cond) {
        throw Exception()
    } else {
        return 1
    }

    return x
}

main(): Int32 {
    return 0
}
