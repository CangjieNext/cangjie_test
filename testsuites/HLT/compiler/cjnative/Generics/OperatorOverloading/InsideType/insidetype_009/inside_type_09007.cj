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

open class A<T> {
    public static func test(): Int64 {
        1
    }
    public static let i: Int64 = 1
    public operator func *(input_b: A<T>): Bool {
        var a = i
        var b = test()
        var f = A<Int32>.i
        var g = A<Int32>.test()
        return true
    }
}

class B <: A<Int32> {}

main(): Int64 {
    var a: B = B()
    if (a * a) {
        return 0
    }
    return 1
}
