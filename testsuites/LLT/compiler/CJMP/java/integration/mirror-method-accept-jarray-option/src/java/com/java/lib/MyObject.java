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

    public int getSize(Object[] arr) {
        return arr.length;
    }

    public boolean hasNull(Object[] arr) throws Exception {
        if (arr == null) {
            throw new Exception("java: arr is null");
        }

        for (Object elem : arr) {
            if (elem == null) {
                System.out.println("java: hasNull(arr) = true");
                return true;
            }
        }

        System.out.println("java: hasNull(arr) = false");
        System.out.flush();
        return false;
    }

    public boolean isNull(Object obj) {
        return obj == null;
    }
}
