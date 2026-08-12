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

public class UnLoopAssignStringArray2 {

    static class A {
        String x1 = "A";

        public A(String inputA) {
            this.x1 = inputA;
        }
    }
    
    static class B {
        String x1 = "B";

        public B(String inputB) {
            this.x1 = inputB;
        }
    }
    
    public static void main(String[] args) {
        var start_total = System.nanoTime();

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        A[] className1 = new A[1000000];
        B[] className2 = new B[1000000];
        for (int i = 0; i < 1000000; ++i) {
            className1[i] = new A(String.valueOf(i));
            className2[i] = new B(String.valueOf(i));
        }

        var num_total = 0;

        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        num_total = num_total + className1.length + className2.length;
        var end_total = System.nanoTime();
        System.out.println("UnLoopAssignStringArray2: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
