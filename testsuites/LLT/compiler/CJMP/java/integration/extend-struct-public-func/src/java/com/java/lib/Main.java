// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Vector;

public class Main {
    public static void main(String[] args) {
        Vector.hello(new Vector(0, 0));
        Vector u = new Vector(1, 2);
        Vector v = new Vector(3, 4);
        Vector.hello(u.add(v));
    }
}
