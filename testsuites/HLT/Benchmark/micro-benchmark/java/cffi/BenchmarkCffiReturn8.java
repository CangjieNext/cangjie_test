/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiReturn8 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiReturn8");
    }

    public static void main(String[] args) {
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            Data256 res = testFunc();
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiReturn8: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native Data256 testFunc();
}

class Data256 {
    byte a0;
    byte a1;
    short a2;
    short a3;
    int a4;
    int a5;
    long a6;
    long a7;
    byte a8;
    byte a9;
    short a10;
    short a11;
    int a12;
    int a13;
    long a14;
    long a15;
    long a16;
    long a17;
    long a18;
    long a19;
    long a20;
    long a21;
    long a22;
    long a23;
    long a24;
    long a25;
    long a26;
    long a27;
    long a28;
    long a29;
    long a30;
    long a31;
    long a32;
    long a33;
    long a34;
    long a35;
    long a36;
    long a37;
    long a38;
    long a39;
}
