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
class OperatorOverloadTest {
    @TestCase
    func testInstanceFunctionInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let func1 = classTypeInfo.getInstanceFunction("testMethod")
        let func2 = classTypeInfo.getInstanceFunction("testMethod")

        @Expect(func1 == func2)
        @Expect(!(func1 != func2))
    }

    @TestCase
    func testStaticFunctionInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let func1 = classTypeInfo.getStaticFunction("staticMethod")
        let func2 = classTypeInfo.getStaticFunction("staticMethod")

        @Expect(func1 == func2)
        @Expect(!(func1 != func2))
    }

    @TestCase
    func testInstancePropertyInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let prop1 = classTypeInfo.getInstanceProperty("testProp")
        let prop2 = classTypeInfo.getInstanceProperty("testProp")

        @Expect(prop1 == prop2)
        @Expect(!(prop1 != prop2))
    }

    @TestCase
    func testStaticPropertyInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let prop1 = classTypeInfo.getStaticProperty("staticProp")
        let prop2 = classTypeInfo.getStaticProperty("staticProp")

        @Expect(prop1 == prop2)
        @Expect(!(prop1 != prop2))
    }

    @TestCase
    func testConstructorInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let ctor1 = classTypeInfo.getConstructor(Array<TypeInfo>())
        let ctor2 = classTypeInfo.getConstructor(Array<TypeInfo>())

        @Expect(ctor1 == ctor2)
        @Expect(!(ctor1 != ctor2))
    }

    @TestCase
    func testInstanceVariableInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let var1 = classTypeInfo.getInstanceVariable("instanceVar")
        let var2 = classTypeInfo.getInstanceVariable("instanceVar")

        @Expect(var1 == var2)
        @Expect(!(var1 != var2))
    }

    @TestCase
    func testStaticVariableInfoEquality(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let var1 = classTypeInfo.getStaticVariable("staticVar")
        let var2 = classTypeInfo.getStaticVariable("staticVar")

        @Expect(var1 == var2)
        @Expect(!(var1 != var2))
    }

    @TestCase
    func testDifferentFunctionsNotEqual(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let func1 = classTypeInfo.getInstanceFunction("testMethod")
        let func2 = classTypeInfo.getInstanceFunction("otherMethod")

        @Expect(func1 != func2)
        @Expect(!(func1 == func2))
    }

    @TestCase
    func testDifferentVariablesNotEqual(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let var1 = classTypeInfo.getInstanceVariable("instanceVar")
        let var2 = classTypeInfo.getInstanceVariable("otherVar")

        @Expect(var1 != var2)
        @Expect(!(var1 == var2))
    }

    @TestCase
    func testFunctionInfoHashCode(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let func1 = classTypeInfo.getInstanceFunction("testMethod")
        let func2 = classTypeInfo.getInstanceFunction("testMethod")

        @Assert(func1.hashCode(), func2.hashCode())
    }

    @TestCase
    func testVariableInfoHashCode(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let var1 = classTypeInfo.getInstanceVariable("instanceVar")
        let var2 = classTypeInfo.getInstanceVariable("instanceVar")

        @Assert(var1.hashCode(), var2.hashCode())
    }

    @TestCase
    func testPropertyInfoHashCode(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let prop1 = classTypeInfo.getInstanceProperty("testProp")
        let prop2 = classTypeInfo.getInstanceProperty("testProp")

        @Assert(prop1.hashCode(), prop2.hashCode())
    }

    @TestCase
    func testIsOpenFunction(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let funcInfo = classTypeInfo.getInstanceFunction("testMethod")
        @Expect(funcInfo.isOpen())
    }

    @TestCase
    func testIsOpenProperty(): Unit {
        let classTypeInfo = ClassTypeInfo.of<OperatorTestClass>()

        let propInfo = classTypeInfo.getInstanceProperty("testProp")
        @Expect(!propInfo.isOpen())
    }
}

class OperatorTestClass {
    public var instanceVar: Int64 = 100
    public var otherVar: String = "test"
    public static var staticVar: Float64 = 3.14

    public var _testProp: Int64 = 200
    public mut prop testProp: Int64 {
        get() {
            _testProp
        }
        set(v) {
            _testProp = v
        }
    }
    public static var _staticProp: Bool = true
    public static mut prop staticProp: Bool {
        get() {
            _staticProp
        }
        set(v) {
            _staticProp = v
        }
    }

    public open func testMethod(): Int64 {
        42
    }
    public func otherMethod(): String {
        "hello"
    }
    public static func staticMethod(): Int64 {
        99
    }

    public init() {}
}
