// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        Impl impl = new Impl();

        testAccept1(impl);
        testReturn1(impl);
    }

    private static void testAccept1(Impl impl) {
        System.out.println("java: test accept1");
        Impl[][][] arr = new Impl[2][1][2];

        arr[0] = null;
        arr[1][0][0] = new Impl(55);
        arr[1][0][1] = new Impl(110);

        impl.accept1(arr);
        System.out.println("java: finish test accept1");
    }

    private static void testReturn1(Impl impl) {
        System.out.println("java: test return1");
        impl.accept1(impl.return1());
        System.out.println("java: finish test return1");
    }
}
