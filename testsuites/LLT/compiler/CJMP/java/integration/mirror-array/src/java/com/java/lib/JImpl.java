// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class JImpl {
    public JImpl() {
        System.out.println("java: JImpl()");
    }

    public void takeArr(long[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.println("java: " + i + "th of long[] - " + arr[i]);
        }
    };

    public void takeArr(int[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.println("java: " + i + "th of long[] - " + arr[i]);
        }
    };

    public long[] getArr() { long[] a = {6, 7, 13}; return a; };
    public int[] getArrInt() { int[] a = {6, 7, 13}; return a; };

    public void takeArr2(JImpl[] arr) {
        for (int i = 0; i < arr.length; i++) {
            System.out.println("java: " + i + "th of JImpl[] - " + arr[i].getInt());
        }
    };

    public JImpl[] getArr2() { JImpl[] a = {new JImpl(), new JImpl(), new JImpl()}; return a; };

    public long getInt() { return 55312; };
}
