// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class MyObject {
    public MyObject() {
        System.out.println("MyObject()");
    }

    public int check() {
        System.out.println("java: check()");
        return 5;
    }

    public Impl getImpl() {
        System.out.println("java: getImpl()");
        return new Impl(5);
    }
}
