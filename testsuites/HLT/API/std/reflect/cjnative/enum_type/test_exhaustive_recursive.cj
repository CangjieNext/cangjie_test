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
    func test0(): Unit {
        // 获取泛型enum类型信息
        let enumTypeInfo1 = EnumTypeInfo.get("enums.Tree<String>")
        let tree1 = enumTypeInfo1.construct("Leaf(String)", ["aaa"])
        let tree2 = enumTypeInfo1.construct("Leaf(String)", ["bbb"])
        // NonLeaf构造器
        let cons = enumTypeInfo1.getConstructor("NonLeaf", argsCount: 3)
        let nodeCons = enumTypeInfo1.getConstructor("Leaf", argsCount: 1)
        let tree = cons.apply([tree1, "ccc", tree2])
    }
    @TestCase
    func test2(): Unit {
        // 通过EnumTypeInfo.get获取enum类型信息
        let enumTypeInfo1 = EnumTypeInfo.get("enums.ExhaustiveRecursive1")
        let enumTypeInfo0 = EnumTypeInfo.get("enums.ExhaustiveRecursive0")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Assert((enumTypeInfo1.construct("C(enums.ExhaustiveRecursive0)", [enumTypeInfo0.construct("B(enums.ExhaustiveRecursive1)", [enumTypeInfo1.construct("D(Int32)", [123i32])])]) as ExhaustiveRecursive1).getOrThrow(), ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123i32))))
        // 通过getConstructor获取某个构造器
        @Assert(enumTypeInfo1.getConstructor("C", argsCount: 1).qualifiedName, "enums.ExhaustiveRecursive1.C(enums.ExhaustiveRecursive0)")
        @Assert(enumTypeInfo1.getConstructor("D", argsCount: 1).qualifiedName, "enums.ExhaustiveRecursive1.D(Int32)")
        // enum构造器的qualifiedName
        @Assert(enumTypeInfo0.getConstructor("B", argsCount: 1).qualifiedName, "enums.ExhaustiveRecursive0.B(enums.ExhaustiveRecursive1)")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo1.getConstructor("C", argsCount: 1).apply(enumTypeInfo0.getConstructor("B", argsCount: 1).apply(enumTypeInfo1.getConstructor("D", argsCount: 1).apply([123i32]))) as ExhaustiveRecursive1).getOrThrow(), ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123))))
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo1.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo1.getConstructor("C", argsCount: 1).annotations, [MyAnnotation("world")])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo1.constructors, [
            EnumConstructor(qualifiedName: "enums.ExhaustiveRecursive1.C(enums.ExhaustiveRecursive0)", name: "C", parameters: ["enums.ExhaustiveRecursive0"]),
            EnumConstructor(qualifiedName: "enums.ExhaustiveRecursive1.D(Int32)", name: "D", parameters: ["Int32"])])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(
            enumTypeInfo1.construct("C(enums.ExhaustiveRecursive0)",
                [enumTypeInfo0.construct("B(enums.ExhaustiveRecursive1)", [enumTypeInfo1.construct("D(Int32)", [123i32])])]))
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<ExhaustiveRecursive1>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(
            enumTypeInfo1.construct("C(enums.ExhaustiveRecursive0)",
                [enumTypeInfo0.construct("B(enums.ExhaustiveRecursive1)", [enumTypeInfo1.construct("D(Int32)", [123i32])])]))
        @Assert(ci.qualifiedName, "enums.ExhaustiveRecursive1.C(enums.ExhaustiveRecursive0)")
        @Assert[readOnlyList](vs, [ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123i32))])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("enums.ExhaustiveRecursive1.C(enums.ExhaustiveRecursive0)").apply([ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123))]) as ExhaustiveRecursive1).getOrThrow(), ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123))))
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123)))).apply([ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123))]) as ExhaustiveRecursive1).getOrThrow(), ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123))))
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(123)))).getAssociatedValues(ExhaustiveRecursive1.C(ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(321)))), [ExhaustiveRecursive0.B(ExhaustiveRecursive1.D(321))])
    }
}
