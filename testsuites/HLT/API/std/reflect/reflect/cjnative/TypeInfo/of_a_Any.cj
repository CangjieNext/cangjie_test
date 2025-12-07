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
    @TestCase
    func testString(): Unit {
        @Expect(TypeInfo.of("hello world").toString(), "String")
    }
    @TestCase
    func testBoolean(): Unit {
        @Expect(TypeInfo.of(true).toString(), "Bool")
        @Expect(TypeInfo.of(b_0).toString(), "Bool")
        @Expect(TypeInfo.of(b_1).toString(), "Bool")
    }
    @TestCase
    func testCharacter(): Unit {
        @Expect(TypeInfo.of(r'a').toString(), "Rune")
        @Expect(TypeInfo.of(c_0).toString(), "Rune")
    }
    @TestCase
    func testInteger(): Unit {
        @Expect(TypeInfo.of(12).toString(), "Int64")
        @Expect(TypeInfo.of(i8_0).toString(), "Int8")
        @Expect(TypeInfo.of(i8_1).toString(), "Int8")
        @Expect(TypeInfo.of(i8_2).toString(), "Int8")
        @Expect(TypeInfo.of(i16_0).toString(), "Int16")
        @Expect(TypeInfo.of(i32_0).toString(), "Int32")
        @Expect(TypeInfo.of(i64_0).toString(), "Int64")
        @Expect(TypeInfo.of(in_0).toString(), "IntNative")
        @Expect(TypeInfo.of(u8_0).toString(), "UInt8")
        @Expect(TypeInfo.of(u16_0).toString(), "UInt16")
        @Expect(TypeInfo.of(u32_0).toString(), "UInt32")
        @Expect(TypeInfo.of(u64_0).toString(), "UInt64")
        @Expect(TypeInfo.of(un_0).toString(), "UIntNative")
    }
    @TestCase
    func testFloatingPoint(): Unit {
        @Expect(TypeInfo.of(1.2).toString(), "Float64")
        @Expect(TypeInfo.of(f16_0).toString(), "Float16")
        @Expect(TypeInfo.of(f32_0).toString(), "Float32")
        @Expect(TypeInfo.of(f64_0).toString(), "Float64")
    }
    @TestCase
    func testRange(): Unit {
        // 范围立即数，目前不支持。
        // @Expect(TypeInfo.of(1..10).toString(), "Range<Int64>")
    }
    @TestCase
    func testTuple(): Unit {
        // @Expect(TypeInfo.of((1, "hello, world")).toString(), "(Int64, String)")
    }
    @TestCase
    func testUnit(): Unit {
        @Expect(TypeInfo.of(()).toString(), "Unit")
        @Expect(TypeInfo.of(println()).toString(), "Unit")
    }
}
