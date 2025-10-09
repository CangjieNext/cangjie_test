// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        // Primitive
        Impl impl0 = new Impl(1);
        System.out.println("value = " + impl0.getValue());
        // JavaMirror
        Impl impl1 = new Impl(new MyObject(2));
        System.out.println("value = " + impl1.getValue());
        // JavaImpL
        Impl impl2 = new Impl(new Impl(3));
        System.out.println("value = " + impl2.getValue());
        // String
        Impl impl3 = new Impl(new Impl("4"));
        System.out.println("value = " + impl3.getValue());
    }
}
