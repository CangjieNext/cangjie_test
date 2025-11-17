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

    public abstract int newoo();
}

public class JavaClass extends C1 {
    public JavaClass() {
        System.out.println("in JavaClass Init");
    }

    public int newoo() {
        System.out.println("in JavaClass new newoo");
        return 10000;
    }
}