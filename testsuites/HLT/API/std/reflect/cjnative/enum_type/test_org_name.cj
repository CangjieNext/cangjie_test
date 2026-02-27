/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// description: 验证带有组织名的enum的反射操作
// DEPENDENCE: utils org_enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p utils
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %compile_lib_opt -p org_enums
// (!(target_mac | target_ios)) EXEC: %compiler %cmp_opt %f -L . -lutils -lenums@org %cmp_utest_opt -o %output
// (!(target_mac | target_ios)) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

package pkg

import org::enums.*
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
        let enumTypeInfo = EnumTypeInfo.get("org::enums.ExhaustiveAssociatedNonRef")
        // 对EnumTypeInfo调用construct，给定构造器名与实参实例化enum
        @Expect((enumTypeInfo.construct("A(org::enums.SSSS)", [SSSS((555, Int32(444)))]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(SSSS((555, Int32(444)))))
        // 同名但是关联值列表不同的构造器
        @Assert((enumTypeInfo.construct("A(Int64, Bool)", [123, true]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(123, true))
        // 对于有多个入参的构造器来说
        @Assert((enumTypeInfo.construct("B(Tuple<Unit, Unit>)", [((), ())]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.B(((), ())))
        // 通过getConstructor获取某个构造器
        // argsCount的缺省值为0，预期获得构造器A
        @Assert(enumTypeInfo.getConstructor("A", argsCount: 1).qualifiedName, "org::enums.ExhaustiveAssociatedNonRef.A(org::enums.SSSS)")
        @Assert(enumTypeInfo.getConstructor("A", argsCount: 2).qualifiedName, "org::enums.ExhaustiveAssociatedNonRef.A(Int64, Bool)")
        // enum构造器的qualifiedName
        @Assert(enumTypeInfo.getConstructor("B", argsCount: 1).qualifiedName, "org::enums.ExhaustiveAssociatedNonRef.B(Tuple<Unit, Unit>)")
        // 通过EnumConstructorInfo来调用apply来构造enum实例
        @Assert((enumTypeInfo.getConstructor("A", argsCount: 1).apply([SSSS((123, Int32(321)))]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(SSSS((123, Int32(321)))))
        @Assert((enumTypeInfo.getConstructor("A", argsCount: 2).apply([321, false]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(321, false))
        @Assert((enumTypeInfo.getConstructor("B", argsCount: 1).apply([((), ())]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.B(((), ())))
        // 获取enum类型声明的注解
        @Assert[annotations](enumTypeInfo.annotations, [MyAnnotation("hello")])
        // 获取enum构造器的注解
        @Assert[annotations](enumTypeInfo.getConstructor("B", argsCount: 1).annotations, [MyAnnotation()])
        // 通过constructors获取enum的所有构造器
        @Assert[enumConstructors](enumTypeInfo.constructors, [
            EnumConstructor(qualifiedName: "org::enums.ExhaustiveAssociatedNonRef.A(org::enums.SSSS)", name: "A", parameters: ["org::enums.SSSS"]),
            EnumConstructor(qualifiedName: "org::enums.ExhaustiveAssociatedNonRef.A(Int64, Bool)", name: "A", parameters: ["Int64", "Bool"]),
            EnumConstructor(qualifiedName: "org::enums.ExhaustiveAssociatedNonRef.B(Tuple<Unit, Unit>)", name: "B", parameters: ["Tuple<Unit, Unit>"])])
        // 通过EnumTypeInfo.of(Any)获取EnumTypeInfo
        let t1 = EnumTypeInfo.of(ExhaustiveAssociatedNonRef.A(SSSS((123, Int32(321)))))
        // 通过EnumTypeInfo.of<T>()获取EnumTypeInfo
        let t2 = EnumTypeInfo.of<ExhaustiveAssociatedNonRef>()
        // 通过EnumTypeInfo.destruct(Any)获取关联值列表
        let (ci, vs) = t1.destruct(ExhaustiveAssociatedNonRef.A(SSSS((123, Int32(321)))))
        @Assert(ci.qualifiedName, "org::enums.ExhaustiveAssociatedNonRef.A(org::enums.SSSS)")
        @Assert[readOnlyList](vs, [SSSS((123, Int32(321)))])
        // 通过EnumConstructorInfo.get(String)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.get("org::enums.ExhaustiveAssociatedNonRef.A(org::enums.SSSS)").apply([SSSS((123, Int32(321)))]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(SSSS((123, Int32(321)))))
        // 通过EnumConstructorInfo.of(Any)获取EnumConstructorInfo
        @Assert((EnumConstructorInfo.of(ExhaustiveAssociatedNonRef.A(321, false)).apply([321, false]) as ExhaustiveAssociatedNonRef).getOrThrow(), ExhaustiveAssociatedNonRef.A(321, false))
        // 通过EnumConstructorInfo.getAssociatedValues(Any)获取关联值列表
        @Assert[readOnlyList](EnumConstructorInfo.of(ExhaustiveAssociatedNonRef.A(123, false)).getAssociatedValues(ExhaustiveAssociatedNonRef.A(321, true)), [321, true])
    }
}
