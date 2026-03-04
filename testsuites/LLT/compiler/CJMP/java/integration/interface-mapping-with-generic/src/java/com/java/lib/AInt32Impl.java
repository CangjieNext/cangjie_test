/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class AInt32Impl implements AInt32 {
    public void goo(int v) {
        System.out.print("Java: AInt32Impl goo()!");
        System.out.print(v);
        System.out.println();
    }

    public int doo(int v) {
        System.out.println("Java: AInt32Impl doo()!");
        return v*2;
    }

    public int koo(int v) {
        System.out.println("Java: AInt32Impl koo()!");
        return v*3;
    }
}