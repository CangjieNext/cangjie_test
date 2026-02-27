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
import std.collection.*

public let t: (a: Int64, b: String, c: Float64) = (2, "hello", 3.4)

// 在全局函数签名中使用元组类型
public func globalFunc(p1: (a: Int64, b: ArrayList<Int64>)): (a: ArrayList<Int64>, b: Int64) {
    (p1[1], p1[0])
}

// 元组类型中涉及类型形参
public func genericFunc<T>(p1: (a: Int64, b: T)): (a: T, b: Int64) {
    (p1[1], p1[0])
}

public enum E {
    // enum构造器形参类型为元组类型
    | A((String, Array<Int64>))
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
    @TestCase
    func globalVarTuple(): Unit {
        let tupleType = TupleTypeInfo.of(t)
        let elements = tupleType.destruct(t)
        let elementTypeInfos = tupleType.elements
    }
    @TestCase
    func globalFuncTuple(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let f = pkgInfo.getFunction("globalFunc", [TupleTypeInfo.of<(a: Int64, b: ArrayList<Int64>)>()])
        let result = (f.apply([(123, ArrayList<Int64>([1, 2, 3]))]) as (a: ArrayList<Int64>, b: Int64)).getOrThrow()
        @Expect(result[0].size, 3)
        @Expect(result[1], 123)
    }
    @TestCase
    func genericTuple(): Unit {
        let pkgInfo = PackageInfo.get("pkg")
        let fs = pkgInfo.getFunctions("genericFunc")
        @Expect(fs.size, 1)
        let f = fs[0]
        let result = (f
            .apply([TypeInfo.of<ArrayList<Int64>>()], [(123, ArrayList<Int64>([1, 2, 3]))]) as (a: ArrayList<Int64>, b: Int64))
            .getOrThrow()
        @Expect(result[0].size, 3)
        @Expect(result[1], 123)
    }
    // 在enum构造器中形参类型为元组类型
    @TestCase
    func enumConstructor(): Unit {
        let aCons = EnumTypeInfo.of<E>().getConstructor("A", argsCount: 1)
        let a = (aCons.apply([("asd", [1, 2, 3])]) as E).getOrThrow()
        match (a) {
            case E.A((s, arr)) =>
                @Expect(s, "asd")
                @Expect(arr, [1, 2, 3])
            case _ => @Assert(false)
        }
    }
    func genericTupleTestHelper<T0, T1>(): Unit {
        // 尝试获取泛型元组类型
        let t = TupleTypeInfo.of<(T1, T0)>()
        let t1 = TupleTypeInfo.of<(T0, T1)>()
        @Expect(t.qualifiedName, "Tuple<String, pkg.E>")
    }
    @TestCase
    func ofGenericTupleType(): Unit {
        genericTupleTestHelper<E, String>()
    }
    // 通过TypeInfo.get获取TupleTypeInfo
    @TestCase
    func typeInfoGetTupleType(): Unit {
        let t = TypeInfo.get("Tuple<String, pkg.E>")
        let t1 = TypeInfo.get("Tuple<pkg.E, String>")
        @Expect(t.qualifiedName, "Tuple<String, pkg.E>")
    }
    // 通过TupleTypeInfo.get获取TupleTypeInfo
    @TestCase
    func tupleTypeInfoGetTupleType(): Unit {
        let t = TupleTypeInfo.get("Tuple<pkg.E, String>")
        let t1 = TupleTypeInfo.get("Tuple<String, pkg.E>")
        @Expect(t.qualifiedName, "Tuple<pkg.E, String>")
    }
    // 通过TupleTypeInfo.of(xxx)获取TupleTypeInfo
    @TestCase
    func testTupleTypeInfoOfXXX(): Unit {
        let t = TupleTypeInfo.of(("xxx", 123))
        @Expect(t.qualifiedName, "Tuple<String, Int64>")
    }
    func genericTupleTestHelper<T0, T1>(a: T1, b: T0): Unit {
        let t = TupleTypeInfo.of((a, b))
        @Expect(t.qualifiedName, "Tuple<String, Int64>")
    }
    @TestCase
    func test00(): Unit {
        genericTupleTestHelper("xxx", 123)
    }
    @TestCase
    func testMisc(): Unit {
        let t = TupleTypeInfo.get("Tuple<pkg.E, String>")
        @Expect(t.annotations.isEmpty())
        @Expect(t.findAllAnnotations<MyAnnotation>().isEmpty())
        @Expect(t.findAnnotation<MyAnnotation>().isNone())
        @Expect(t.getAllAnnotations().isEmpty())
        @Expect(t.instanceFunctions.isEmpty())
        @Expect(t.instanceProperties.isEmpty())
        @Expect(t.modifiers.isEmpty())
        @Expect(t.name, "Tuple<pkg.E, String>")
        @Expect(t.qualifiedName, "Tuple<pkg.E, String>")
        @Expect(t.staticFunctions.isEmpty())
        @Expect(t.staticProperties.isEmpty())
        @Expect(t.superInterfaces.size, 1)
        @Expect(t.hashCode(), t.hashCode())
        @Expect(t.isSubtypeOf(t), true)
        @Expect(t.toString(), "Tuple<pkg.E, String>")
        @Expect(t == t, true)
        @Expect(t != t, false)
    }
}
