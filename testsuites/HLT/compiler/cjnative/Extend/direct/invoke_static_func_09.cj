/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
class A {}

extend A {
    public static func me(a: Unit, b: Int32, c: UInt64, d: Float32): Unit {
        return a
    }
}

main(): Int64 {
    if (A.me((), 1, 1, 1.0) == ()) {
        return 0
    }
    return 2
}
