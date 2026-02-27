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
        let enumTypeInfo = EnumTypeInfo.get("enums.NonExhaustiveAssociated0")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Expect((enumTypeInfo.construct("A") as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.A)
        // 同名但是关联值列表不同的构造器
        @Assert((enumTypeInfo.construct("A(Bool)", [true]) as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.A(true))
        // 对于有多个入参的构造器来说
        @Assert((enumTypeInfo.construct("B(Int64)", [123]) as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.B(123))
        // 通过getConstructor获取某个构造器
        // argsCount的缺省值为0，预期获得构造器A
        @Assert(enumTypeInfo.getConstructor("A").qualifiedName, "enums.NonExhaustiveAssociated0.A")
        @Assert(enumTypeInfo.getConstructor("A", argsCount: 1).qualifiedName, "enums.NonExhaustiveAssociated0.A(Bool)")
        // enum构造器的qualifiedName
        @Assert(enumTypeInfo.getConstructor("B", argsCount: 1).qualifiedName, "enums.NonExhaustiveAssociated0.B(Int64)")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo.getConstructor("A").apply() as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.A)
        @Assert((enumTypeInfo.getConstructor("B", argsCount: 1).apply([123]) as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.B(123))
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo.getConstructor("B", argsCount: 1).annotations, [MyAnnotation()])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo.constructors, [
            EnumConstructor(qualifiedName: "enums.NonExhaustiveAssociated0.A", name: "A"),
            EnumConstructor(qualifiedName: "enums.NonExhaustiveAssociated0.A(Bool)", name: "A", parameters: ["Bool"]),
            EnumConstructor(qualifiedName: "enums.NonExhaustiveAssociated0.B(Int64)", name: "B", parameters: ["Int64"])])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(NonExhaustiveAssociated0.A)
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<NonExhaustiveAssociated0>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(NonExhaustiveAssociated0.B(123))
        @Assert(ci.qualifiedName, "enums.NonExhaustiveAssociated0.B(Int64)")
        @Assert[readOnlyList](vs, [123])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("enums.NonExhaustiveAssociated0.A(Bool)").apply([false]) as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.A(false))
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(NonExhaustiveAssociated0.B(321)).apply([321]) as NonExhaustiveAssociated0).getOrThrow(), NonExhaustiveAssociated0.B(321))
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(NonExhaustiveAssociated0.B(321)).getAssociatedValues(NonExhaustiveAssociated0.B(123)), [123])
    }
}
