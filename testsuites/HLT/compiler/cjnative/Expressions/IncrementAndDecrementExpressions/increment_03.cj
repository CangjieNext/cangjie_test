/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

// struct成员函数中使用函数成员变量b++
main(): Int64 {
    return run()
}

struct COO {
    public var a: Int32 = 1
    public var b: Int32 = 1
    public func foo(x: Int32): Int32 {
        var c = a + b + x
        c++
        return c
    }
    public init() {}
}

func run(): Int64 {
    var coo: COO = COO()
    var res1: Int32 = coo.foo(1)
    if (res1 == 4) {
        return 0
    }
    return 1
}
