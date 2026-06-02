// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        // Primitive: super(2 + 3)
        Impl impl0 = new Impl();
        System.out.println("value = " + impl0.getValue());
        // JavaMirror: super(MyObject(value))
        Impl impl1 = new Impl(1);
        System.out.println("value = " + impl1.getValue());
        // JavaImpL: super(Impl(x * y))
        Impl impl2 = new Impl(2, 3);
        System.out.println("value = " + impl2.getValue());
    }
}
