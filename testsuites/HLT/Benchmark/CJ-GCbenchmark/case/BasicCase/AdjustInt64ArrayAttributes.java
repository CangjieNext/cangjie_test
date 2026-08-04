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
import java.util.ArrayList;
import java.util.Arrays;

public class AdjustInt64ArrayAttributes  {

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
        ArrayList<A> className1 = new ArrayList<>();
        ArrayList<B> className2 = new ArrayList<>();

        long num_total = 0;
        for (int j = 0; j < 3000; ++j) {
            className1.add(new A());
            className2.add(new B());
            long num = 0;
            for (int i = 0; i < 10; ++i) { 
                num += (className1.get(j).x1 + className2.get(j).x1);
                num += (className1.get(j).x2 + className2.get(j).x2);
                num += (className1.get(j).x3 + className2.get(j).x3);
                num += (className1.get(j).x4 + className2.get(j).x4);
                num += (className1.get(j).x5 + className2.get(j).x5);
            }
            num_total += (num + className1.size() + className2.size());
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long end_total = System.nanoTime();
        System.out.println("AdjustInt64ArrayAttributes: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
