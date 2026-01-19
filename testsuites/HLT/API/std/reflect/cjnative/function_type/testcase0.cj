/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %f %cmp_utest_opt -o %output
// (!(target_mac | target_ios)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args
package pkg

import std.reflect.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// 全局变量lambda
public let f: (x: Int64, y: Int64) -> String = {x: Int64, y: Int64 => "${x + y}"}
public let f1: (a: Int64, b: Float64) -> (Float64, Int64) = {a: Int64, b: Float64 => (b, a)}

// 全局函数
public func globalFunc(a: Int64, b: Int64): Int64 {
    return a + b
}

public class C {
    public func instanceFunc(a: Int64, b: Int64): Int64 {
        a + b
    }
    public static func staticFunc(a: Int64, b: Int64): Int64 {
        a + b
    }
}

public func genericFunc<T0, T1>(a: T0, b: T1): (b: T1, a: T0) {
    (b, a)
}

public func globalFunc1(a: Int64, b: Float64): (Float64, Int64) {
    (b, a)
}

public func bug(f: () -> Unit): Unit {
}

@Annotation
public class MyAnnotation <: Equatable<MyAnnotation> & ToString {
    public const MyAnnotation(public let data: String) {}
    public const init() {
        this.data = "default"
    }
    public operator func ==(another: MyAnnotation): Bool {
        this.data == another.data
    }
    public operator func !=(another: MyAnnotation): Bool {
        !(this == another)
    }
    public func toString(): String {
        "MyAnnotation"
    }
}

@Test
class Test0 {
    // 全局变量函数类型
    @TestCase
    func test0(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let globalF = pkgInfo.getVariable("f").getValue()
        let functionTypeInfo = FunctionTypeInfo.of(globalF)
        bug {
            let retValue = functionTypeInfo.apply(globalF, [2, 3]) as String
            retValue |> println
        }
    }
    // 全局函数
    @TestCase
    func test01(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        // 从PackageInfo获取某个全局函数的FunctionInfo
        let globalF = pkgInfo.getFunction("globalFunc", [TypeInfo.of<Int64>(), TypeInfo.of<Int64>()])
        // 获取全局函数的FunctionTypeInfo
        let functionTypeInfo = FunctionTypeInfo.of(globalFunc)
        // FunctionTypeInfo的qualifiedName是mangled
        @Expect(!functionTypeInfo.qualifiedName.isEmpty())
        // 通过FunctionTypeInfo来调用全局函数
        let retValue = (functionTypeInfo.apply(globalFunc, [1, 2]) as Int64).getOrThrow()
        @Expect(retValue, 3)
    }
    // 实例成员函数，有临时变量
    @TestCase
    func testInstanceFuncTempVar(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let c = C()
        let f = c.instanceFunc
        let functionTypeInfo = FunctionTypeInfo.of(f)
        let retValue = (functionTypeInfo.apply(f, [2, 3]) as Int64).getOrThrow()
        @Expect(retValue, 5)
    }
    // 实例成员函数，无临时变量
    @TestCase
    func testInstanceFuncNoTempVar(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let c = C()
        let functionTypeInfo = FunctionTypeInfo.of(c.instanceFunc)
        let retValue = (functionTypeInfo.apply(c.instanceFunc, [2, 3]) as Int64).getOrThrow()
        @Expect(retValue, 5)
    }

