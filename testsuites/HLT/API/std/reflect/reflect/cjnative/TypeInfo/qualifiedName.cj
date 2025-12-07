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
        @Expect(TypeInfo.of<Int8>().qualifiedName, "Int8")
        @Expect(TypeInfo.of<Int16>().qualifiedName, "Int16")
        @Expect(TypeInfo.of<Int32>().qualifiedName, "Int32")
        @Expect(TypeInfo.of<Int64>().qualifiedName, "Int64")
        @Expect(TypeInfo.of<IntNative>().qualifiedName, "IntNative")
        @Expect(TypeInfo.of<UInt8>().qualifiedName, "UInt8")
        @Expect(TypeInfo.of<UInt16>().qualifiedName, "UInt16")
        @Expect(TypeInfo.of<UInt32>().qualifiedName, "UInt32")
        @Expect(TypeInfo.of<UInt64>().qualifiedName, "UInt64")
        @Expect(TypeInfo.of<UIntNative>().qualifiedName, "UIntNative")
        @Expect(TypeInfo.of<Float16>().qualifiedName, "Float16")
        @Expect(TypeInfo.of<Float32>().qualifiedName, "Float32")
        @Expect(TypeInfo.of<Float64>().qualifiedName, "Float64")
        @Expect(TypeInfo.of<Bool>().qualifiedName, "Bool")
        @Expect(TypeInfo.of<Rune>().qualifiedName, "Rune")
    }
    @TestCase
    func testTypeAlias(): Unit {
        @Expect(TypeInfo.of<Int>().qualifiedName, "Int64")
        @Expect(TypeInfo.of<UInt>().qualifiedName, "UInt64")
        @Expect(TypeInfo.of<Rune>().qualifiedName, "Rune")
    }
    @TestCase
    func testInterface(): Unit {
        @Expect(TypeInfo.of<I0>().qualifiedName, "MyType.myType.I0")
        @Expect(TypeInfo.of<I1>().qualifiedName, "MyType.myType.I1")
        @Expect(TypeInfo.of<I2>().qualifiedName, "MyType.myType.I2")
        @Expect(TypeInfo.of<I3>().qualifiedName, "MyType.myType.I3")
        @Expect(TypeInfo.of<I4>().qualifiedName, "MyType.myType.I4")
        @Expect(TypeInfo.of<I5>().qualifiedName, "MyType.myType.I5")
        @Expect(TypeInfo.of<I6>().qualifiedName, "MyType.myType.I6")
    }
    @TestCase
    func testClass(): Unit {
        @Expect(TypeInfo.of<C1>().qualifiedName, "MyType.myType.C1")
        @Expect(TypeInfo.of<C2>().qualifiedName, "MyType.myType.C2")
        @Expect(TypeInfo.of<C3>().qualifiedName, "MyType.myType.C3")
        @Expect(TypeInfo.of<C4>().qualifiedName, "MyType.myType.C4")
        @Expect(TypeInfo.of<C5>().qualifiedName, "MyType.myType.C5")
        @Expect(TypeInfo.of<C6>().qualifiedName, "MyType.myType.C6")
        @Expect(TypeInfo.of<C7<UInt32, Float16, Rune, Unit>>().qualifiedName, "MyType.myType.C7<UInt32, Float16, Rune, Unit>")
        @Expect(TypeInfo.of<C8>().qualifiedName, "MyType.myType.C8")
        @Expect(TypeInfo.of<C9>().qualifiedName, "MyType.myType.C9")
    }
    @TestCase
    func testStruct(): Unit {
        @Expect(TypeInfo.of<S0>().qualifiedName, "MyType.myType.S0")
        @Expect(TypeInfo.of<S1>().qualifiedName, "MyType.myType.S1")
        @Expect(TypeInfo.of<S2>().qualifiedName, "MyType.myType.S2")
        @Expect(TypeInfo.of<S3>().qualifiedName, "MyType.myType.S3")
    }
}
