// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    private static void test01() {
        Impl impl = new Impl();
        try {
            impl.hello2(); // 测试异常Cangjie全局函数中产生
        } catch (Exception e) {
            System.out.println("Catch Exceptin from Cangjie: " + e.getMessage());
        }

        try {
            impl.hello(); // 测试异常在 Java 侧产生
        } catch (ArithmeticException ae) {
            System.out.println("Catch ArithmeticException from Cangjie: " + ae.getMessage());
        } catch (Exception e) {
            System.out.println("Catch Exceptin from Cangjie: " + e.getMessage());
        }
    }

    private static void test02() {
        Impl2 impl2 = new Impl2();
        MyObject obj = new MyObject();
        try {
            impl2.foo(obj); // 使用 JavaMirror 对象调用产生异常
        } catch (ArithmeticException ae) {
            System.out.println("Catch ArithmeticException from Cangjie: " + ae.getMessage());
        } catch (Exception e) {
            System.out.println("Catch Exception from Cangjie: " + e.getMessage());
        }
        Impl impl = new Impl();
        try {
            impl2.foo(impl); // 使用 JavaImpl 对象调用产生异常
        } catch (ArithmeticException ae) {
            System.out.println("Catch ArithmeticException from Cangjie: " + ae.getMessage());
        }  catch (Exception e) {
            System.out.println("Catch Exception from Cangjie: " + e.getMessage());
        }
    }
    public static void main(String[] args) {
        test01();
        test02();
    }
}
