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

    private final int magic = 55;

    public static void check(MyObject obj) throws Exception {
        if (obj == null) throw new Exception("obj is null");
        if (obj.magic != 55) throw new Exception("obj is broken, magic = " + obj.magic);
    }
}
