// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    static {
        sx = 10;
        System.out.println("java static var sx init");
        sy = 100;
        System.out.println("java static final sy init");
    }
    public MyObject(short y) {
        this.y = y;
        System.out.println("java: final y init");
        this.x = true;
        System.out.println("java: var x init");
    }
    public boolean x;
    public final short y;
    public static int sx;
    public static final long sy;
}
