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
interface A {
    static func test(input: Int32): Int64 {
        1
    }
    static func test(input: Int64): Int64 {
        2
    }
}

class Test <: A {}

class B {
    public static func test(input: Int32): Int64 {
        1
    }
    public static func test(input: Int64): Int64 {
        2
    }
}

abstract class C {
    public static func test(input: Int32): Int64 {
        1
    }
    public static func test(input: Int64): Int64 {
        2
    }
}

main() {
    if (Test.test(1) != 2) {
        return 1
    }
    if (B.test(1) != 2) {
        return 2
    }
    if (C.test(1) != 2) {
        return 3
    }
    return 0
}
