// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        // JavaMirror: 2
        Impl impl1 = new Impl(new MyObject("2"));
        System.out.println("value = " + impl1.getValue());
        // Interface: true
        I2 i2 = new Impl("3");
        Impl impl2 = new Impl(i2);
        System.out.println("value = " + impl2.getValue());
        // MyObject: 4
        MyObject mo = new Impl("4");
        Impl impl3 = new Impl(mo);
        System.out.println("value = " + impl3.getValue());
        // MyObject[]: 2true
        Impl impl4 = new Impl(impl1, impl2);
        System.out.println("value = " + impl4.getValue());

        // MyObject[]: 2truenull4
        MyObject[] mos = {impl1, impl2, null, impl3};
        Impl impl5 = new Impl(mos);
        System.out.println("value = " + impl5.getValue());

    }
}
