/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// DEPENDENCE: ./utils
// EXEC: %compiler %cmp_opt -p utils --mock=on %compile_lib_opt --output p1.%middle
// EXEC: %compiler %cmp_opt p1.%middle %n.cj -o %output %cmp_utest_opt 2>&1
// EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import utils.*
import std.unittest.*
import std.unittest.mock.*
import std.unittest.testmacro.*
import std.unittest.mock.mockmacro.*

public interface Example {
    mut prop i: Int64
    mut prop p: String
    mut prop s: String
    mut prop e: Example
    prop g: Example

    func f(): Int64
}

@Test
public class ModeCombinations {
    @TestCase
    func modesAreRepeatable(): Unit {
        success {
            let p = mock<Example>(ReturnsDefaults, ReturnsDefaults, ReturnsDefaults, ReturnsDefaults)
            @Assert(p.f(), 0)
        }
    }

    @TestCase
    func bothWork(): Unit {
        success {
            let p = mock<Example>(ReturnsDefaults, ReturnsDefaults, ReturnsDefaults, ReturnsDefaults, SyntheticFields)
            @Assert(p.f(), 0)
            p.i = 55
            @Assert(p.i, 55)
        }
    }

    @TestCase
    func defaultsAndFieldsCombined(): Unit {
        success {
            let p = mock<Example>(ReturnsDefaults, SyntheticFields)
            @Assert(p.f(), 0)
            @Assert(p.i, 0)
            @Assert(p.i, 0)
            @Assert(p.i, 0)
            p.i = 55
            @Assert(p.i, 55)
            @Assert(p.s, "")
            @Assert(p.s, "")
            p.s = "foo"
            @Assert(p.s, "foo")
            @On(p.s = _).doesNothing()
            p.s = "bar"
            @Assert(p.s, "foo")
            @On(p.f()).returns(55)
            @Assert(p.f(), 55)
        }
    }

    @TestCase
    func defaultsAndFieldsCombined2(): Unit {
        success {
            let p = mock<Example>(ReturnsDefaults, SyntheticFields)
            @Assert(p.f(), 0)
            @Assert(p.i, 0)
            @Assert(p.i, 0)
            @Assert(p.i, 0)
            p.i = 55
            @Assert(p.i, 55)
            @Assert(p.s, "")
            @Assert(p.s, "")
            p.s = "foo"
            @Assert(p.s, "foo")
            @On(p.s = _).doesNothing()
            p.s = "bar"
            @Assert(p.s, "foo")
            @On(p.f()).returns(55)
            @Assert(p.f(), 55)
        }
    }

    @TestCase
    func shouldReportFieldNotSet(): Unit {
        runtimeException<UnhandledCallException>(["Trying to read value of property e before it was set."]) {
            let p = mock<Example>(SyntheticFields, ReturnsDefaults)
            p.e
        }
    }

    @TestCase
    func shouldReportUseStub(): Unit {
        runtimeException<UnhandledCallException>(
            [
                "Trying to read value of readonly property g.",
                "Use stubs"
            ]
        ) {
            let p = mock<Example>(SyntheticFields, ReturnsDefaults)
            p.g
        }
    }
}
