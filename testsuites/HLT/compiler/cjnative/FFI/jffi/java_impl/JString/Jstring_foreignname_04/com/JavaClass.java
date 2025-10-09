/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;

public class JavaClass{
    public static int v1 = 1;

    public JavaClass() {
        System.out.println("in JavaClass Init");
    }
    public static int loaction_return() {
        System.out.println("in JavaClass loaction_return");
        return 1;
    }
    public static int loaction_param() {
        System.out.println("in JavaClass loaction_param:" + v1);
        return 10;
    }

}