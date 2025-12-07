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
        @Expect(TypeInfo.of<Int8>().name, "Int8")
        @Expect(TypeInfo.of<Int16>().name, "Int16")
        @Expect(TypeInfo.of<Int32>().name, "Int32")
        @Expect(TypeInfo.of<Int64>().name, "Int64")
        @Expect(TypeInfo.of<IntNative>().name, "IntNative")
        @Expect(TypeInfo.of<UInt8>().name, "UInt8")
        @Expect(TypeInfo.of<UInt16>().name, "UInt16")
        @Expect(TypeInfo.of<UInt32>().name, "UInt32")
        @Expect(TypeInfo.of<UInt64>().name, "UInt64")
        @Expect(TypeInfo.of<UIntNative>().name, "UIntNative")
        @Expect(TypeInfo.of<Float16>().name, "Float16")
        @Expect(TypeInfo.of<Float32>().name, "Float32")
        @Expect(TypeInfo.of<Float64>().name, "Float64")
        @Expect(TypeInfo.of<Bool>().name, "Bool")
        @Expect(TypeInfo.of<Rune>().name, "Rune")
    }
    @TestCase
    func testTypeAlias(): Unit {
        @Expect(TypeInfo.of<Int>().name, "Int64")
        @Expect(TypeInfo.of<UInt>().name, "UInt64")
        @Expect(TypeInfo.of<Rune>().name, "Rune")
        @Expect(TypeInfo.of<T0>().name, "C7<Int64, Float64, MyType.myType.C2, MyType.myType.C1>")
        @Expect(TypeInfo.of<T0>().qualifiedName, "MyType.myType.C7<Int64, Float64, MyType.myType.C2, MyType.myType.C1>")
    }
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.of<I0>().name, "I0")
        @Expect(TypeInfo.of<I1>().name, "I1")
        @Expect(TypeInfo.of<I2>().name, "I2")
        @Expect(TypeInfo.of<I3>().name, "I3")
        @Expect(TypeInfo.of<I4>().name, "I4")
        @Expect(TypeInfo.of<I5>().name, "I5")
        @Expect(TypeInfo.of<I6>().name, "I6")
    }
    @TestCase
    func testClass(): Unit {
        @Expect(TypeInfo.of<C1>().name, "C1")
        @Expect(TypeInfo.of<C2>().name, "C2")
        @Expect(TypeInfo.of<C3>().name, "C3")
        @Expect(TypeInfo.of<C4>().name, "C4")
        @Expect(TypeInfo.of<C5>().name, "C5")
        @Expect(TypeInfo.of<C6>().name, "C6")
        @Expect(TypeInfo.of<C7<UInt32, Float16, Rune, Unit>>().name, "C7<UInt32, Float16, Rune, Unit>")
        @Expect(TypeInfo.of<C8>().name, "C8")
        @Expect(TypeInfo.of<C9>().name, "C9")
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S0>().name, "S0")
        @Expect(TypeInfo.of<S1>().name, "S1")
        @Expect(TypeInfo.of<S2>().name, "S2")
        @Expect(TypeInfo.of<S3>().name, "S3")
    }
}
