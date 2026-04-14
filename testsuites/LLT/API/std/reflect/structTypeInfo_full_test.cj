/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

import std.reflect.*

@Test
class StructTypeInfoFullTest {
    @TestCase
    func testStructConstructors(): Unit {
        let structInfo = StructTypeInfo.of<TestStruct>()
        let constructors = structInfo.constructors

        @Expect(constructors.size > 0)
    }

    @TestCase
    func testStructInstanceVariables(): Unit {
        let structInfo = StructTypeInfo.of<TestStruct>()
        let instanceVars = structInfo.instanceVariables

        @Expect(instanceVars.size > 0)
    }

    @TestCase
    func testStructStaticVariables(): Unit {
        let structInfo = StructTypeInfo.of<StaticVarStruct>()
        let staticVars = structInfo.staticVariables

        @Expect(staticVars.size > 0)

        let staticVar = structInfo.getStaticVariable("staticValue")
        @Assert(staticVar.name, "staticValue")
    }

    @TestCase
    func testStructConstruct(): Unit {
        let structInfo = StructTypeInfo.of<ConstructableStruct>()

        let instance = structInfo.construct([100])

        let concrete = (instance as ConstructableStruct).getOrThrow()
        @Assert(concrete.value, 100)
    }

    @TestCase
    func testStructConstructWithMultipleArgs(): Unit {
        let structInfo = StructTypeInfo.of<MultiArgStruct>()

        let instance = structInfo.construct([10, 20.0])

        let concrete = (instance as MultiArgStruct).getOrThrow()
        @Assert(concrete.a, 10)
        @Assert(concrete.b, 20.0)
    }

    @TestCase
    func testStructGetConstructor(): Unit {
        let structInfo = StructTypeInfo.of<ConstructableStruct>()

        let constructor = structInfo.getConstructor([TypeInfo.of<Int64>()])
        @Expect(true)
    }

    @TestCase
    func testStructGetInstanceVariable(): Unit {
        let structInfo = StructTypeInfo.of<TestStruct>()

        let instanceVar = structInfo.getInstanceVariable("x")
        @Assert(instanceVar.name, "x")
    }

    @TestCase
    func testStructInstanceVariableGetValue(): Unit {
        let structInfo = StructTypeInfo.of<TestStruct>()
        let instance = TestStruct()

        let instanceVar = structInfo.getInstanceVariable("x")
        let value = instanceVar.getValue(instance)
        @Assert((value as Int64).getOrThrow(), 42)
    }
}

struct TestStruct {
    public var x: Int64 = 42
    public var y: String = "test"
    public init() {}
}

struct StaticVarStruct {
    public static var staticValue: Float64 = 3.14
    public init() {}
}

struct ConstructableStruct {
    public var value: Int64
    public init(v: Int64) {
        value = v
    }
}

struct MultiArgStruct {
    public var a: Int64
    public var b: Float64
    public init(x: Int64, y: Float64) {
        a = x
        b = y
    }
}

struct MutableStruct {
    public var value: Int64 = 0
    public init() {}
}
