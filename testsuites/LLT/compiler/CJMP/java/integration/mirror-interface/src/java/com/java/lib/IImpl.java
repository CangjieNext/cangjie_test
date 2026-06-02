// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

class IImpl implements I {
    public I foo() {
        System.out.println("JAVA: Hello from IImpl! [foo(): I]");
        return new IImpl();
    }

    public long foo(I i) {
        System.out.println("JAVA: Hello from IImpl! [foo(I): long]");
        return 1L;
    }
}