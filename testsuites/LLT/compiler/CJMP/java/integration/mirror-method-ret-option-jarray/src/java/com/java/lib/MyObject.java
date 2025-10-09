// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    public MyObject() {
        System.out.println("MyObject()");
    }

    public int check() {
        return 5;
    }

    public int[] getArrInt(boolean retNull, int size) {
        System.out.println("java: getArrInt(retNull" + retNull + ", size: " + size +" )");
        if (retNull) return null;

        int[] arr = new int[size];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = i * 2 + 1;
        }
        return arr;
    }

    public Object[] getArrObj(boolean retNull, int size) {
        System.out.println("java: getArrObj(retNull" + retNull + ", size: " + size +" )");
        if (retNull) return null;

        Object[] arr = new Object[size];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = i == 0 ? new MyObject() : new Object();
        }
        return arr;
    }

    public MyObject[] getArrMyObj(boolean retNull, int size) {
        System.out.println("java: getArrMyObj(retNull" + retNull + ", size: " + size +" )");
        if (retNull) return null;

        MyObject[] arr = new MyObject[size];
        for (int i = 0; i < arr.length; i++) {
            arr[i] = new MyObject();
        }
        return arr;
    }
}
