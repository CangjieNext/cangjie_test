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

    public boolean isNull(int[] arr) throws Exception {
        if (arr == null) {
            System.out.println("java: isNull(arr) = true");
        } else {
            System.out.println("java: isNull(arr) = false");

            if (arr.length != 5) {
                throw new Exception("int[] bad size");
            }
            if (arr[0] != 1) {
                throw new Exception("int[] bad start");
            }
            if (arr[4] != 10) {
                throw new Exception("int[] bad end");
            }
        }
        return arr == null;
    }

    public boolean isNull(Object[] arr) {
        if (arr == null) {
            System.out.println("java: isNull(arr) = true");
        } else {
            System.out.println("java: isNull(arr) = false");
        }
        return arr == null;
    }

    public boolean isNull(MyObject[] arr) {
        if (arr == null) {
            System.out.println("java: isNull(arr) = true");
        } else {
            System.out.println("java: isNull(arr) = false");
        }
        return arr == null;
    }
}
