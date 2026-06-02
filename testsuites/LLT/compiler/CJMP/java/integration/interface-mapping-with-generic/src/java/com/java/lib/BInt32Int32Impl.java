/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;

public class BInt32Int32Impl implements BInt32Int32 {
    public void foo(int v, int r) {
        System.out.print("Java: BInt32Int32Impl foo()!");
        System.out.print(v * r);
        System.out.println();
    }
    public int goo(int v) {
        System.out.print("Java: BInt32Int32Impl goo()!");
        return v;
    }

    public int doo(int v, int r) {
        System.out.println("Java: BInt32Int32Impl doo()!");
        return v + r;
    }
}
