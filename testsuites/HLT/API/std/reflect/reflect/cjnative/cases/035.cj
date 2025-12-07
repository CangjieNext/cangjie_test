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
    func testPrimary(): Unit {
        @Expect(TypeInfo.of<Int8>().toString(), "Int8")
        @Expect(TypeInfo.of<Int16>().toString(), "Int16")
        @Expect(TypeInfo.of<Int32>().toString(), "Int32")
        @Expect(TypeInfo.of<Int64>().toString(), "Int64")
        @Expect(TypeInfo.of<IntNative>().toString(), "IntNative")
        @Expect(TypeInfo.of<UInt8>().toString(), "UInt8")
        @Expect(TypeInfo.of<UInt16>().toString(), "UInt16")
        @Expect(TypeInfo.of<UInt32>().toString(), "UInt32")
        @Expect(TypeInfo.of<UInt64>().toString(), "UInt64")
        @Expect(TypeInfo.of<UIntNative>().toString(), "UIntNative")
        @Expect(TypeInfo.of<Float16>().toString(), "Float16")
        @Expect(TypeInfo.of<Float32>().toString(), "Float32")
        @Expect(TypeInfo.of<Float64>().toString(), "Float64")
        @Expect(TypeInfo.of<Bool>().toString(), "Bool")
        @Expect(TypeInfo.of<Rune>().toString(), "Rune")
    }
    @TestCase
    func testTypeAlias(): Unit {
        @Expect(TypeInfo.of<Int>().toString(), "Int64")
        @Expect(TypeInfo.of<UInt>().toString(), "UInt64")
        @Expect(TypeInfo.of<Rune>().toString(), "Rune")
    }
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.of<I0>().toString(), "MyType.myType.I0")
        @Expect(TypeInfo.of<I1>().toString(), "MyType.myType.I1")
        @Expect(TypeInfo.of<I2>().toString(), "MyType.myType.I2")
        @Expect(TypeInfo.of<I3>().toString(), "MyType.myType.I3")
        @Expect(TypeInfo.of<I4>().toString(), "MyType.myType.I4")
        @Expect(TypeInfo.of<I5>().toString(), "MyType.myType.I5")
        @Expect(TypeInfo.of<I6>().toString(), "MyType.myType.I6")
    }
    @TestCase
    func testClass(): Unit {
        @Expect(TypeInfo.of<C1>().toString(), "MyType.myType.C1")
        @Expect(TypeInfo.of<C2>().toString(), "MyType.myType.C2")
        @Expect(TypeInfo.of<C3>().toString(), "MyType.myType.C3")
        @Expect(TypeInfo.of<C4>().toString(), "MyType.myType.C4")
        @Expect(TypeInfo.of<C5>().toString(), "MyType.myType.C5")
        @Expect(TypeInfo.of<C6>().toString(), "MyType.myType.C6")
        @Expect(TypeInfo.of<C7<UInt32, Float16, Rune, Unit>>().toString(), "MyType.myType.C7<UInt32, Float16, Rune, Unit>")
        @Expect(TypeInfo.of<C8>().toString(), "MyType.myType.C8")
        @Expect(TypeInfo.of<C9>().toString(), "MyType.myType.C9")
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S0>().toString(), "MyType.myType.S0")
        @Expect(TypeInfo.of<S1>().toString(), "MyType.myType.S1")
        @Expect(TypeInfo.of<S2>().toString(), "MyType.myType.S2")
        @Expect(TypeInfo.of<S3>().toString(), "MyType.myType.S3")
    }
}
