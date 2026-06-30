// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        // Test Case2: 
        Impl impl2 = new Impl(new int[]{1}, (byte) 2, new double[]{1.0}, new float[]{1.0f}, new float[]{1.0f});
        System.out.println("value: " + impl2.getValue());

        // Test Case3: 
        Impl impl3 = new Impl((short) 1, 1, 114.514000F, new byte[]{1}, new byte[]{2});
        System.out.println("value: " + impl3.getValue());

        // Test Case4: 
        Impl impl4 = new Impl(new float[]{1.0f}, 2, new byte[]{3}, new char[]{'a'}, new char[]{'b'}, new int[]{6}, 114.514000F, new float[]{8.0f}, new float[]{9.0f}, (byte) 10);
        System.out.println("value: " + impl4.getValue());
    }
}
