/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;

abstract class C1 {
    public int v1 = 1;
    public static int v2 = 2;

    public C1() {
        System.out.println("in C1 init" + v1 + v2);
    }

    public int goo() {
        System.out.println("in C1 goo");
        return v1;
    }

    public static int bar() {
        System.out.println("in C1 bar");
        return v2;
    }

    public abstract int newoo();
}

public class JavaClass extends C1 {
    public JavaClass() {
        System.out.println("in JavaClass Init" + v1 + v2);
    }

    public static int bar() {
        System.out.println("in JavaClass bar");
        return v2 + 100;
    }

    public int newoo() {
        System.out.println("in JavaClass new newoo");
        return v1 + 10000;
    }
}