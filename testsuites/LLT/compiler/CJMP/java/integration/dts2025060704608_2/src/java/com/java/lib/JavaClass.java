// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class JavaClass implements I1 {
    public JavaClass() {
        System.out.println("in JavaClass Init");
    }

    public I1 foo() {
        System.out.println("in JavaClass foo");
        return new JavaClass();
    }

    public int goo(I1 a) {
        System.out.println("in JavaClass goo");
        return 10;
    }

    public static int bar() {
        System.out.println("in JavaClass bar");
        return 100;
    }

    public int goo() {
        System.out.println("in JavaClass new goo");
        return 1000;
    }

    public static int bar(int a) {
        System.out.println("in JavaClass new bar");
        return a;
    }
}