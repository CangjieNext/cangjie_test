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
import enums
import utils.*
import std.reflect.*
import std.collection.*
import std.sort.*
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

// 需要分别测试泛型T为值类型和引用类型时的正确性
@Test
class Test00 {
    @TestCase
    func test3(): Unit {
        // 通过EnumTypeInfo.get获取enum类型信息
        let enumTypeInfo = EnumTypeInfo.get("enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Assert((enumTypeInfo.construct("A") as ExhaustiveAssociatedOptionLikeT<CCCC>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<CCCC>.A)
        (enumTypeInfo.constructors |> collectArray)[1].toString() |> println
        EnumConstructorInfo.get("enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.B(enums.CCCC)").apply(CCCC(114514))
        @Assert((enumTypeInfo.construct("B(enums.CCCC)", [CCCC(114514)]) as ExhaustiveAssociatedOptionLikeT<CCCC>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<CCCC>.B(CCCC(114514)))
        // 通过getConstructor获取某个构造器
        // argsCount的缺省值为0，预期获得构造器A
        @Assert(enumTypeInfo.getConstructor("A").qualifiedName, "enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo.getConstructor("A").apply() as ExhaustiveAssociatedOptionLikeT<enums.CCCC>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A)
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo.getConstructor("A", argsCount: 0).annotations, [MyAnnotation()])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo.constructors, [
            EnumConstructor(qualifiedName: "enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A", name: "A"),
            EnumConstructor(qualifiedName: "enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.B(enums.CCCC)", name: "B", parameters: ["enums.CCCC"])
        ])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A)
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeT<enums.CCCC>>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A)
        @Assert(ci.qualifiedName, "enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A")
        @Assert[readOnlyList](vs, [])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("enums.ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A").apply([]) as ExhaustiveAssociatedOptionLikeT<enums.CCCC>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A)
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A).apply([]) as ExhaustiveAssociatedOptionLikeT<enums.CCCC>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A)
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A).getAssociatedValues(ExhaustiveAssociatedOptionLikeT<enums.CCCC>.A), [])
    }
    @TestCase
    func test4(): Unit {
        // 通过EnumTypeInfo.get获取enum类型信息
        let enumTypeInfo = EnumTypeInfo.get("enums.ExhaustiveAssociatedOptionLikeT<Int64>")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Assert[anyValue]((enumTypeInfo.construct("A") as ExhaustiveAssociatedOptionLikeT<Int64>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<Int64>.A)
        @Assert[anyValue]((enumTypeInfo.construct("B(Int64)", [123]) as ExhaustiveAssociatedOptionLikeT<Int64>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<Int64>.B(123))
        // 通过getConstructor获取某个构造器
        // argsCount的缺省值为0，预期获得构造器A
        @Assert(enumTypeInfo.getConstructor("A").qualifiedName, "enums.ExhaustiveAssociatedOptionLikeT<Int64>.A")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo.getConstructor("A").apply() as ExhaustiveAssociatedOptionLikeT<Int64>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<Int64>.A)
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo.getConstructor("A", argsCount: 0).annotations, [MyAnnotation()])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo.constructors, [
            EnumConstructor(qualifiedName: "enums.ExhaustiveAssociatedOptionLikeT<Int64>.A", name: "A"),
            EnumConstructor(qualifiedName: "enums.ExhaustiveAssociatedOptionLikeT<Int64>.B(Int64)", name: "B", parameters: ["Int64"])
        ])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(ExhaustiveAssociatedOptionLikeT<Int64>.A)
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<ExhaustiveAssociatedOptionLikeT<Int64>>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(ExhaustiveAssociatedOptionLikeT<Int64>.A)
        @Assert(ci.qualifiedName, "enums.ExhaustiveAssociatedOptionLikeT<Int64>.A")
        @Assert[readOnlyList](vs, [])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("enums.ExhaustiveAssociatedOptionLikeT<Int64>.A").apply([]) as ExhaustiveAssociatedOptionLikeT<Int64>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<Int64>.A)
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(ExhaustiveAssociatedOptionLikeT<Int64>.A).apply([]) as ExhaustiveAssociatedOptionLikeT<Int64>).getOrThrow(), ExhaustiveAssociatedOptionLikeT<Int64>.A)
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(ExhaustiveAssociatedOptionLikeT<Int64>.A).getAssociatedValues(ExhaustiveAssociatedOptionLikeT<Int64>.A), [])
    }
}
