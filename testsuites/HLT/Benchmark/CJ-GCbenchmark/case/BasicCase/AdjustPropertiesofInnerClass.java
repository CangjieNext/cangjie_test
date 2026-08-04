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

public class AdjustPropertiesofInnerClass {
    static class A{
        long x1;
        long x2;
        long x3;
        long x4;
        long x5; 

        public A(long inputA) {
            this.x1 = inputA + 1;
            this.x2 = inputA + 2;
            this.x3 = inputA - 1;
            this.x4 = inputA - 2;
            this.x5 = inputA - 3;
        }
        
    }
    
    public static void main(String[] args) {
        var start_total = System.nanoTime();
        ArrayList<A> className1 = new ArrayList<>();
        ArrayList<A> className2 = new ArrayList<>();
        long num_total = 0;

        for (int j = 0; j < 3000; ++j) {
            className1.add(new A(j));
            className2.add(new A(j-1));
            long num = 0;
            for (int i = 0; i < 10; ++i) { 
                num += (className1.get(j).x1 + className2.get(j).x1);
                num += (className1.get(j).x2 + className2.get(j).x2);
                num += (className1.get(j).x3 + className2.get(j).x3);
                num += (className1.get(j).x4 + className2.get(j).x4);
                num += (className1.get(j).x5 + className2.get(j).x5);
            }
            num_total += (num + j);
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        long end_total = System.nanoTime();
        System.out.println("AdjustPropertiesofInnerClass: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
