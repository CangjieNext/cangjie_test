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

    public MyObject self = this;

    public MyObject selfNull = null;

    public MyObject selfOptionOptionOption = this;

    public MyObject selfOptionOptionOptionNull = null;
}
