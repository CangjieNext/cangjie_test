// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    public void foo() {
        System.out.println("java: foo()");
    }

    public int bar() {
        System.out.println("java: bar()");
        return 15;
    }

    public int foo(int a) {
        System.out.println("java: foo(" + a + ")");
        return a;
    }

    public String foo(String a) {
        System.out.println("java: foo(" + a + ")");
        return a;
    }

    public MyObject foo(MyObject a) {
        System.out.println("java: foo(MyObject" + (a == null ? " - null" : "") + ")" );
        return a;
    }

    public long testValue() {
        return 1;
    }
}
