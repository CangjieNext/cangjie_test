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

public class Int64Addition {

    static class A {
        long x1 = 1;
        long x2 = -2;
        long x3 = 3;
        long x4 = -4;
        long x5 = 5;
        Double[] array = new Double[2048];

        public A() {
            for (int i = 0; i < 2048; ++i) {
                array[i] = 7.0;
            }
        }
        
    }
    
    static class B {
        long x1 = -1;
        long x2 = 2;
        long x3 = -3;
        long x4 = 4;
        long x5 = -5;
        Double[] array = new Double[2048];

        public B() {
            for (int i = 0; i < 2048; ++i) {
                array[i] = 8.0;
            }
        }
    }
    
    public static void main(String[] args) {
        var start_total = System.nanoTime();

        long num_total = 0;
        for (int j = 0; j < 100000; ++j) {
            A a = new A();
            B b = new B();
            long num = 0;
            for (int i = 0; i < 10000; ++i) { 
                num += (a.x1 + b.x1);
                num += (a.x2 + b.x2);
                num += (a.x3 + b.x3);
                num += (a.x4 + b.x4);
                num += (a.x5 + b.x5);
            }
            num_total += (num + j);
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long end_total = System.nanoTime();
        System.out.println("Int64Addition: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
