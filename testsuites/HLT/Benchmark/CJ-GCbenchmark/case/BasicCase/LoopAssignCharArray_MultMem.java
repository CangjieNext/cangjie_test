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

public class LoopAssignCharArray_MultMem {

    static class A {
        char x1 = 'A';
        char x2 = 'A';
        char x3 = 'A';
        char x4 = 'A';
        char x5 = 'A';
        char x6 = 'A';
        char x7 = 'A';
        char x8 = 'A';

        public A(char inputA) {
            this.x1 = inputA;
            this.x2 = inputA;
            this.x3 = inputA;
            this.x4 = inputA;
            this.x5 = inputA;
            this.x6 = inputA;
            this.x7 = inputA;
            this.x8 = inputA;
        }
    }
    
    static class B {
        char x1 = 'B';
        char x2 = 'B';
        char x3 = 'B';
        char x4 = 'B';
        char x5 = 'B';
        char x6 = 'B';
        char x7 = 'B';
        char x8 = 'B';

        public B(char inputB) {
            this.x1 = inputB;
            this.x2 = inputB;
            this.x3 = inputB;
            this.x4 = inputB;
            this.x5 = inputB;
            this.x6 = inputB;
            this.x7 = inputB;
            this.x8 = inputB;
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
            className1[i] = new A((char) (i % 32767));
            className2[i] = new B((char) (i % 32767));
        }
        for (int i = 0; i < 1000000; ++i) {
            className1[i] = new A((char) (i % 32767));
            className2[i] = new B((char) (i % 32767));
        }
        var num_total = 0;

        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        num_total = num_total + className1.length + className2.length;
        var end_total = System.nanoTime();
        System.out.println("LoopAssignCharArray_MultMem: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
