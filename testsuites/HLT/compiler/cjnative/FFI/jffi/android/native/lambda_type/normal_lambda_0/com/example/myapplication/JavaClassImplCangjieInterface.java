/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

import UNNAMED.*;

public class JavaClassImplCangjieInterface implements CangjieInterface {
    public JavaClassImplCangjieInterface() {
        Logger.println("JavaClassImplCangjieInterface.JavaClassImplCangjieInterface");
    }

    public BoolInt8Int16Int32Int64UInt16Float32Float64ToUInt16 instanceMemberFunctionWithoutDefaultImpl(BoolInt8Int16Int32Int64UInt16Float32Float64ToInt64 p) {
        Logger.println("JavaClassImplCangjieInterface.instanceMemberFunctionWithoutDefaultImpl");
        return (p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p5;
        };
    }

    public BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat64 staticMemberFunctionWithoutDefaultImpl(BoolInt8Int16Int32Int64UInt16Float32Float64ToFloat32 p) {
        Logger.println("JavaClassImplCangjieInterface.staticMemberFunctionWithoutDefaultImpl");
        return (p0, p1, p2, p3, p4, p5, p6, p7) -> {
            Logger.println("p0 = ");
            return p7;
        };
    }
}
