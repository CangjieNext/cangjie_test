/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class BInt16Float64Impl implements BInt16Float64{
    public double goo(short v) {
        System.out.print("Java: BInt16Float64Impl goo()!");
        System.out.print(v);
        System.out.println();
        return 1.000000;
    }

    public short doo(short v, double r) {
        System.out.println("Java: BInt16Float64Impl doo()!");
        System.out.print(r);
        System.out.println();
        return v;
    }

    public void test() {
        System.out.println("Java: BInt16Float64Impl test()!");
        foo((short)5, 5.000000);
    }
}
