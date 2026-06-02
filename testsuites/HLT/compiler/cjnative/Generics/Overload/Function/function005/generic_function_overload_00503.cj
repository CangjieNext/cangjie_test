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

interface A<T> {
    static func test(a: Int64) {
        return 1
    }
    static func test(a: T) {
        return 2
    }
}

class Test<T> <: A<T> {}

class B<T> {
    public static func test(a: Int64) {
        return 1
    }
    public static func test(a: T) {
        return 2
    }
}

struct C<T> {
    public static func test(a: Int64) {
        return 1
    }
    public static func test(a: T) {
        return 2
    }
}

main(): Int64 {
    var res1 = Test<Int32>.test(Int32(1))
    if (res1 != 2) {
        return 1
    }
    var res2 = B<Int32>.test(Int32(1))
    if (res2 != 2) {
        return 1
    }
    var res3 = B<Int32>.test(Int32(1))
    if (res3 != 2) {
        return 1
    }
    return 0
}
