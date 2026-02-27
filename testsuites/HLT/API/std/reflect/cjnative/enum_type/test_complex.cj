/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: utils enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p utils
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %f -L . -lutils -lenums %cmp_utest_opt -o %output
// (!(target_mac | target_ios)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package pkg

import enums.*
import utils.*
import std.reflect.*
import std.collection.*
import std.sort.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@Test
class Test00 {
    @TestCase
    func test2(): Unit {
        // 通过EnumTypeInfo.get获取enum类型信息
        let enumTypeInfo = EnumTypeInfo.get("enums.ComplexEnum0")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Expect((enumTypeInfo.construct("A(enums.SSSS)", [SSSS((555, Int32(444)))]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(SSSS((555, Int32(444)))))
        // 同名但是关联值列表不同的构造器
        @Assert((enumTypeInfo.construct("A(Int64, Bool)", [123, true]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(123, true))
        // 对于有多个入参的构造器来说
        @Assert((enumTypeInfo.construct("B(Tuple<Unit, Unit>)", [((), ())]) as ComplexEnum0).getOrThrow(), ComplexEnum0.B(((), ())))
        // 通过getConstructor获取某个构造器
        // argsCount的缺省值为0，预期获得构造器A
        @Assert(enumTypeInfo.getConstructor("A", argsCount: 1).qualifiedName, "enums.ComplexEnum0.A(enums.SSSS)")
        @Assert(enumTypeInfo.getConstructor("A", argsCount: 2).qualifiedName, "enums.ComplexEnum0.A(Int64, Bool)")
        // enum构造器的qualifiedName
        @Assert(enumTypeInfo.getConstructor("B", argsCount: 1).qualifiedName, "enums.ComplexEnum0.B(Tuple<Unit, Unit>)")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo.getConstructor("A", argsCount: 1).apply([SSSS((123, Int32(321)))]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(SSSS((123, Int32(321)))))
        @Assert((enumTypeInfo.getConstructor("A", argsCount: 2).apply([321, false]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(321, false))
        @Assert((enumTypeInfo.getConstructor("B", argsCount: 1).apply([((), ())]) as ComplexEnum0).getOrThrow(), ComplexEnum0.B(((), ())))
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo.getConstructor("B", argsCount: 1).annotations, [MyAnnotation()])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo.constructors, [
            EnumConstructor(qualifiedName: "enums.ComplexEnum0.A(enums.SSSS)", name: "A", parameters: ["enums.SSSS"]),
            EnumConstructor(qualifiedName: "enums.ComplexEnum0.A(Int64, Bool)", name: "A", parameters: ["Int64", "Bool"]),
            EnumConstructor(qualifiedName: "enums.ComplexEnum0.B(Tuple<Unit, Unit>)", name: "B", parameters: ["Tuple<Unit, Unit>"])])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(ComplexEnum0.A(SSSS((123, Int32(321)))))
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<ComplexEnum0>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(ComplexEnum0.A(SSSS((123, Int32(321)))))
        @Assert(ci.qualifiedName, "enums.ComplexEnum0.A(enums.SSSS)")
        @Assert[readOnlyList](vs, [SSSS((123, Int32(321)))])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("enums.ComplexEnum0.A(enums.SSSS)").apply([SSSS((123, Int32(321)))]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(SSSS((123, Int32(321)))))
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(ComplexEnum0.A(321, false)).apply([321, false]) as ComplexEnum0).getOrThrow(), ComplexEnum0.A(321, false))
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(ComplexEnum0.A(123, false)).getAssociatedValues(ComplexEnum0.A(321, true)), [321, true])
    }
    @TestCase
    func testMember(): Unit {
        let e = ComplexEnum0.A(SSSS((12, Int32(21))))
        let e1 = ComplexEnum0.A(SSSS((12, Int32(23))))
        let t = EnumTypeInfo.of(e)
        @Expect(t.instanceFunctions.size, 4)
        @Expect(t.instanceProperties.size, 1)
        @Expect(t.staticFunctions.size, 2)
        @Expect(t.staticProperties.size, 1)

        // 对enum实例调用运算符重载函数
        let eq = t.getInstanceFunction("==", [t])
        @Expect(eq.apply(e, [e1]) as Bool, Some(false))
        let ne = t.getInstanceFunction("!=", [t])
        @Expect(ne.apply(e, [e1]) as Bool, Some(true))
        // 对enum实例调用实例成员函数
        @Expect(t.getInstanceFunctions("toString").size, 2)
        let toString = t.getInstanceFunction("toString")
        @Expect(toString.apply(e) as String, Some(e.toString()))
        // 对enum实例访问实例成员属性
        let instanceProperty0 = t.getInstanceProperty("instanceProperty0")
        @Expect[anyValue](instanceProperty0.getValue(e) as (SSSS, ComplexEnum0), Some((SSSS((123, 321)), ComplexEnum0.B(((), ())))))
        // 对enum类型调用静态成员函数
        @Expect(t.getStaticFunctions("staticFunction0").size, 2)
        let f = {c: CCCC => (true, SSSS((c.xxxx, Int32(c.xxxx))))}
        let staticFunction0 = t.getStaticFunction("staticFunction0", [TypeInfo.of(f), TypeInfo.of<CCCC>()])
        @Expect[anyValue](staticFunction0.apply(t, [f, CCCC(233)]) as (Bool, SSSS), Some((true, SSSS((233, Int32(233))))))
        // 对enum类型访问静态成员属性
        let staticProperty0 = t.getStaticProperty("staticProperty0")
        @Expect[anyValue](staticProperty0.getValue() as (SSSS, ComplexEnum0), Some((SSSS((123, 321)), ComplexEnum0.B(((), ())))))
    }
    @TestCase
    func testSubType(): Unit {
        let e = ComplexEnum0.A(SSSS((12, Int32(21))))
        let t = EnumTypeInfo.of(e)
        @Expect(t.modifiers.size, 0)
        @Expect[interfaceTypeInfoList](t.superInterfaces |> collectSortedArray, ["Any", "Equal<enums.ComplexEnum0>", "Equatable<enums.ComplexEnum0>", "NotEqual<enums.ComplexEnum0>", "ToString"])
        @Expect(t.isSubtypeOf(t), true)
        @Expect(t.isSubtypeOf(TypeInfo.of<Equal<ComplexEnum0>>()), true)
        @Expect(t.isSubtypeOf(TypeInfo.of<ToString>()), true)
    }
    @TestCase
    func testMisc(): Unit {
        let e = ComplexEnum0.A(SSSS((12, Int32(21))))
        let e1 = ComplexEnum0.A(SSSS((12, Int32(23))))
        let t = EnumTypeInfo.of(e)
        let t1 = TypeInfo.of(e1)
        // EnumTypeInfo的注解
        @Expect(t.annotations.size, 1)
        @Expect(t.getAllAnnotations().size, 1)
        @Expect(t.findAllAnnotations<MyAnnotation>().size, 1)
        @Expect(t.findAnnotation<MyAnnotation>().getOrThrow().data, "hello")
        // EnumConstructorInfo的注解
        let eCons = t.getConstructor("A", argsCount: 1)
        @Expect(eCons.name, "A")
        @Expect(eCons.qualifiedName, "enums.ComplexEnum0.A(enums.SSSS)")
        @Expect(eCons.parameters.size, 1)
        @Expect[anyValue](EnumConstructorInfo.get("enums.ComplexEnum0.A(enums.SSSS)").apply([SSSS((123, Int32(321)))]), ComplexEnum0.A((SSSS((123, Int32(321))))))
        @Expect(eCons.findAllAnnotations<MyAnnotation>().size, 1)
        @Expect(eCons.findAnnotation<MyAnnotation>().getOrThrow().data, "default")
        @Expect(eCons.getAllAnnotations().size, 1)
        @Expect(eCons.hashCode(), eCons.hashCode())
        @Expect(eCons == EnumConstructorInfo.get("enums.ComplexEnum0.A(Int64, Bool)"), false)
        @Expect(eCons != eCons, false)
        @Expect(eCons.annotations.size, 1)
        @Expect(eCons.enumTypeInfo == t, true)
        @Expect(eCons.enumTypeInfo != TypeInfo.of<ComplexEnum0>(), false)
        @Expect(eCons.toString(), "enums.ComplexEnum0.A(enums.SSSS)")
        @Expect(t.hashCode(), t.hashCode())
        @Expect(t.toString(), "enums.ComplexEnum0")
        @Expect(t == t, true)
        @Expect(t != t1, false)
    }
}
