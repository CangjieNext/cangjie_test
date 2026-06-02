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
 *      Test class InstancePropertyInfo
 */

import std.reflect.*

@Test
class InstancePropertyInfoTest {
    @TestCase
    func testClass(): Unit {
        let obj = A()
        let ti = TypeInfo.of(obj)
        let p1 = ti.getInstanceProperty("p1")
        @Assert(p1.toString(), "mut prop p1: Int64")
        let p2 = ti.getInstanceProperty("p2")
        @Assert(p2.toString(), "prop p2: default.B")
        let p3 = ti.getInstanceProperty("p3")
        @Assert(p3.toString(), "mut prop p3: default.B")

        @Assert((p1.getValue(obj) as Int64).getOrThrow(), 0)
        p1.setValue(obj, 1)
        @Assert((p1.getValue(obj) as Int64).getOrThrow(), 1)

        @Assert((p2.getValue(obj) as B).getOrThrow().toString(), "B0")
        try {
            p2.setValue(obj, B(1))
            @Expect(false)
        } catch (e: ReflectException) {}
        @Assert((p2.getValue(obj) as B).getOrThrow().toString(), "B0")

        @Assert((p3.getValue(obj) as B).getOrThrow().toString(), "B0")
        p3.setValue(obj, C(1))
        @Assert((p3.getValue(obj) as B).getOrThrow().toString(), "B2")
    }

    @TestCase
    @Skip
    func testStruct(): Unit {
        let obj = S()
        let ti = (TypeInfo.of(obj) as StructTypeInfo).getOrThrow()
        let p1 = ti.getInstanceProperty("p1")
        @Assert(p1.toString(), "mut prop p1: Int64")
        let p2 = ti.getInstanceProperty("p2")
        @Assert(p2.toString(), "prop p2: default.B")
        let p3 = ti.getInstanceProperty("p3")
        @Assert(p3.toString(), "mut prop p3: default.B")

        @Assert((p1.getValue(obj) as Int64).getOrThrow(), 0)
        try {
            p1.setValue(obj, 1)
            @Expect(false)
        } catch (e: ReflectException) {}
        @Assert((p1.getValue(obj) as Int64).getOrThrow(), 0)

        @Assert((p2.getValue(obj) as B).getOrThrow().toString(), "B0")
        try {
            p2.setValue(obj, B(1))
            @Expect(false)
        } catch (e: ReflectException) {}
        @Assert((p2.getValue(obj) as B).getOrThrow().toString(), "B0")
        @Assert((p3.getValue(obj) as B).getOrThrow().toString(), "B0")
        p3.setValue(obj, C(1))
        @Assert((p3.getValue(obj) as B).getOrThrow().toString(), "B2")
    }
}

public class A {
    public var _p1: Int64 = 0
    public mut prop p1: Int64 {
        get() {
            _p1
        }
        set(v) {
            _p1 = v
        }
    }
    public var _p2: B = B(0)
    public prop p2: B {
        get() {
            _p2
        }
    }
    public var _p3: B = B(0)
    public mut prop p3: B {
        get() {
            _p3
        }
        set(v) {
            _p3 = v
        }
    }
}

public open class B <: ToString {
    var _b: Int64
    public init(b: Int64) {
        _b = b
    }
    public func toString(): String {
        return "B${_b}"
    }
}

public class C <: B {
    public init(c: Int64) {
        super(c + 1)
    }
}

public struct S {
    public var _p1: Int64 = 0
    public mut prop p1: Int64 {
        get() {
            _p1
        }
        set(v) {
            _p1 = v
        }
    }
    public var _p2: B = B(0)
    public prop p2: B {
        get() {
            _p2
        }
    }
    public var _p3: B = B(0)
    public mut prop p3: B {
        get() {
            _p3
        }
        set(v) {
            _p3 = v
        }
    }
}
