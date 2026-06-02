// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*
import std.unittest.testmacro.*

class A {
    public var a: Int64
    public init(a: Int64) {
        this.a = a
    }
}

extend A <: Resource {
    public func isClosed(): Bool {
        println("this is isClosed!")
        return true
    }

    public func close(): Unit {
        println("this is close!")
    }
}

@Test
class PlayGround {
    @TestCase
    func playground1(): Unit {
        var ss: A
        try (ss = A(1)) {
            println("this is sucess try-with")
        }
    }
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
