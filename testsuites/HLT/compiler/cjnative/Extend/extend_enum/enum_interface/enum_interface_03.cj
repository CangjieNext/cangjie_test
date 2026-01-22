/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan E1.f3


enum E1<T> {
    | AB
}

extend E1<Rune> {
    static func f3(a: UInt32): UInt32 {
        println("E1.f3")
        a
    }
}

main(): Unit {
    var c3 = E1.f3(2)
}
