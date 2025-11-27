/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class AFloat64Impl implements AFloat64 {
    public double foo(double v) {
        System.out.println("Java: AFloat64Impl foo()!");
        return v/2.000000;
    }
    public void goo(double v) {
        System.out.print("Java: AFloat64Impl goo()!");
        System.out.print(v);
        System.out.println();
    }

    public double doo(double v) {
        System.out.println("Java: AFloat64Impl doo()!");
        return v*3;
    }

    public int koo(int v) {
        System.out.println("Java: AFloat64Impl koo()!");
        return v*4;
    }
}