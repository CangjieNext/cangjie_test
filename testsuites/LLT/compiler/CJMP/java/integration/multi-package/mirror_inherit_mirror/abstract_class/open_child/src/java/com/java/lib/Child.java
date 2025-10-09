// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import com.java.lib.Abstract;

public class Child extends Abstract {
    public Child() {
        System.out.println("JAVA: Child()");
    }

    @Override
    public Abstract foo() {
        System.out.println("JAVA: child.foo()");
        return this;
    }
}
