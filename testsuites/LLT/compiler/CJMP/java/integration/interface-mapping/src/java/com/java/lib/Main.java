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
 
    public static void valueCheck(int value, int expectedValue) {
        if (value != expectedValue) {
            System.out.println("java: Test Failed, value: " + value + " != expected: " + expectedValue);
            System.exit(1); 
        }
    }
 
    public static A CreateHelloWorld(Boolean b) {
        A aImp;
        if (b) {
            aImp = new AImpOne("Hello World");
        } else {
            aImp = new AImpTwo("Hello World");
        }
        return aImp;
    }
 
    public static int APrintAndRet(A a, int input) {
        a.foo();
        return a.goo(input);
    }
 
    public static void main(String[] args) {
        int input = 5;
        int expectedValue = input;
        valueCheck(APrintAndRet(CreateHelloWorld(true), input), expectedValue);
        expectedValue = input * 2;
        valueCheck(APrintAndRet(CreateHelloWorld(false), input), expectedValue);
    }
}