    // 静态成员函数，临时变量
    @TestCase
    func testStaticFuncTempVar(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let f = C.staticFunc
        let functionTypeInfo = FunctionTypeInfo.of(f)
        let retValue = (functionTypeInfo.apply(f, [2, 3]) as Int64).getOrThrow()
        @Expect(retValue, 5)
    }
    // 静态成员函数，无临时变量
    @TestCase
    func testStaticFuncNoTempVar(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let functionTypeInfo = FunctionTypeInfo.of(C.staticFunc)
        let retValue = (functionTypeInfo.apply(C.staticFunc, [2, 3]) as Int64).getOrThrow()
        @Expect(retValue, 5)
    }
    @TestCase
    func testGenericFuncTypeInfo(): Unit {
        let t = FunctionTypeInfo.of(genericFunc<Int64, Float64>)
        @Expect(!t.qualifiedName.isEmpty())
        @Expect(t.returnType.qualifiedName, "Tuple<Float64, Int64>")
        @Expect(t.parameters.size, 2)
        @Expect(t.parameters[0].qualifiedName, "Int64")
        @Expect(t.parameters[1].qualifiedName, "Float64")
        // 通过反射调用泛型函数
        let result = (t.apply(genericFunc<Int64, Float64>, [123, 3.14]) as (Float64, Int64)).getOrThrow()
        @Expect(result[0], 3.14)
        @Expect(result[1], 123)
    }
    @TestCase
    func testOfFunctionType(): Unit {
        // 给定函数类型，获取其FunctionTypeInfo
        let t = FunctionTypeInfo.of<(Int64, Float64) -> (Float64, Int64)>()
        @Expect(t.returnType.qualifiedName, "Tuple<Float64, Int64>")
        @Expect(t.parameters.size, 2)
        @Expect(t.parameters[0].qualifiedName, "Int64")
        @Expect(t.parameters[1].qualifiedName, "Float64")
        // 通过反射调用拥有相同函数签名的函数
        // 全局函数
        // let result1 = (t.apply(globalFunc1, [123, 3.14]) as (Float64, Int64)).getOrThrow()
        // @Expect(result1[0], 3.14)
        // @Expect(result1[1], 121233)

        // 泛型函数
        // let result = (t.apply(genericFunc<Int64, Float64>, [123, 3.14]) as (Float64, Int64)).getOrThrow()
        // @Expect(result[0], 3.14)
        // @Expect(result[1], 121233)

        // lambda变量
        let result1 = (t.apply(f1, [123, 3.14]) as (Float64, Int64)).getOrThrow()
        @Expect(result1[0], 3.14)
        @Expect(result1[1], 123)
    }

    public func genericTestHelper<T0, T1>(): Unit {
        // 尝试获取泛型函数类型
        let t = FunctionTypeInfo.of<(T0, T1) -> (T1, T0)>()
        @Expect(t.returnType.qualifiedName, "Tuple<Bool, String>")
        @Expect(t.parameters.size, 2)
        @Expect(t.parameters[0].qualifiedName, "String")
        @Expect(t.parameters[1].qualifiedName, "Bool")
    }
    @TestCase
    func testOfGenericFunctionType(): Unit {
        genericTestHelper<String, Bool>()
    }
    // 泛型函数，但是类型形参具有泛型约束，实例化时传入
    @TestCase
    func testNothing(): Unit {
        @Expect(TypeInfo.get("Nothing").qualifiedName, "Nothing")
        @Expect(TypeInfo.of<Nothing>().qualifiedName, "Nothing")
    }
    @TestCase
    func testMisc(): Unit {
        let t = FunctionTypeInfo.of<(Int64, Float64) -> (Float64, Int64)>()
        bug {
        @Expect(t.annotations.isEmpty())
        @Expect(t.findAllAnnotations<MyAnnotation>().isEmpty())
        @Expect(t.findAnnotation<MyAnnotation>().isNone())
        @Expect(t.getAllAnnotations().isEmpty())
            
        }
        @Expect(t.instanceFunctions.isEmpty())
        @Expect(t.instanceProperties.isEmpty())
        @Expect(t.modifiers.isEmpty())
        @Expect(t.name, "Closure<(Int64, Float64)->Tuple<Float64, Int64>>")
        @Expect(t.qualifiedName, "Closure<(Int64, Float64)->Tuple<Float64, Int64>>")
        @Expect(t.staticFunctions.isEmpty())
        @Expect(t.staticProperties.isEmpty())
        @Expect(t.superInterfaces.size, 1)
        @Expect(t.hashCode(), t.hashCode())
        @Expect(t.isSubtypeOf(t), true)
        @Expect(t.toString(), "Closure<(Int64, Float64)->Tuple<Float64, Int64>>")
        @Expect(t == t, true)
        @Expect(t != t, false)
    }
}
