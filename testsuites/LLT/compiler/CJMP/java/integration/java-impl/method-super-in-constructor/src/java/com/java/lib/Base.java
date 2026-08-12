// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Base {
    public Base() {
        System.out.println("java: Base()");
    }

    public long foo(long i) {
        System.out.println("java: foo(" + i + ")");
        return i + 1;
    }

    public boolean bar() {
        System.out.println("java: bar()");
        return true;
    }
}
