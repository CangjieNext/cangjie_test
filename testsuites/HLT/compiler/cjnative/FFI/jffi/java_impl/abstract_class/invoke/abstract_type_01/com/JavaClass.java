/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;

abstract class C1 {
    public C1() {
        System.out.println("in C1 init");
    }

    public int goo() {
        System.out.println("in C1 goo");
        return 66;
    }

    public static int bar() {
        System.out.println("in C1 bar");
        return 1;
    }

    public abstract C1 newoo(C1 c1);
}

public class JavaClass extends C1 {
    public JavaClass() {
        System.out.println("in JavaClass Init");
    }

    public static int bar() {
        System.out.println("in JavaClass bar");
        return 100;
    }

    public C1 newoo(C1 c1) {
        System.out.println("in JavaClass new newoo");
        return new JavaClass();
    }
}