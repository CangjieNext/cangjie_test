// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        // super(1)
        Impl impl0 = new Impl();
        System.out.println("value = " + impl0.getValue());
        // super(value + 1) -> 1 + 1
        Impl impl1 = new Impl(1);
        System.out.println("value = " + impl1.getValue());
        // super(y + x) -> 3 + 2
        Impl impl2 = new Impl(2, 3);
        System.out.println("value = " + impl2.getValue());
        // super(y + x + gv + gf(z)) -> 4 + 5 + 1 + (6 + 1)
        Impl impl3 = new Impl(4, 5, 6);
        System.out.println("value = " + impl3.getValue());
        /*
            super(if (x > y) {x} else {y} + match {
                case z > u => u
                case u > z => z
                case _ => u
            })
         */
        Impl impl4 = new Impl(7, 8, 9, 10); // 8 + 9
        System.out.println("value = " + impl4.getValue());
    }
}
