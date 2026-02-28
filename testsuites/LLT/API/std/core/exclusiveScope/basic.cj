/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.unittest.*

struct F {
    var a = 18
}
class G {
    var b = 38
}

@Test
class ExclusiveScopeTest {
    @TestCase
    func testStructValue() {
        let a = exclusiveScope { =>
            F()
        }
        @Assert(a.a == 18)
    }

    @TestCase
    func testClassValue() {
        let b = exclusiveScope { =>
            G()
        }
        @Assert(b.b == 38)
    }

    @TestCase
    func testInt32Value() {
        let c = exclusiveScope { =>
            Int32(17)
        }
        @Assert(c == 17)
    }

    @TestCase
    func testFloatValue() {
        let d = exclusiveScope { =>
            0.3e3
        }
        @Assert(d == 300.0)
    }

    @TestCase
    func testStringValue() {
        let e = exclusiveScope { =>
            "hello"
        }
        @Assert(e == "hello")
    }

    @TestCase
    func testBoolValue() {
        let f = exclusiveScope { =>
            true
        }
        @Assert(f == true)
    }

    @TestCase
    func testUnitValue() {
        let g = exclusiveScope { =>
            ()
        }
        @Assert(g == ())
    }
}
