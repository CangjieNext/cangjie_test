/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

import UNNAMED.*;

public class JavaClassImplCangjieInterface implements CangjieGenericInterfaceBoolInt8Int16Int32Int64UInt16Float32Float64 {

    public JavaClassImplCangjieInterface() {
        Logger.println("JavaClassImplCangjieInterface.JavaClassImplCangjieInterface");
    }

    public TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 instanceMemberFunctionWithoutDefaultImpl(TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p) {
        Logger.println("JavaClassImplCangjieInterface.instanceMemberFunctionWithoutDefaultImpl");
        return new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);
    }

    public TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 staticMemberFunctionWithoutDefaultImpl(TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64 p) {
        Logger.println("JavaClassImplCangjieInterface.staticMemberFunctionWithoutDefaultImpl");
        return new TupleOfBoolInt8Int16Int32Int64UInt16Float32Float64(true, (byte) 2, (short) 3, (int) 4, (long) 5, (char) 6, (float) 7.0, (double) 8.0);
    }
}
