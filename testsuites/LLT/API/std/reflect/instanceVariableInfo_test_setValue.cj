/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// (CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// (CJNATIVE) RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt %run_args 2>&1

/*
 * Test description:
 *      Test class InstanceVariableInfo
 *          Test whether InstanceVariableInfo is correct.
 * Test API:
 *      public func setValue(a): Any
 */

import std.reflect.*

@Test
class staticVariablesTest {
    @TestCase
    func correctTest(): Unit {
        let a = A()
        let classInfo = TypeInfo.of(a)

        let aBool = classInfo.getInstanceVariable("aBool")
        let aUInt8 = classInfo.getInstanceVariable("aUInt8")
        let aInt8 = classInfo.getInstanceVariable("aInt8")
        let aInt16 = classInfo.getInstanceVariable("aInt16")
        let aUInt16 = classInfo.getInstanceVariable("aUInt16")
        let aInt32 = classInfo.getInstanceVariable("aInt32")
        let aUInt32 = classInfo.getInstanceVariable("aUInt32")
        let aInt64 = classInfo.getInstanceVariable("aInt64")
        let aUInt64 = classInfo.getInstanceVariable("aUInt64")
        let aRune = classInfo.getInstanceVariable("aRune")
        let aIntNative = classInfo.getInstanceVariable("aIntNative")
        let aUIntNative = classInfo.getInstanceVariable("aUIntNative")
        let aFloat16 = classInfo.getInstanceVariable("aFloat16")
        let aFloat32 = classInfo.getInstanceVariable("aFloat32")
        let aFloat64 = classInfo.getInstanceVariable("aFloat64")
        aBool.setValue(a, true)
        @Expect((aBool.getValue(a) as Bool).getOrThrow(), true)

        let newValue: UInt8 = 2
        aUInt8.setValue(a, newValue)
        @Expect((aUInt8.getValue(a) as UInt8).getOrThrow(), 2)

        let Int8Value: Int8 = -1
        aInt8.setValue(a, Int8Value)
        @Expect((aInt8.getValue(a) as Int8).getOrThrow(), -1)

        let UInt8Value: UInt8 = 2
        aUInt8.setValue(a, UInt8Value)
        @Expect((aInt16.getValue(a) as Int16).getOrThrow(), 1)

        let UInt16Value: UInt16 = 2
        aUInt16.setValue(a, UInt16Value)
        @Expect((aUInt16.getValue(a) as UInt16).getOrThrow(), 2)

        let Int32Value: Int32 = -1
        aInt32.setValue(a, Int32Value)
        @Expect((aInt32.getValue(a) as Int32).getOrThrow(), -1)

        let UInt32Value: UInt32 = 2
        aUInt32.setValue(a, UInt32Value)
        @Expect((aUInt32.getValue(a) as UInt32).getOrThrow(), 2)

        let Int64Value: Int64 = -1
        aInt64.setValue(a, Int64Value)
        @Expect((aInt64.getValue(a) as Int64).getOrThrow(), -1)

        let UInt64Value: UInt64 = 2
        aUInt64.setValue(a, UInt64Value)
        @Expect((aUInt64.getValue(a) as UInt64).getOrThrow(), 2)

        aRune.setValue(a, r'b')
        @Expect((aRune.getValue(a) as Rune).getOrThrow(), r'b')

        let IntNativeValue: IntNative = -1
        aIntNative.setValue(a, IntNativeValue)
        @Expect((aIntNative.getValue(a) as IntNative).getOrThrow(), -1)

        let UIntNativeValue: UIntNative = 2
        aUIntNative.setValue(a, UIntNativeValue)
        @Expect((aUIntNative.getValue(a) as UIntNative).getOrThrow(), 2)

        let Float16Value: Float16 = 2.2
        aFloat16.setValue(a, Float16Value)
        @Expect((aFloat16.getValue(a) as Float16).getOrThrow(), 2.2)

        let Float32Value: Float32 = 3.3
        aFloat32.setValue(a, Float32Value)
        @Expect((aFloat32.getValue(a) as Float32).getOrThrow(), 3.3)

        let Float64Value: Float64 = 4.4
        aFloat64.setValue(a, Float64Value)
        @Expect((aFloat64.getValue(a) as Float64).getOrThrow(), 4.4)
    }
}

public class A {
    public var aBool: Bool = false
    public var aUInt8: UInt8 = 1
    public var aInt8: Int8 = 1
    public var aInt16: Int16 = 1
    public var aUInt16: UInt16 = 1
    public var aInt32: Int32 = 1
    public var aUInt32: UInt32 = 1
    public var aInt64: Int64 = 1
    public var aUInt64: UInt64 = 1
    public var aRune: Rune = r'a'
    public var aIntNative: IntNative = 1
    public var aUIntNative: UIntNative = 1
    public var aFloat16: Float16 = 1.1
    public var aFloat32: Float32 = 1.1
    public var aFloat64: Float64 = 1.1
}
