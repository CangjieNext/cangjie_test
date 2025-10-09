// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Vector;

public class Main {

    public static Vector getVector(int x, int y) {
        return new Vector(x, y);
    }

    public static void valueCheck(long value, long expectedValue) {
        if (value != expectedValue) {
            System.out.println("java: Test Failed, value: " + value + " != expected: " + expectedValue);
            System.exit(1); 
        }
    }

    public static void main(String[] args) {
        Vector.hello(getVector(0, 0));
        Vector u = new Vector(1, 2);
        Vector v = getVector(3, 4);
        long expectedValue = 1 * 3 + 2 * 4;
        valueCheck(u.dot(v), expectedValue);
        Vector w = u.add(v); // w = (4, 6)
        expectedValue = 4 * 1 + 6 * 2;
        valueCheck(w.dot(u), expectedValue);
        expectedValue = 3 * 4 + 4 * 6;
        valueCheck(v.dot(w), expectedValue);
        System.out.println("java: Correct result, dot value Test PASS.");
    }
}