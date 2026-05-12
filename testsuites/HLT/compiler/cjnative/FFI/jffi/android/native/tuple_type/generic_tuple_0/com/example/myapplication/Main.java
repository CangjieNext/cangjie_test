/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

import UNNAMED.*;

public class Main {

    public static void main(String[] args) {
        testGenericClass();
        testGenericStruct();
        testGenericEnum();
        testInterface();
        Logger.println("result = true");
    }

    public static void testGenericClass() {
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieGenericClassInt64 instance = new CangjieGenericClassInt64(p);
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
    }

    public static void testGenericStruct() {
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieGenericStructBoolInt8Int16Int32Int64UInt16Float32Float64 instance = new CangjieGenericStructBoolInt8Int16Int32Int64UInt16Float32Float64(p);
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
    }

    public static void testGenericEnum() {
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieGenericEnumFloat64 instance = CangjieGenericEnumFloat64.A(114514, true);
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
    }

    public static void testInterface() {
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieGenericInterfaceBoolInt8Int16Int32Int64UInt16Float32Float64 instance = new JavaClassImplCangjieInterface();
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 result = instance.instanceMemberFunctionWithoutDefaultImpl(p);
        // final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 result2 = instance.staticMemberFunctionWithoutDefaultImpl(p);
    }
}
