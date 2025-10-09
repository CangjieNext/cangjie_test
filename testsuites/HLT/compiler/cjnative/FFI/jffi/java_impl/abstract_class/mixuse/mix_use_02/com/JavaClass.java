/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;

public class JavaClass extends C1 implements I1, I2 {
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

    public int foo3() {
        return 53;
    }

    public static int goo3() {
        return 530;
    }

    public int foo4() {
        return 54;
    }
}