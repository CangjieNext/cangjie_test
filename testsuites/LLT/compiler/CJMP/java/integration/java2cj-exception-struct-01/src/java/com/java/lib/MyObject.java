// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    // java 侧函数抛异常
    public void hello() throws Exception {
        throw new ArithmeticException("ArithmeticException in Base::hello");
    }
}
