/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class Main {
    public static void main(String[] args) {
         A cjA = new A();
        Int32ToInt32 display = cjA.getCjLambda();
        System.out.println("Java: cangjie lambda:" + display.call(10));
        System.out.print("Java: cangjie ");
        Int32ToInt32 reDis = cjA.test(display);
        System.out.println("lambda return param: " + reDis.call(10));

        Int32ToInt32 javaL = a -> a*3;
        System.out.print("Java: java ");
        Int32ToInt32 reJava = cjA.test(javaL);
        System.out.println("lambda return param: " + reJava.call(20));

        IImpl imp = new IImpl();
        Int32ToInt32 i = b -> b + 3;
        Int32ToInt32 w = imp.test(i); // 13
        System.out.println("Java: IImpl with java lambda return func ret:" + w.call(12)); // 2
        Int32ToInt32 w2 = imp.test(display); // 12
        System.out.println("Java: IImpl with cj lambda return func ret:" + w.call(12)); // 2
        Int32ToInt32 c = cjA.goo(imp, 0);
        System.out.println("Java: Cj class A param IImpl return func ret:" + c.call(13)); // 3
        Int32ToInt32 c2 = cjA.goo(imp, 1);
        System.out.println("Java: Cj class A param IImpl default method doo return func ret:" + c2.call(13)); // 14 19

        ImplDefault imde = new ImplDefault();
        Int32ToInt32 c4 = cjA.goo(imde, 1);
        System.out.println("Java: Cj class A param IImpl java override default method doo return func ret:" + c4.call(13)); // 15 2

        A cja = new A(display); // Int32ToInt32 ctor. 44
        System.out.println("Java: call cj A static method, param cj lambda, ret func ret: " + A.staticFunc(display).call(10)); // 8 11
        System.out.println("Java: call cj A static method, param java lambda, ret func ret: " + A.staticFunc(javaL).call(10)); // 18 11

        B b = new B();
        System.out.println("Java: call open cj B, param cj lambda, ret func ret: " + b.testLambda(display).call(10)); // 12 12
        System.out.println("Java: call open cj B, param java lambda, ret func ret: " + b.testLambda(javaL).call(10)); // 30 12

        B b1 = new BChild();
        System.out.println("Java: call java BChild, param cj lambda, ret func ret: " + b1.testLambda(display).call(10)); // 4 40
        System.out.println("Java: call java BChild, param java lambda, ret func ret: " + b1.testLambda(javaL).call(10)); // 6 40

        S s = new S();
        System.out.println("Java: call cj S, param cj lambda, ret func ret: " + s.test(display).call(10)); // 9 17
        System.out.println("Java: call cj S, param java lambda, ret func ret: " + s.test(javaL).call(10)); // 21 17

        TimeUnit t = TimeUnit.Year(30);
        System.out.println("Java: call enum TimeUnit, param cj lambda, ret func ret: " + t.NumCalcMonth(display).call(10)); // 32 19
        System.out.println("Java: call enum TimeUnit, param java lambda, ret func ret: " + t.NumCalcMonth(javaL).call(10)); // 90 19
    }
}