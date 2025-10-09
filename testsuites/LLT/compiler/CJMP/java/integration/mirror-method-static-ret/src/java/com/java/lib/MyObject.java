// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    public MyObject() {
        System.out.println("MyObject()");
    }

    public static int check() {
        System.out.println("java: MyObject.check()");
        return 5;
    }

    public static MyObject self() {
        System.out.println("java: MyObject.self()");
        return new MyObject();
    }

    // extra non-static method
    public int value() {
        System.out.println("java: value()");
        return 2;
    }
}
