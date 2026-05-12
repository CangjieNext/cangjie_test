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
        testClass();
        testStruct();
        testEnum();
        testInterface();
        Logger.println("result = true");
    }

    public static void testClass() {
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64(true, (long) 1, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieClass instance = new CangjieClass(p);
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result2 = CangjieClass.staticMemberFunction(p);
    }

    public static void testStruct() {
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64(true, (long) 1, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieStruct instance = new CangjieStruct(p);
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result2 = CangjieStruct.staticMemberFunction(p);
    }

    public static void testEnum() {
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64(true, (long) 1, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieEnum instance = CangjieEnum.A(114514, true);
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result1 = instance.instanceMemberFunction(p);
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result2 = CangjieEnum.staticMemberFunction(p);
    }

    public static void testInterface() {
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64(true, (long) 1, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);

        final CangjieInterface instance = new JavaClassImplCangjieInterface();
        // final TupleOfFloat32Int32 result = instance.foo(new TupleOfUInt16Bool((char) 14, true));
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result = instance.instanceMemberFunctionWithoutDefaultImpl(p);
        final TupleOfBoolInt64Int8Int16Int32Int64UInt16Float32Float64 result2 = instance.staticMemberFunctionWithoutDefaultImpl(p);
    }
}
