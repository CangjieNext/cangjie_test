/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (not O2) ERRCHECK: %compiler %cmp_opt %f -o %output

func foo<T>(a: T) {
    var b: Int32
    do {
        if (true) {
            continue
        }
        b = 1
    } while (b == 0)
    return a
}

main(): Int64 {
    var a = foo<Int64>(1)
    return a - 1
}
// ASSERT: scan sema_used_before_initialization
