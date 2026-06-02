// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Vector;

public class Main {


    public static void main(String[] args) {
        System.out.println("hello!");
        // 异常发生在直接调用构造函数中
        try {
            Vector vec = new Vector();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }

        try {
            Vector vec = new Vector(1, 2);
            vec.dot(vec);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }

        try {
            Vector vec = new Vector(1, 2);
            vec.div(1, 0);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }

        try {
            Vector.hello();
        } catch (Exception e) {
            e.printStackTrace(System.out);
        }
    }
}
