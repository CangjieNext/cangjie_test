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
    // 基本数据类型的静态成员属性。
    @TestCase
    func test0(): Unit {
        try {
            TypeInfo.of<Int8>().getStaticProperty("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
    }
    // interface类型的静态成员属性。
    @TestCase
    func test1(): Unit {
        try {
            TypeInfo.of<I0>().getStaticProperty("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
        // interface非抽象静态成员属性。
        @Expect(TypeInfo.of<I1>().getStaticProperty("i1_public_mutable_static_member_property_0").toString(), "abstract static mut prop i1_public_mutable_static_member_property_0: Int64")
        // interface抽象静态成员属性。
        @Expect(TypeInfo.of<I1>().getStaticProperty("i1_public_abstract_mutable_static_member_property_0").toString(), "abstract static mut prop i1_public_abstract_mutable_static_member_property_0: Int64")
        // interface从interface继承而来的非抽象静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<I4>().getStaticProperty("i1_public_mutable_static_member_property_0").toString(), "abstract static mut prop i1_public_mutable_static_member_property_0: Int64")
    }
    // class类型的静态成员属性。
    @TestCase
    func test2(): Unit {
        // class非抽象静态成员属性。
        @Expect(TypeInfo.of<C1>().getStaticProperty("c1_public_mutable_static_member_property_0").toString(), "static mut prop c1_public_mutable_static_member_property_0: Int8")
        // class从interface继承而来的非抽象静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C8>().getStaticProperty("i1_public_mutable_static_member_property_0").toString(), "static mut prop i1_public_mutable_static_member_property_0: Int64")

    }
    // struct类型的静态成员属性。
    @TestCase
    func test3(): Unit {
        // struct静态成员属性。
        @Expect(TypeInfo.of<S1>().getStaticProperty("s1_public_mutable_static_member_property_0").toString(), "static mut prop s1_public_mutable_static_member_property_0: Int8")
        // struct从interface继承而来的非抽象静态成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getStaticProperty("i1_public_mutable_static_member_property_0").toString(), "static mut prop i1_public_mutable_static_member_property_0: Int64")
    }
}
