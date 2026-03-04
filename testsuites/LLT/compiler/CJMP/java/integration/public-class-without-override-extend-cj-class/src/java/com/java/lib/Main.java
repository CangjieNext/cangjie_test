// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    public static void main(String[] args) {
        M m = new M();
        m.goo(1);
        M.staticFunc(10);
        M m1 = m.objectRet();
        m1.goo(2);
        m1.doo(2);
    }
}
