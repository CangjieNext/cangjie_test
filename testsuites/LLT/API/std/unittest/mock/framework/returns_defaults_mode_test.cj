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
import std.collection.*

public abstract class ExampleClass {
    public func f1(): Unit
    public func f2(): Int16
    public func f3(): Int32
    public func f4(): Int64
    public func f5(): Bool
    public func f6(): Float32
    public func f7(): Float64
    public func f8(): Array<String>
    public func f9(): Array<ExampleClass>
    public func f10(): HashMap<Int64, ExampleClass>
    public func f11(): HashSet<Int32>
    public func f12(): Option<ExampleClass>
    public func f13(): Option<String>
    public func f14(): String
    public func f15(): ArrayList<String>
}

public abstract class Bar {
    public var v: Int = 0
    public mut prop p: Int
}

@Test
public class ReturnsDefaultsTest {
    @TestCase
    func testDefaultValues(): Unit {
        let e = mock<ExampleClass>(ReturnsDefaults)
        @Assert(e.f1() == ())
        @Assert(e.f2() == Int16(0))
        @Assert(e.f3() == Int32(0))
        @Assert(e.f4() == Int64(0))
        @Assert(e.f5() == false)
        @Assert(e.f6() == 0.0)
        @Assert(e.f7() == 0.0)

        @Assert(e.f8().isEmpty())
        @Assert(e.f9().isEmpty())

        @Assert(e.f10().isEmpty())
        let map1 = e.f10()
        let map2 = e.f10()
        @Assert(map1.isEmpty())
        @Assert(map2.isEmpty())
        map1[20] = e
        @Assert(map2.isEmpty())
        @Assert(!refEq(map1, map2))
        @Assert(e.f10().isEmpty())

        let set1 = e.f11()
        let set2 = e.f11()
        @Assert(set1.isEmpty())
        @Assert(set2.isEmpty())
        set1.add(55)
        @Assert(set2.isEmpty())
        @Assert(!refEq(set1, set2))
        @Assert(e.f11().isEmpty())

        @Assert(e.f12().isNone())
        @Assert(e.f13().isNone())
        @Assert(e.f14() == "")

        @Assert(e.f15().isEmpty())
    }

    @TestCase
    func propertiesAndFields(): Unit {
        success {
            let bar = mock<Bar>(ReturnsDefaults)
            @Assert(bar.v, 0)
            @Assert(bar.p, 0)
        }

        runtimeException<UnstubbedInvocationException>(["No stubs were specified for setter of field v."]) {
            let bar = mock<Bar>(ReturnsDefaults)
            bar.v = 10
        }
    }

    @TestCase
    func stubHasPriority(): Unit {
        success {
            let e = mock<ExampleClass>(ReturnsDefaults)
            @Assert(e.f14(), "")
            @Assert(e.f14(), "")
            @Assert(e.f14(), "")
            @On(e.f14()).returns("bar")
            @Assert(e.f14(), "bar")
            @Assert(e.f14(), "bar")
            @On(e.f14()).returns("foo").once()
            @Assert(e.f14(), "foo")
        }
    }

    @TestCase
    func defaultCallsCanBeVerified(): Unit {
        success {
            let e = mock<ExampleClass>(ReturnsDefaults)
            @Assert(e.f14(), "")
            @Assert(e.f14(), "")
            @Assert(e.f14(), "")
            @On(e.f14()).returns("bar")
            @Assert(e.f14(), "bar")
            Verify.that(@Called(e.f14()).times(4))
        }
    }
}
