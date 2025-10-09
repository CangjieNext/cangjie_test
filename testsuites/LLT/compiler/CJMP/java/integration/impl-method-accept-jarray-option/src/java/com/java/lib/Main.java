// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) throws Exception {
        Impl impl = new Impl();

        testAccept1(impl);
        testAccept2(impl);
        testAccept3(impl);
    }

    private static void testAccept1(Impl impl) {
        System.out.println("java: test accept1");
        Impl[] arr = new Impl[3];

        arr[0] = null;
        arr[1] = new Impl(55);
        arr[2] = null;

        impl.accept1(arr);
        System.out.println("java: finish test accept1");
    }

    private static void testAccept2(Impl impl) {
        System.out.println("java: test accept2");
        Impl[][] arr = new Impl[3][1];

        arr[0] = null;
        arr[1][0] = new Impl(55);
        arr[2] = null;

        impl.accept2(arr);
        System.out.println("java: finish test accept2");
    }

    private static void testAccept3(Impl impl) {
        System.out.println("java: test accept3");
        impl.accept3();
        System.out.println("java: finish test accept3");
    }
}
