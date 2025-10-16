// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    private String value;

    public MyObject(I2 value) {
        this.value = "" + value.test();
    }

    public MyObject(String value) {
        this.value = value;
    }

    public MyObject(MyObject mo) {
        this.value = mo.value;
    }

    public MyObject(MyObject[] mos) {
        this.value = "";
        for (MyObject mo : mos) {
            if (mo != null) {
                this.value += mo.getValue();
            } else {
                this.value += "null";
            }
        }
    }

    public String getValue() {
        return this.value;
    }
}
