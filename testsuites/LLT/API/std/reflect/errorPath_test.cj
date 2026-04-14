/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test reflect error paths
 *          Test immutable variable set error
 *          Test type mismatch errors
 *          Test info not found errors
 * Test API:
 *      InstanceVariableInfo.setValue(), StaticVariableInfo.setValue()
 *      InstanceFunctionInfo.apply(), TypeInfo.get(), etc.
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class ReflectErrorPathTest {
    @TestCase
    func testImmutableInstanceVariableSetError(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithImmutable>()
        let instance = TestClassWithImmutable()
        
        let immutableVar = classTypeInfo.getInstanceVariable("immutableValue")
        
        try {
            immutableVar.setValue(instance, "new value")
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testImmutableStaticVariableSetError(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithImmutable>()
        
        let immutableVar = classTypeInfo.getStaticVariable("staticImmutable")
        
        try {
            immutableVar.setValue("new value")
            @Expect(false)
        } catch (e: IllegalSetException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testInstanceVariableTypeMismatchError(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithMutable>()
        let instance = TestClassWithMutable()
        
        let mutableVar = classTypeInfo.getInstanceVariable("mutableValue")
        
        try {
            mutableVar.setValue(instance, "wrong type string")
            @Expect(false)
        } catch (e: IllegalTypeException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testStaticVariableTypeMismatchError(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithMutable>()
        
        let mutableVar = classTypeInfo.getStaticVariable("staticMutable")
        
        try {
            mutableVar.setValue("wrong type string")
            @Expect(false)
        } catch (e: IllegalTypeException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testTypeInfoNotFound(): Unit {
        try {
            TypeInfo.get("nonexistent.package.NonexistentClass")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testClassTypeInfoNotFound(): Unit {
        try {
            ClassTypeInfo.get("nonexistent.package.NonexistentClass")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testInterfaceTypeInfoNotFound(): Unit {
        try {
            InterfaceTypeInfo.get("nonexistent.package.NonexistentInterface")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testInstanceFunctionNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithMethods>()
        
        try {
            classTypeInfo.getInstanceFunction("nonexistentMethod")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testStaticFunctionNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithMethods>()
        
        try {
            classTypeInfo.getStaticFunction("nonexistentStaticMethod")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testInstanceVariableNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithVariables>()
        
        try {
            classTypeInfo.getInstanceVariable("nonexistentVar")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testStaticVariableNotFound(): Unit {
        let classTypeInfo = ClassTypeInfo.of<TestClassWithVariables>()
        
        try {
            classTypeInfo.getStaticVariable("nonexistentStaticVar")
            @Expect(false)
        } catch (e: InfoNotFoundException) {
            @Expect(true)
        }
    }
    
    @TestCase
    func testWrongInstanceForMethodCall(): Unit {
        let classTypeInfo1 = ClassTypeInfo.of<TestClassA>()
        let classTypeInfo2 = ClassTypeInfo.of<TestClassB>()
        
        let method = classTypeInfo1.getInstanceFunction("methodA")
        let instanceB = TestClassB()
        
        try {
            method.apply(instanceB as TestClassA, Array<Any>())
            @Expect(false)
        } catch (e: IllegalTypeException) {
            @Expect(true)
        }
    }
}

class TestClassWithImmutable {
    public let immutableValue: Int64 = 100
    public static let staticImmutable: String = "immutable"
    
    public init() {}
}

class TestClassWithMutable {
    public var mutableValue: Int64 = 200
    public static var staticMutable: Float64 = 3.14
    
    public init() {}
}

class TestClassWithMethods {
    public func existingMethod(): Int64 { 42 }
    public static func existingStaticMethod(): String { "hello" }
    
    public init() {}
}

class TestClassWithVariables {
    public var existingVar: Int64 = 300
    public static var existingStaticVar: Float64 = 2.71
    
    public init() {}
}

class TestClassA {
    public func methodA(): Int64 { 1 }
    public init() {}
}

class TestClassB {
    public func methodB(): Int64 { 2 }
    public init() {}
}