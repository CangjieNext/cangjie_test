/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class StaticVariableInfo
 *          Test whether StaticVariableInfo is correct.
 * Test API:
 *      public prop typeInfo: TypeInfo
 *      public func getValue(): Any
 */

import std.reflect.*

@Test
class staticVariablesTest {
    @TestCase
    func correctTest(): Unit {
        let classInfo = A() |> TypeInfo.of

        let aBool = classInfo.getStaticVariable("aBool")
        let aUInt8 = classInfo.getStaticVariable("aUInt8")
        let aInt8 = classInfo.getStaticVariable("aInt8")
        let aInt16 = classInfo.getStaticVariable("aInt16")
        let aUInt16 = classInfo.getStaticVariable("aUInt16")
        let aInt32 = classInfo.getStaticVariable("aInt32")
        let aUInt32 = classInfo.getStaticVariable("aUInt32")
        let aInt64 = classInfo.getStaticVariable("aInt64")
        let aUInt64 = classInfo.getStaticVariable("aUInt64")
        let aRune = classInfo.getStaticVariable("aRune")
        let aIntNative = classInfo.getStaticVariable("aIntNative")
        let aUIntNative = classInfo.getStaticVariable("aUIntNative")
        let aFloat16 = classInfo.getStaticVariable("aFloat16")
        let aFloat32 = classInfo.getStaticVariable("aFloat32")
        let aFloat64 = classInfo.getStaticVariable("aFloat64")

        @Expect((aBool.getValue() as Bool).getOrThrow(), false)
        @Expect((aUInt8.getValue() as UInt8).getOrThrow(), 1)
        @Expect((aInt8.getValue() as Int8).getOrThrow(), 1)
        @Expect((aInt16.getValue() as Int16).getOrThrow(), 1)
        @Expect((aUInt16.getValue() as UInt16).getOrThrow(), 1)
        @Expect((aInt32.getValue() as Int32).getOrThrow(), 1)
        @Expect((aUInt32.getValue() as UInt32).getOrThrow(), 1)
        @Expect((aInt64.getValue() as Int64).getOrThrow(), 1)
        @Expect((aUInt64.getValue() as UInt64).getOrThrow(), 1)
        @Expect((aRune.getValue() as Rune).getOrThrow(), r'a')
        @Expect((aIntNative.getValue() as IntNative).getOrThrow(), 1)
        @Expect((aUIntNative.getValue() as UIntNative).getOrThrow(), 1)
        @Expect((aFloat16.getValue() as Float16).getOrThrow(), 1.1)
        @Expect((aFloat32.getValue() as Float32).getOrThrow(), 1.1)
        @Expect((aFloat64.getValue() as Float64).getOrThrow(), 1.1)
    }
}

public class A {
    public static var aBool: Bool = false
    public static var aUInt8: UInt8 = 1
    public static var aInt8: Int8 = 1
    public static var aInt16: Int16 = 1
    public static var aUInt16: UInt16 = 1
    public static var aInt32: Int32 = 1
    public static var aUInt32: UInt32 = 1
    public static var aInt64: Int64 = 1
    public static var aUInt64: UInt64 = 1
    public static var aRune: Rune = r'a'
    public static var aIntNative: IntNative = 1
    public static var aUIntNative: UIntNative = 1
    public static var aFloat16: Float16 = 1.1
    public static var aFloat32: Float32 = 1.1
    public static var aFloat64: Float64 = 1.1
}
