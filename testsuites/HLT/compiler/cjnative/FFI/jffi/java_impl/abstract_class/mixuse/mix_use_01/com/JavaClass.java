/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;

interface I1 {
    public int foo1();

    public int foo2();

    public static int goo1() {
        return 1;
    }

    public static int goo2() {
        return 2;
    }
}

abstract class C1 implements I1 {
    public C1() {
        System.out.println("in C1 init");
    }

    public int foo1() {
        return 1;
    }

    public static int goo1() {
        return 10;
    }
}

public class JavaClass extends C1 {
    public JavaClass() {
        System.out.println("in JavaClass Init");
    }

    public int foo1() {
        return 51;
    }

    public static int goo1() {
        return 510;
    }

    public int foo2() {
        return 52;
    }

    public static int goo2() {
        return 520;
    }
}