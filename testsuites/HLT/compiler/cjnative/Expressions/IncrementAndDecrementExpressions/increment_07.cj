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

// class成员函数中使用父类成员变量a++
main(): Int64 {
    return run()
}

open class Base {
    public var base_a: Int32 = 2
}

class COO <: Base {
    public var a: Int32 = 1
    public var b: Int32 = 2
    public func foo(x: Int32): Int32 {
        super.base_a++
        this.a++
        return this.a + super.base_a
    }
}

func run(): Int64 {
    var coo: COO = COO()
    if (coo.foo(1) != 5) {
        return 1
    }
    return 0
}
