/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.A;
 
public class Main {
    public static int APrint(A a) {
        return a.foo();
    }
 
    public static void main(String[] args) {
        A aImp = new AImp();
        System.out.print(APrint(aImp));
    }
}