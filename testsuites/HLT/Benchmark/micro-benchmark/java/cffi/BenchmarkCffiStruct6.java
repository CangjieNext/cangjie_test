/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiStruct6 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiStruct6");
    }

    public static void main(String[] args) {
        Data64 param1 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiStruct6: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(Data64 param1);
}

class Data64 {
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

    Data64(byte a0, byte a1, short a2, short a3, int a4, int a5, long a6, long a7, byte a8, byte a9, short a10,
            short a11, int a12, int a13, long a14, long a15) {
        this.a0 = a0;
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.a5 = a5;
        this.a6 = a6;
        this.a7 = a7;
        this.a8 = a8;
        this.a9 = a9;
        this.a10 = a10;
        this.a11 = a11;
        this.a12 = a12;
        this.a13 = a13;
        this.a14 = a14;
        this.a15 = a15;
    }
}
