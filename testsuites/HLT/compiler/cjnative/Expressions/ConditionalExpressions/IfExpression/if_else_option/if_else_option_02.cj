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
// ASSERT: scan key1 = Some(C)

public func calc(): Int64 {
    8
}

main(): Unit {
    let a = calc()
    let key1 = if (a == 7) {
        Option<String>.Some("A")
    } else if (a == 9) {
        throw UnsupportedException()
    } else {
        "C"
    }
    println("key1 = ${key1}")
}
