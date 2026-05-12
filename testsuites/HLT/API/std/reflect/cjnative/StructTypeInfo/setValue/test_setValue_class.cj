/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./define.cj
// (not MAC) EXEC: %compiler %cmp_opt define.cj %compile_dylib_opt -o libdefine.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %cmp_utest_opt %f -L. -ldefine -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import define.*

@Test
class Test_SetValue_Class_01 {
    @TestCase
    func testClass_01(): Unit {
        let oldValue = Test_C1()
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_1").setValue(oldValue, S0())
        @Assert(oldValue.struct_1.v1, 1)
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_1").setValue(oldValue, S0(10))
        @Assert(oldValue.struct_1.v1, 10)
    }

    @TestCase
    func testClass_02(): Unit {
        ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_2").setValue(S0())
        @Assert(Test_C1.struct_2.v1, 1)
        ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_2").setValue(S0(a: -1))
        @Assert(Test_C1.struct_2.v1, -1)
    }

    @TestCase
    func testClass_03(): Unit {
        let oldValue = Test_C1()
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_3").setValue(oldValue, S0())
        @Assert(oldValue.struct_3.v1, 1)
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_3").setValue(oldValue, S0(a: -1))
        @Assert(oldValue.struct_3.v1, -1)
    }

    @TestCase
    func testClass_04(): Unit {
        let oldValue = Test_C1()
        @AssertThrows[IllegalSetException](ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_4").setValue(oldValue, S0()))
        @AssertThrows[IllegalSetException](ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_5").setValue(S0()))
    }

    @TestCase
    func testClass_05(): Unit {
        let oldValue = Test_C1()
        @AssertThrows[IllegalTypeException](ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_1").setValue(oldValue, S1<UInt64>()))
        @AssertThrows[IllegalTypeException](ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_2").setValue(S1<UInt64>()))
    }

    @TestCase
    func testClass_06(): Unit {
        let oldValue = Test_C1()
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_6").setValue(oldValue, ["b", "c"])
        @Assert(oldValue.struct_6, ["b", "c"])
    }

    @TestCase
    func testClass_07(): Unit {
        let oldValue = Test_C1()
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_7").setValue(oldValue, S1<UInt64>())
        @Assert(oldValue.struct_7.v1, 1)
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_7").setValue(oldValue, S1<UInt64>(10u64))
        @Assert(oldValue.struct_7.v1, 1)
    }

    @TestCase
    func testClass_08(): Unit {
        ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_8").setValue(S1<String>("a"))
        @Assert(Test_C1.struct_8.v1, 1)
    }

    @TestCase
    func testClass_09(): Unit {
        let oldValue = Test_C1()
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_9").setValue(oldValue, S1<UInt64>(a: 10i64))
        @Assert(oldValue.struct_9.v1, 10)
        ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_9").setValue(oldValue, S1<UInt64>(10u64))
        @Assert(oldValue.struct_9.v1, 1)
    }

    @TestCase
    func testClass_10(): Unit {
        let oldValue = Test_C1()
        @AssertThrows[IllegalSetException](ClassTypeInfo.of(Test_C1()).getInstanceVariable("struct_10").setValue(oldValue, S1<Int32>()))
        @AssertThrows[IllegalSetException](ClassTypeInfo.of(Test_C1()).getStaticVariable("struct_11").setValue([1u8]))
    }
}
