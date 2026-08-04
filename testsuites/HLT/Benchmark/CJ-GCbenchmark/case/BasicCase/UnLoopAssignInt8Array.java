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

public class UnLoopAssignInt8Array {

    static class A {
        byte x1 = 1;

        public A(byte inputA) {
            this.x1 = inputA;
        }
    }
    
    static class B {
        byte x1 = -1;

        public B(byte inputB) {
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

        A[] className1 = new A[5000000];
        B[] className2 = new B[5000000];
        for (int i = 0; i < 5000000; ++i) {
            className1[i] = new A((byte) (i % 127));
            className2[i] = new B((byte) (i % 127));
        }

        var num_total = 0;

        
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        num_total = num_total + className1.length + className2.length;
        var end_total = System.nanoTime();
        System.out.println("UnLoopAssignInt8Array: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
