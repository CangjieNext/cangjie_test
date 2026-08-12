/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.Random;
import java.util.Arrays;

public class InheritanceAndInt64Addition {

    static class A {
        long x1 = 1;
        long x2 = -2;
        long x3 = 3;
        long x4 = -4;
        long x5 = 5;
        Double[] arrayA = new Double[1024];

        public A() {
            for (int i = 0; i < 1024; ++i) {
                arrayA[i] = 7.0;
            }
        }
        
    }
    
    static class B extends A{
        Double[] arrayB = new Double[1024];
        public B() {
            for (int i = 0; i < 1024; ++i) {
                arrayB[i] = 8.0;
            }
        }
    }

    static class C extends B{
        Double[] arrayC = new Double[1024];
        public C() {
            for (int i = 0; i < 1024; ++i) {
                arrayC[i] = 9.0;
            }
        }
    }

    static class D extends C{
        Double[] arrayD = new Double[1024];
        public D() {
            for (int i = 0; i < 1024; ++i) {
                arrayD[i] = 10.0;
            }
        }
    }

    static class E extends D{
        Double[] arrayE = new Double[1024];
        public E() {
            for (int i = 0; i < 1024; ++i) {
                arrayE[i] = 11.0;
            }
        }
    }
    
    public static void main(String[] args) {
        var start_total = System.nanoTime();

        long num_total = 0;
        for (int j = 0; j < 100000; ++j) {
            D d = new D();
            E e = new E();
            long num = 0;
            for (int i = 0; i < 10000; ++i) { 
                num += (d.x1 + e.x1);
                num += (d.x2 + e.x2);
                num += (d.x3 + e.x3);
                num += (d.x4 + e.x4);
                num += (d.x5 + e.x5);
            }
            num_total += (num + j);
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long end_total = System.nanoTime();
        System.out.println("InheritanceAndInt64Addition: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
