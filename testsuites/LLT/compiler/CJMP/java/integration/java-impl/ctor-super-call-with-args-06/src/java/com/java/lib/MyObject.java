// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    private String value;

    public static long base = 1;

    public MyObject(long val) {
        this.value = "" + val;
    }

    public String getValue() {
        return this.value;
    }
}
