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
 
    public static A CreateHelloWorld(Boolean b) {
        A aImp;
        if (b) {
            aImp = new AImpOne();
        } else {
            aImp = new AImpTwo();
        }
        return aImp;
    }
 
    public static void APrint(A a) {
        a.foo();
    }
 
    public static void main(String[] args) {
        APrint(CreateHelloWorld(true));
        APrint(CreateHelloWorld(false));
    }
}