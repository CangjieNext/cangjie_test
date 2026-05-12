/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (not MAC) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output 
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args  
import std.reflect.*

@Annotation
public class Annotation1 {
    public let i: Int64 = 2
    public const init() {}
}

@Annotation
public class Annotation2 {
    public let i: Int64 = 3
    public const init() {}
}

class Foo {
    public var ab: Int64 = 0
    @Annotation1
    public var length: Int64 = 4

    public var width: Int64 = 5

    @Annotation1
    @Annotation1
    public var myName: String = ""

    @Annotation1
    public mut prop l: Int64 {
        get() {
            println("get")
            ab
        }
        set(value) {
            println("set")
            ab = value
        }
    }

    public mut prop m: Int64 {
        get() {
            println("get")
            ab
        }
        set(value) {
            println("set")
            ab = value
        }
    }

    @Annotation1
    @Annotation1
    public mut prop n: Int64 {
        get() {
            println("get")
            ab
        }
        set(value) {
            println("set")
            ab = value
        }
    }
    @Annotation1
    @Annotation2
    public func a(): Int64 {
        return 0
    }

    @Annotation1
    @Annotation1
    public func b(): Int64 {
        return 1
    }

    public func c(): Float64 {
        return 1.2
    }

    @Annotation1
    public init() {
    }
}

@Annotation1
class Foo2 {
    @Annotation1
    @Annotation2
    public func a(): Int64 {
        return 0
    }

    @Annotation1
    @Annotation1
    public func b(): Int64 {
        return 1
    }

    public func c(): Float64 {
        return 1.2
    }
    public var length: Int64 = 4
    public var width: Int64 = 5
    @Annotation1
    public var myName: String = ""
    public init(@Annotation1 name: String) {
        myName = name
    }
    public init() {
    }
    public init(@Annotation1 name: String, length: Int64, width: Int64) {
        myName = name
        this.length = length
        this.width = width
    }
}

@Annotation1
@Annotation1
class Foo3 {
    @Annotation1
    @Annotation2
    public func a(): Int64 {
        return 0
    }

    @Annotation1
    @Annotation1
    public func b(): Int64 {
        return 1
    }

    public func c(): Float64 {
        return 1.2
    }

    @Annotation1
    @Annotation1
    public init() {
    }
}

class Foo4 {
    public static var a: Int64 = 0
    @Annotation1
    public static var length: Int64 = 4
    @Annotation2
    public static var width: Int64 = 5

    @Annotation1
    @Annotation1
    public static var myName: String = ""

    @Annotation1
    public static func myName1(): String {
        "my name is Rectangular"
    }

    public static func myName2(): String {
        "my name is Rectangular2"
    }
    @Annotation1
    @Annotation1
    public static func myName3(): String {
        "my name is Rectangular3"
    }
    @Annotation1
    public mut static prop l: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    @Annotation2
    public mut static prop m: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }

    @Annotation1
    @Annotation1
    public mut static prop n: Int64 {
        get() {
            println("get")
            a
        }
        set(value) {
            println("set")
            a = value
        }
    }
}

@Test
class Test {
    // InstanceFunctionInfo::findAnnotation
    @TestCase
    func test0(): Unit {
        // 有相关注解，未重复标记
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("a").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect((TypeInfo.of<Foo>().getInstanceFunction("a").findAnnotation<Annotation2>().getOrThrow() as Annotation2).getOrThrow().i, 3)

        // 有相关注解，重复标记 
        @Expect(TypeInfo.of<Foo>().getInstanceFunction("b").findAnnotation<Annotation1>().isNone())
        // // 无相关注解
        @Expect(TypeInfo.of<Foo>().getInstanceFunction("c").findAnnotation<Annotation1>().isNone())
    }

    // ConstructorInfo::findAnnotation
    @TestCase
    func test1(): Unit {
        let constructorInfo = ClassTypeInfo.of<Foo>().getConstructor()
        @Expect((constructorInfo.findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(ClassTypeInfo.of<Foo2>().getConstructor().findAnnotation<Annotation1>().isNone())
        @Expect(ClassTypeInfo.of<Foo3>().getConstructor().findAnnotation<Annotation1>().isNone())
    }

    // InstancePropertyInfo::findAnnotation
    @TestCase
    func test2(): Unit {
        @Expect((TypeInfo.of<Foo>().getInstanceProperty("l").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)

        @Expect(TypeInfo.of<Foo>().getInstanceProperty("m").findAnnotation<Annotation1>().isNone())
        @Expect(TypeInfo.of<Foo>().getInstanceProperty("n").findAnnotation<Annotation1>().isNone())
    }
    // InstanceVariableInfo::findAnnotation
    @TestCase
    func test3(): Unit {
        let structTypeInfo = ClassTypeInfo.of<Foo>()
        @Expect((structTypeInfo.getInstanceVariable("length").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(structTypeInfo.getInstanceVariable("width").findAnnotation<Annotation1>() .isNone())
        @Expect(structTypeInfo.getInstanceVariable("myName").findAnnotation<Annotation1>().isNone())
    }
    // ParameterInfo::findAnnotation
    @TestCase
    func test4() {
        let constructorInfo = ClassTypeInfo.of<Foo2>().constructors
        for (i in constructorInfo) {
            // 获取 parameters
            for (j in i.parameters) {
                if (j.toString() == "String") {
                    @Expect((j.findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
                }
            }
        }
    }
    // StaticFunctionInfo::findAnnotation
    @TestCase
    func test5() {
        @Expect((TypeInfo.of<Foo4>().getStaticFunction("myName1").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(TypeInfo.of<Foo4>().getStaticFunction("myName2").findAnnotation<Annotation1>() .isNone())
        @Expect(TypeInfo.of<Foo4>().getStaticFunction("myName3").findAnnotation<Annotation1>() .isNone())
    }
    // StaticPropertyInfo::findAnnotation
    @TestCase
    func test6(): Unit {
        @Expect((TypeInfo.of<Foo4>().getStaticProperty("l").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(TypeInfo.of<Foo4>().getStaticProperty("m").findAnnotation<Annotation1>().isNone())
        @Expect((TypeInfo.of<Foo4>().getStaticProperty("m").findAnnotation<Annotation2>().getOrThrow() as Annotation2).getOrThrow().i, 3)
        @Expect(TypeInfo.of<Foo4>().getStaticProperty("n").findAnnotation<Annotation1>().isNone())
    }
    // StaticVariableInfo::findAnnotation
    @TestCase
    func test7(): Unit {
        let structTypeInfo = ClassTypeInfo.of<Foo4>()
        @Expect((structTypeInfo.getStaticVariable("length").findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(structTypeInfo.getStaticVariable("width").findAnnotation<Annotation1>() .isNone())
        @Expect((structTypeInfo.getStaticVariable("width").findAnnotation<Annotation2>().getOrThrow() as Annotation2).getOrThrow().i, 3)

        @Expect(structTypeInfo.getStaticVariable("myName").findAnnotation<Annotation1>().isNone())
    }

    // TypeInfo::findAnnotation
    @TestCase
    func test8(): Unit {
        @Expect(TypeInfo.of<Foo>().findAnnotation<Annotation1>().isNone())
        @Expect((TypeInfo.of<Foo2>().findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().i, 2)
        @Expect(TypeInfo.of<Foo3>().findAnnotation<Annotation1>().isNone())
    }
}
