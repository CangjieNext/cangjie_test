// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class JavaObject extends M{

    @Override
    public long dog(int a, int b, short c, float d) {
        System.out.println("in JavaObject dog().");
        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
        System.out.println(d);

        double g2 = goo(2);
        System.out.println(g2);
        return 10;
    }
}
