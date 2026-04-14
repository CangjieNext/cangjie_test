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
class TypeInfoBoundaryTest {
    @TestCase
    func testTypeInfoNotFound(): Unit {
        try {
            TypeInfo.get("nonexistent.NonexistentType")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }

    @TestCase
    func testClassTypeInfoNotFound(): Unit {
        try {
            ClassTypeInfo.get("nonexistent.NonexistentClass")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }

    @TestCase
    func testInterfaceTypeInfoNotFound(): Unit {
        try {
            InterfaceTypeInfo.get("nonexistent.NonexistentInterface")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }

    @TestCase
    func testStructTypeInfoNotFound(): Unit {
        try {
            StructTypeInfo.get("nonexistent.NonexistentStruct")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }

    @TestCase
    func testInstanceFunctionNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getInstanceFunction("nonexistentMethod")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }

    @TestCase
    func testStaticFunctionNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getStaticFunction("nonexistentStaticMethod")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }

    @TestCase
    func testInstanceVariableNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getInstanceVariable("nonexistentVar")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }

    @TestCase
    func testStaticVariableNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getStaticVariable("nonexistentStaticVar")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }

    @TestCase
    func testInstancePropertyNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getInstanceProperty("nonexistentProp")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }

    @TestCase
    func testStaticPropertyNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<BoundaryTestClass>()

        try {
            classTypeInfo.getStaticProperty("nonexistentStaticProp")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(e.message.contains("not found"))
        }
    }
}

class BoundaryTestClass {
    public var existingVar: Int64 = 100
    public static var existingStaticVar: String = "test"

    public var _existingProp: Float64 = 1.0
    public mut prop existingProp: Float64 {
        get() {
            _existingProp
        }
        set(v) {
            _existingProp = v
        }
    }
    public static var _existingStaticProp: Bool = true
    public static mut prop existingStaticProp: Bool {
        get() {
            _existingStaticProp
        }
        set(v) {
            _existingStaticProp = v
        }
    }

    public func existingMethod(): Int64 {
        42
    }
    public static func existingStaticMethod(): String {
        "hello"
    }

    public init() {}
}

struct BoundaryTestStruct {
    public var value: Int64 = 0
    public init() {}
}
