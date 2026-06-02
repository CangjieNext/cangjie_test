/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class TypeInfo
 *          Test whether ClassTypeInfo is correct.
 * Test API:
 *      public static func of<T>(): TypeInfo
 */

import std.reflect.*
import std.collection.ArrayList

@Test
class classTypeInfoTest {
    @TestCase
    func normalApiTest(): Unit {
        let classTypeInfo = Bird() |> TypeInfo.of
        let constructorArray = classTypeInfo.constructors.toArray()
        @Expect(constructorArray[0].toString(), "init()")

        let staMemVarArray = classTypeInfo.staticVariables.toArray()
        @Expect(staMemVarArray[0].toString(), "static parm1: String")

        let insMemVarArray = classTypeInfo.instanceVariables.toArray()
        @Expect(insMemVarArray[0].toString(), "parm2: String")

        let superClass = classTypeInfo.superClass.getOrThrow()
        @Expect(superClass, TypeInfo.of(Animal()))
        @Expect(TypeInfo.of(Object()).superClass.isNone())

        let subclasses = classTypeInfo.sealedSubclasses.toArray()
        @Expect(subclasses.size, 0)

        let b = classTypeInfo.construct()
        @Expect(b is Bird)
        try {
            classTypeInfo.construct(1, 2)
            @Expect(false)
        } catch (e: InfoNotFoundException) {
        }
    }

    @TestCase
    func getVariableTest(): Unit {
        let classTypeInfo = Bird() |> TypeInfo.of
        let parm1 = classTypeInfo.getStaticVariable("parm1")
        @Expect(parm1.toString(), "static parm1: String")

        try {
            classTypeInfo.getStaticVariable("")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getStaticVariable("0parm1")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getStaticVariable("parm1/0")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getStaticVariable("Int64")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getStaticVariable("`break")
            @Expect(false)
        } catch (e: Exception) {
        }

        let parm2 = classTypeInfo.getInstanceVariable("parm2")
        @Expect(parm2.toString(), "parm2: String")

        try {
            classTypeInfo.getInstanceVariable("")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getInstanceVariable("0parm1")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getInstanceVariable("parm1/0")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getInstanceVariable("Int64")
            @Expect(false)
        } catch (e: Exception) {
        }

        try {
            classTypeInfo.getInstanceVariable("`break")
            @Expect(false)
        } catch (e: Exception) {
        }
    }

    @TestCase
    func testEnumVariable() {
        let ti = ClassTypeInfo.of<C>()
        @Expect(ti.instanceVariables.size, 3)
        let info = ti.getInstanceVariable("v2")
        let c = C()
        c.v2 = E2.M2(1, 2)
        let val = match (info.getValue(c) as E2) {
            case Some(E2.M2(v1, v2)) => (v1, v2)
            case Some(E2.M1) => "M1"
            case _ => throw Exception("xxx")
        }
        @Expect((val as (Int64, Int64)).getOrThrow()[0], 1)
        @Expect((val as (Int64, Int64)).getOrThrow()[1], 2)
    }

    @TestCase
    func testTupleVariable() {
        let ti = ClassTypeInfo.of<C>()
        let info = ti.getInstanceVariable("v3")
        let c = C()
        c.v3 = (100, "hello")
        let val = (info.getValue(c) as (Int64, String)).getOrThrow()
        @Expect(val[0], 100)
        @Expect(val[1], "hello")
    }

    @TestCase
    func testFunctionVariable() {
        let ti = ClassTypeInfo.of<C>()
        let info = ti.getInstanceVariable("v1")
        let c = C()
        c.v1 = {v: Int64 => v + 10}
        let val = (info.getValue(c) as (Int64) -> Int64).getOrThrow()(5)
        @Expect(val, 15)
    }
}

public open class Animal {
    public static let variety = "animal"
    public var _age = 1

    public func weight(): Unit {
        println("this animal's weight is 100kg")
    }

    public static func high(): Unit {
        println("this animal's high is 1m")
    }

    public mut prop age: Int64 {
        get() {
            _age
        }
        set(v) {
            _age = v
        }
    }
}

public interface Flyable {
    func fly(): Unit

    mut prop far: Int64
}

public class Bird <: Animal & Flyable {
    public static var parm1 = "p1"
    public var parm2 = "p2"
    static var _name = "kiki"
    var _color = "white"
    var _far = 100

    public init() {
        _color = "black"
    }

    public func fly(): Unit {
        println("this bird can fly")
    }

    public func eat(): Unit {
        println("this bird eat bugs")
    }

    public static func drink() {
        println("this bird drink water")
    }

    public mut prop color: String {
        get() {
            _color
        }
        set(v) {
            _color = v
        }
    }

    public mut prop far: Int64 {
        get() {
            _far
        }
        set(v) {
            _far = v
        }
    }

    public mut static prop name: String {
        get() {
            _name
        }
        set(v) {
            _name = v
        }
    }

    public func eat(food: Int64): Int64 {
        if (food < 100) {
            return 1
        } else {
            return 2
        }
    }

    public static func drink(drinks: Int64) {
        if (drinks == 1) {
            return 1
        } else {
            return 2
        }
    }
}

public enum E {
    | M1
    | M2(Int64)
}

public enum E2 {
    | M1
    | M2(Int64)
    | M2(Int64, Int64)
    | M3(Int64, String)
    | M3(Int64, String, C1)
    | M4(C1)
    | M5(E)

    public func foo(): Unit {
        println("foo")
    }
    public static func bar(): Unit {
    }
}

public class C1 {
    public C1(public var val: Int64) {}

    public init() {
        this.val = 0
    }
}


public class C {
    public var v1 = {v: Int64 => v * 2}
    public var v2: E2 = E2.M1
    public var v3: (Int64, String) = (42, "Universe")
}
