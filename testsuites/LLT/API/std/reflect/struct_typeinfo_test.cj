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
 * Test class StructTypeInfo
 *
 * Test API:
 *      public prop constructors: Collection<ConstructorInfo>
 *      public prop instanceVariables: Collection<InstanceVariableInfo>
 *      public prop staticVariables: Collection<StaticVariableInfo>
 *      public func getConstructor(parameterTypes: Array<TypeInfo>): Option<ConstructorInfo>
 *      public func getInstanceVariable(name: String): Option<InstanceVariableInfo>
 *      public func getStaticVariable(name: String): Option<StaticVariableInfo>
 */

import std.reflect.*

@Test
class StructTypeInfoTest {
    @TestCase
    func testStruct(): Unit {
        let ti = (TypeInfo.of<ST>() as StructTypeInfo).getOrThrow()

        @Expect(ti.constructors.size, 2)
        @Expect(ti.instanceFunctions.size, 2)
        @Expect(ti.staticFunctions.size, 2)
        @Expect(ti.instanceVariables.size, 2)
        @Expect(ti.staticVariables.size, 2)
        @Expect(ti.instanceProperties.toArray().toString(), "[mut prop a: Int64]")
        @Expect(ti.staticProperties.toArray().toString(), "[static mut prop c: Float64]")
        let ctor1 = ti.getConstructor(Array<TypeInfo>())
        let ctor2 = ti.getConstructor(parseParameterTypes(""))
        @Expect(ctor1.toString(), ctor2.toString())
        @Expect((ti.construct() as ST).getOrThrow().a == 0)
        @Expect((ti.construct(1) as ST).getOrThrow().a == 0)
        try {
            ti.construct(1, 2)
        } catch (e: InfoNotFoundException) {}
        @Expect((ctor1.apply() as ST).getOrThrow().a == 0)
        let v1 = ti.getInstanceVariable("_a")
        let v2 = ti.getStaticVariable("_c")
        @Expect(v1.toString(), "_a: Int64")
        @Expect(v2.toString(), "static _c: Float64")
        let f1 = ti.getInstanceFunction("f1", TypeInfo.of<Int64>())
        let f2 = ti.getStaticFunction("f2", TypeInfo.of<Int64>())
        @Expect(f1.toString(), "func f1(Int64): Unit")
        @Expect(f2.toString(), "static func f2(Int64): Unit")
    }
}

public struct ST {
    public var _a = 0
    public var _b = true
    public static var _c = 1.1
    public static var _d = "1"
    public init() {}
    public init(a: Int64) {}
    public mut prop a: Int64 {
        get() {
            _a
        }
        set(v) {
            _a = v
        }
    }
    public mut static prop c: Float64 {
        get() {
            _c
        }
        set(v) {
            _c = v
        }
    }
    public func f1() {}
    public func f1(a: Int64) {}
    public static func f2() {}
    public static func f2(a: Int64) {}
}
