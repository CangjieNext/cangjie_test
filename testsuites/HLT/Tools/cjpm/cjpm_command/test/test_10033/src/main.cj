/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package a

internal import std.unittest.*
import std.unittest.testmacro.*

var n: Int32 = 0
var count: Int32 = 0

@Test
public class TestA {
    @TestCase
    public func case1(): Unit {
        if (n == 1) {
            n++
        }
        @Assert(n, 2)
    }

    @TestCase
    public func case2(): Unit {
        if (n == 2) {
            n++
        }
        @Assert(n, 3)
    }

    @TestCase
    public func case3(): Unit {
        if (n == 3) {
            n++
        }
        @Assert(n, 4)
    }

    public override func afterAll(): Unit {
        n++
    }

    public override func beforeAll(): Unit {
        n++
    }
}

main() {}
