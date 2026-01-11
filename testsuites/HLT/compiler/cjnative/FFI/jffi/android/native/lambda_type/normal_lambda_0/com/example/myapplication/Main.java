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
        // testInterface();
        Logger.println("result = true");
    }

    public static void testClass() {
        final CangjieClass instance = new CangjieClass((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
        }
        );
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToUInt16 result1 = instance.instanceMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p4;
        }
        );
        Logger.println("result1 = " + result1.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat64 result2 = CangjieClass.staticMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p6;
        }
        );
        Logger.println("result2 = " + result2.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
    }

    public static void testStruct() {
        final CangjieStruct instance = new CangjieStruct((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
        }
        );
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToUInt16 result1 = instance.instanceMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p4;
        }
        );
        Logger.println("result1 = " + result1.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat64 result2 = CangjieStruct.staticMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p6;
        }
        );
        Logger.println("result2 = " + result2.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
    }

    public static void testEnum() {
        final TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p = new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0);

        final CangjieEnum instance = CangjieEnum.A(114514, true);
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToUInt16 result1 = instance.instanceMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p4;
        }
        );
        Logger.println("result1 = " + result1.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
        final BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat64 result2 = CangjieStruct.staticMemberFunction((p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p6;
        }
        );
        Logger.println("result2 = " + result2.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
    }

    // public static void testInterface() {
    //     final CangjieInterface instance = new JavaClassImplCangjieInterface();
    //     final BoolInt8Int16Int32Int64UInt16Float32Float64ToUInt16 result1 = instance.instanceMemberFunctionWithoutDefaultImpl((p0, p1, p2, p3, p4, p5, p6, p7) -> {
    //         Logger.println("p0 = ");
    //         return p4;
    //     }
    //     );
    //     Logger.println("result1 = " + result1.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
    //     final BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat64 result2 = instance.staticMemberFunctionWithoutDefaultImpl((p0, p1, p2, p3, p4, p5, p6, p7) -> {
    //         Logger.println("p0 = ");
    //         return p6;
    //     }
    //     );
    //     Logger.println("result2 = " + result2.call(true, (byte) 2, (short) 3, (int) 4, (long) 5, 'A', (float) 7.0, (double) 8.0));
    // }
}
