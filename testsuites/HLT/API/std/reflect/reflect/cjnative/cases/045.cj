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
    // 基本数据类型的实例成员属性。
    @TestCase
    func test1(): Unit {
        try {
            TypeInfo.of<Int8>().getInstanceProperty("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
    }
    // interface类型的实例成员属性。
    @TestCase
    func test0(): Unit {
        try {
            TypeInfo.of<I0>().getInstanceProperty("xxx")
            @Assert(false)
        } catch (e: Exception) {
        }
        @Expect(TypeInfo.of<I1>().getInstanceProperty("i1_public_mutable_member_property_0").toString(), "open abstract mut prop i1_public_mutable_member_property_0: Int8")
        @Expect(TypeInfo.of<I1>().getInstanceProperty("i1_public_mutable_member_property_1").toString(), "open abstract mut prop i1_public_mutable_member_property_1: Int8")
        // interface抽象实例成员属性。
        @Expect(TypeInfo.of<I1>().getInstanceProperty("i1_public_abstract_mutable_instance_member_property_0").toString(), "open abstract mut prop i1_public_abstract_mutable_instance_member_property_0: Int8")
    }
    // class类型的实例成员属性。
    @TestCase
    func test2(): Unit {
        // class普通实例成员属性。
        @Expect(TypeInfo.of<C1>().getInstanceProperty("c1_public_mutable_instance_member_property_0").toString(), "mut prop c1_public_mutable_instance_member_property_0: Int8")
        // 抽象class的抽象实例成员属性。
        @Expect(TypeInfo.of<C3>().getInstanceProperty("c3_public_abstract_mutable_instance_member_property_0").toString(), "open abstract mut prop c3_public_abstract_mutable_instance_member_property_0: Int8")
        // class从interface继承而来的非抽象实例成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<C5>().getInstanceProperty("i1_public_mutable_member_property_0").toString(), "open mut prop i1_public_mutable_member_property_0: Int8")
        // class重写继承自父类的实例成员属性。
        // class重写继承自interface的实例成员属性。
    }
    // struct类型的实例成员属性。
    @TestCase
    func test3(): Unit {
        // struct普通实例成员属性。
        @Expect(TypeInfo.of<S1>().getInstanceProperty("s1_public_mutable_instance_member_property_0").toString(), "mut prop s1_public_mutable_instance_member_property_0: Int8")
        // struct从interface继承而来的非抽象实例成员属性。
        // 反射拿不到继承下来的函数，包括实例成员函数、静态成员函数
        // @Expect(TypeInfo.of<S2>().getInstanceProperty("i1_public_mutable_member_property_0").toString(), "mut prop i1_public_mutable_member_property_0: Int8")
    }
}
