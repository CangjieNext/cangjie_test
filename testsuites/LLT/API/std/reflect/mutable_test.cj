/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test func isMutable(): Bool
 */

import std.reflect.*

@Test
class MutableTest {
    @TestCase
	func testClass(): Unit {
        let ti = TypeInfo.of(A())
        @Assert(ti.getInstanceVariable("v1").isMutable(), true)
        @Assert(ti.getInstanceVariable("v2").isMutable(), true)
        @Assert(ti.getStaticVariable("v3").isMutable(), true)
        @Assert(ti.getStaticVariable("v4").isMutable(), true)
        @Assert(ti.getInstanceVariable("v5").isMutable(), false)
        @Assert(ti.getInstanceVariable("v6").isMutable(), false)
        @Assert(ti.getStaticVariable("v7").isMutable(), false)
        @Assert(ti.getStaticVariable("v8").isMutable(), false)

        @Assert(ti.getInstanceProperty("p1").isMutable(), true)
        @Assert(ti.getInstanceProperty("p2").isMutable(), true)
        @Assert(ti.getInstanceProperty("p3").isMutable(), false)
        @Assert(ti.getInstanceProperty("p4").isMutable(), false)
        @Assert(ti.getStaticProperty("p5").isMutable(), true)
        @Assert(ti.getStaticProperty("p6").isMutable(), true)
        @Assert(ti.getStaticProperty("p7").isMutable(), false)
        @Assert(ti.getStaticProperty("p8").isMutable(), false)
	}

	func testStruct(): Unit {
        let ti = (TypeInfo.of(B()) as StructTypeInfo).getOrThrow()
        @Assert(ti.getInstanceVariable("v1").isMutable(), true)
        @Assert(ti.getInstanceVariable("v2").isMutable(), true)
        @Assert(ti.getStaticVariable("v3").isMutable(), true)
        @Assert(ti.getStaticVariable("v4").isMutable(), true)
        @Assert(ti.getInstanceVariable("v5").isMutable(), false)
        @Assert(ti.getInstanceVariable("v6").isMutable(), false)
        @Assert(ti.getStaticVariable("v7").isMutable(), false)
        @Assert(ti.getStaticVariable("v8").isMutable(), false)

        @Assert(ti.getInstanceProperty("p1").isMutable(), true)
        @Assert(ti.getInstanceProperty("p2").isMutable(), true)
        @Assert(ti.getInstanceProperty("p3").isMutable(), false)
        @Assert(ti.getInstanceProperty("p4").isMutable(), false)
        @Assert(ti.getStaticProperty("p5").isMutable(), true)
        @Assert(ti.getStaticProperty("p6").isMutable(), true)
        @Assert(ti.getStaticProperty("p7").isMutable(), false)
        @Assert(ti.getStaticProperty("p8").isMutable(), false)
	}
}

public class A {
    public var v1 = 0
    public var v2 = "reflect"
    public static var v3 = 0
    public static var v4 = "reflect"
    public let v5 = 0
    public let v6 = "reflect"
    public static let v7 = 0
    public static let v8 = "reflect"

    public var _p1: Int64 = 0
    public mut prop p1: Int64 {
        get() {
            _p1
        }
        set(v) {
            _p1 = v
        }
    }
    public var _p2: String = "reflect"
    public mut prop p2: String {
        get() {
            _p2
        }
        set(v) {
            _p2 = v
        }
    }
    public var _p3: Int64 = 0
    public prop p3: Int64 {
        get() {
            _p3
        }
    }
    public var _p4: String = "reflect"
    public prop p4: String {
        get() {
            _p4
        }
    }
    public static var _p5: Int64 = 0
    public mut static prop p5: Int64 {
        get() {
            _p5
        }
        set(v) {
            _p5 = v
        }
    }
    public static var _p6: String = "reflect"
    public mut static prop p6: String {
        get() {
            _p6
        }
        set(v) {
            _p6 = v
        }
    }
    public static var _p7: Int64 = 0
    public static prop p7: Int64 {
        get() {
            _p7
        }
    }
    public static var _p8: String = "reflect"
    public static prop p8: String {
        get() {
            _p8
        }
    }
}

public struct B {
    public var v1 = 0
    public var v2 = "reflect"
    public static var v3 = 0
    public static var v4 = "reflect"
    public let v5 = 0
    public let v6 = "reflect"
    public static let v7 = 0
    public static let v8 = "reflect"

    public var _p1: Int64 = 0
    public mut prop p1: Int64 {
        get() {
            _p1
        }
        set(v) {
            _p1 = v
        }
    }
    public var _p2: String = "reflect"
    public mut prop p2: String {
        get() {
            _p2
        }
        set(v) {
            _p2 = v
        }
    }
    public var _p3: Int64 = 0
    public prop p3: Int64 {
        get() {
            _p3
        }
    }
    public var _p4: String = "reflect"
    public prop p4: String {
        get() {
            _p4
        }
    }
    public static var _p5: Int64 = 0
    public mut static prop p5: Int64 {
        get() {
            _p5
        }
        set(v) {
            _p5 = v
        }
    }
    public static var _p6: String = "reflect"
    public mut static prop p6: String {
        get() {
            _p6
        }
        set(v) {
            _p6 = v
        }
    }
    public static var _p7: Int64 = 0
    public static prop p7: Int64 {
        get() {
            _p7
        }
    }
    public static var _p8: String = "reflect"
    public static prop p8: String {
        get() {
            _p8
        }
    }
}
