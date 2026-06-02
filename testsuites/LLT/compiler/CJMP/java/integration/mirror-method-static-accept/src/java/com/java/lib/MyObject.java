// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class MyObject {
    public MyObject() {
        System.out.println("MyObject()");
    }

    public static void check(int value) throws Exception {
        System.out.println("java: MyObject.check(" + value + ")");
        if (value != 10) {
            throw new Exception("In check(): value != 10");
        }
    }

    public static void self(MyObject obj) throws Exception {
        System.out.println("java: MyObject.self()");
        if (obj.value() != 2) {
            throw new Exception("in self(): obj.value != 2");
        }
    }

    public static void impl(Impl impl) throws Exception {
        System.out.println("java: MyObject.impl()");
        if (impl == null) {
            throw new Exception("in impl: impl == null");
        }
    }

    // extra non-static method
    public int value() {
        return 2;
    }
}
