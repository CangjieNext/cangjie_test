/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class Main {
    public static void main(String[] args) {
        AInt32 ai32 = new AInt32Impl();
        AFloat64 af64 = new AFloat64Impl();
        BInt32Int32 bi32i32 = new BInt32Int32Impl();
        BInt16Float64Impl bi16f64 = new BInt16Float64Impl();

        System.out.println(ai32.foo(1));
        ai32.goo(1);
        System.out.println(ai32.doo(1));
        System.out.println(ai32.koo(1));

        System.out.println(af64.foo(1.000000));
        af64.goo(1.000000);
        System.out.println(af64.doo(1.000000));
        System.out.println(af64.koo(2));

        bi32i32.foo(2, 2);
        System.out.println(bi32i32.goo(2));
        System.out.println(bi32i32.doo(2, 2));

        bi16f64.foo((short)3, 3.000000);
        System.out.println(bi16f64.goo((short)3));
        System.out.println(bi16f64.doo((short)3, 3.000000));
        bi16f64.test();
    }
}