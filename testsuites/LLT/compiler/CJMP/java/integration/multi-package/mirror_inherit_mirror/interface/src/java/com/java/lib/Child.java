// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Child implements Interface {
    public Child() {
        System.out.println("JAVA: Child()");
    }

    public Interface getThisInterface() {
        System.out.println("JAVA: getThisInterface()");
        return this;
    }

    @Override
    public void foo() {
        System.out.println("JAVA: child.foo()");
    }
}
