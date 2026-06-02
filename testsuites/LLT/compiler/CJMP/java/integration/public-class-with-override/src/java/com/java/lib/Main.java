// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    public static void main(String[] args) {
        // access M
        M m = new M(3,(long)4);
        m.foo();
        long d1 = m.dog(1, 1, (short)1, (float)1.0);
        System.out.println(d1);

        // extend M
        M javaobj = new JavaObject();
        javaobj.foo();
        long d2 = javaobj.dog(2, 2, (short)2, (float)2.0);
        System.out.println(d2);
    }
}
