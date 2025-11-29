/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ./define.cj
// (not MAC) EXEC: %compiler %cmp_opt define.cj %compile_dylib_opt -o libdefine.%test_suffix
// (not MAC) EXEC: %compiler %cmp_opt %cmp_utest_opt %f -L. -ldefine -o %output
// (not MAC) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import define.*

@Test
class Test_SetValue_Struct_01 {
    @TestCase
    func testStruct_01(): Unit {
        let oldValue: Any = Test_S1()
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_1").setValue(oldValue, S0())
        @Assert((oldValue as Test_S1).getOrThrow().struct_1.v1, 1)
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_1").setValue(oldValue, S0(10))
        @Assert((oldValue as Test_S1).getOrThrow().struct_1.v1, 10)
    }

    @TestCase
    func testStruct_02(): Unit {
        StructTypeInfo.of(Test_S1()).getStaticVariable("struct_2").setValue(S0())
        @Assert(Test_S1.struct_2.v1, 1)
        StructTypeInfo.of(Test_S1()).getStaticVariable("struct_2").setValue(S0(a: -1))
        @Assert(Test_S1.struct_2.v1, -1)
    }

    @TestCase
    func testStruct_03(): Unit {
        let oldValue: Any = Test_S1()
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_3").setValue(oldValue, S0())
        @Assert((oldValue as Test_S1)?.struct_3.v1, 1)
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_3").setValue(oldValue, S0(a: -1))
        @Assert((oldValue as Test_S1)?.struct_3.v1, -1)
    }

    @TestCase
    func testStruct_04(): Unit {
        let oldValue = Test_S1()
        @AssertThrows[IllegalSetException](StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_4").setValue(oldValue, S0()))
        @AssertThrows[IllegalSetException](StructTypeInfo.of(Test_S1()).getStaticVariable("struct_5").setValue(S0()))
    }

    @TestCase
    func testStruct_05(): Unit {
        let oldValue = Test_S1()
        @AssertThrows[IllegalTypeException](StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_1").setValue(oldValue, S1<UInt64>()))
        @AssertThrows[IllegalTypeException](StructTypeInfo.of(Test_S1()).getStaticVariable("struct_2").setValue(S1<UInt64>()))
    }

    @TestCase
    func testStruct_06(): Unit {
        let oldValue: Any = Test_S1()
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_6").setValue(oldValue, ["b", "c"])
        @Assert((oldValue as Test_S1)?.struct_6, ["b", "c"])
    }

    @TestCase
    func testStruct_07(): Unit {
        let oldValue = Test_S1()
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_7").setValue(oldValue, S1<UInt64>())
        @Assert(oldValue.struct_7.v1, 1)
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_7").setValue(oldValue, S1<UInt64>(10u64))
        @Assert(oldValue.struct_7.v1, 1)
    }

    @TestCase
    func testStruct_08(): Unit {
        StructTypeInfo.of(Test_S1()).getStaticVariable("struct_8").setValue(S1<String>("a"))
        @Assert(Test_S1.struct_8.v1, 1)
    }

    @TestCase
    func testStruct_09(): Unit {
        let oldValue: Any = Test_S1()
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_9").setValue(oldValue, S1<UInt64>(a: 10i64))
        @Assert((oldValue as Test_S1)?.struct_9.v1, 10)
        StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_9").setValue(oldValue, S1<UInt64>(10u64))
        @Assert((oldValue as Test_S1)?.struct_9.v1, 1)
    }

    @TestCase
    func testStruct_10(): Unit {
        let oldValue = Test_S1()
        @AssertThrows[IllegalSetException](StructTypeInfo.of(Test_S1()).getInstanceVariable("struct_10").setValue(oldValue, S1<Int32>()))
        @AssertThrows[IllegalSetException](StructTypeInfo.of(Test_S1()).getStaticVariable("struct_11").setValue([1u8]))
    }
}
