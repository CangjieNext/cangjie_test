/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// (not MAC) EXEC: cd ./MyType && %compiler %cmp_opt --output-type=dylib --module-name=MyType ./src/myType/*.cj -o libMyType_myType.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt -o %output %f --import-path . -L ./MyType -lMyType_myType %cmp_utest_opt
// (not MAC) RUN-EXEC: %cp ./MyType/libMyType_myType.%test_suffix .&& %run %run_opt %output %run_utest_opt %run_args
import std.reflect.*
import MyType.myType.*

@Test
class Test {
    // 基本数据类型的静态成员函数。
    @TestCase
    func test0(): Unit {
        try {
            TypeInfo.of<Int8>().getStaticFunction("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
    }
    // interface类型的静态成员函数。
    @TestCase
    func test1(): Unit {
        try {
            TypeInfo.of<I0>().getStaticFunction("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
        // interface非抽象静态成员函数。
        @Expect(TypeInfo.of<I1>().getStaticFunction("i1_public_open_static_member_function_0").toString(), "abstract static func i1_public_open_static_member_function_0(): Int64")
        // interface抽象静态成员函数。
        @Expect(TypeInfo.of<I1>().getStaticFunction("i1_public_abstract_static_member_function_0").toString(), "abstract static func i1_public_abstract_static_member_function_0(): Int16")
        // interface从interface继承而来的非抽象静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<I4>().getStaticFunction("i1_public_open_static_member_function_0").toString(), "abstract static func i1_public_open_static_member_function_0(): Int64")
    }
    // class类型的静态成员函数。
    @TestCase
    func test2(): Unit {
        // class普通静态成员函数。
        @Expect(TypeInfo.of<C1>().getStaticFunction("c1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>()).toString(), "static func c1_public_static_member_function_0(UInt16, Rune, Float16): UInt32")
        // class非公开静态成员函数。
        try {
            TypeInfo.of<C1>().getStaticFunction("c1_static_member_function_0")
        } catch (e: Exception) {
        }
        // class从interface继承而来的非抽象静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getStaticFunction("i1_public_open_static_member_function_0").toString(), "static func i1_public_open_static_member_function_0(): Int64")
    }
    // struct类型的静态成员函数。
    @TestCase
    func test3(): Unit {
        // struct普通静态成员函数。
        @Expect(TypeInfo.of<S1>().getStaticFunction("s1_public_static_member_function_0", TypeInfo.of<UInt16>(), TypeInfo.of<Rune>(), TypeInfo.of<Float16>(), TypeInfo.of<C1>()).toString(), "static func s1_public_static_member_function_0(UInt16, Rune, Float16, MyType.myType.C1): UInt32")
        // struct从interface继承而来的非抽象静态成员函数。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getStaticFunction("i1_public_open_static_member_function_0").toString(), "static func i1_public_open_static_member_function_0(): Int64")
    }
}
