/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

abstract class FaTest {
    public var a: Int32 = 1
    public func f(x: Int32): Int32
}

class Test <: FaTest {
    public init(x: Int32) {
        a = super.f(x)
    }
    public func f(x: Int32): Int32 {
        return x + 1
    }
}

func run(): Int64 {
    var test: Test = Test(3)
    var res1: Int32 = test.a
    if (res1 == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan sema_abstract_method_cannot_be_accessed_directly
