/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiReturn5 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiReturn5");
    }

    public static void main(String[] args) {
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            Data24 res = testFunc();
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiReturn5: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native Data24 testFunc();
}

class Data24 {
    byte a0;
    byte a1;
    short a2;
    short a3;
    int a4;
    int a5;
    int a6;
}
