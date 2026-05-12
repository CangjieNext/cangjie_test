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
class Test_SetValue_Global_01 {
    @TestCase
    func testGlobal_01(): Unit {
        PackageInfo.get("define").getVariable("struct_1").setValue(S0())
        @Assert(struct_1.v1, 1)
        PackageInfo.get("define").getVariable("struct_1").setValue(S0(10))
        @Assert(struct_1.v1, 10)
    }

    @TestCase
    func testGlobal_02(): Unit {
        PackageInfo.get("define").getVariable("struct_2").setValue(S0())
        @Assert(struct_2.v1, 1)
        PackageInfo.get("define").getVariable("struct_2").setValue(S0(a: -1))
        @Assert(struct_2.v1, -1)
    }

    @TestCase
    func testGlobal_03(): Unit {
        PackageInfo.get("define").getVariable("struct_3").setValue(S0())
        @Assert(struct_3.v1, 1)
        PackageInfo.get("define").getVariable("struct_3").setValue(S0(a: -1))
        @Assert(struct_3.v1, -1)
    }

    @TestCase
    func testGlobal_04(): Unit {
        @AssertThrows[IllegalSetException](PackageInfo.get("define").getVariable("struct_4").setValue(S0()))
        @AssertThrows[IllegalSetException](PackageInfo.get("define").getVariable("struct_5").setValue(S0()))
    }

    @TestCase
    func testGlobal_05(): Unit {
        @AssertThrows[IllegalTypeException](PackageInfo.get("define").getVariable("struct_1").setValue(S1<UInt64>()))
        @AssertThrows[IllegalTypeException](PackageInfo.get("define").getVariable("struct_2").setValue(S1<UInt64>()))
    }

    @TestCase
    func testGlobal_06(): Unit {
        PackageInfo.get("define").getVariable("struct_6").setValue(["b", "c"])
        @Assert(struct_6, ["b", "c"])
    }

    @TestCase
    func testGlobal_07(): Unit {
        PackageInfo.get("define").getVariable("struct_7").setValue(S1<UInt64>())
        @Assert(struct_7.v1, 1)
        PackageInfo.get("define").getVariable("struct_7").setValue(S1<UInt64>(10u64))
        @Assert(struct_7.v1, 1)
    }

    @TestCase
    func testGlobal_08(): Unit {
        PackageInfo.get("define").getVariable("struct_8").setValue(S1<String>("a"))
        @Assert(struct_8.v1, 1)
    }

    @TestCase
    func testGlobal_09(): Unit {
        PackageInfo.get("define").getVariable("struct_9").setValue(S1<UInt64>(a: 10i64))
        @Assert(struct_9.v1, 10)
        PackageInfo.get("define").getVariable("struct_9").setValue(S1<UInt64>(10u64))
        @Assert(struct_9.v1, 1)
    }

    @TestCase
    func testGlobal_10(): Unit {
        @AssertThrows[IllegalSetException](PackageInfo.get("define").getVariable("struct_10").setValue(S1<Int32>()))
        @AssertThrows[IllegalSetException](PackageInfo.get("define").getVariable("struct_11").setValue([1u8]))
    }
}
