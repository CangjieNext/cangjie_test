/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiStruct8 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiStruct8");
    }

    public static void main(String[] args) {
        Data64 param1 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param2 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param3 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param4 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param5 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param6 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param7 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param8 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param9 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param10 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param11 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param12 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param13 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param14 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param15 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        Data64 param16 = new Data64((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11,
                    param12, param13, param14, param15, param16);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiStruct8: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(Data64 param1, Data64 param2, Data64 param3, Data64 param4, Data64 param5,
            Data64 param6, Data64 param7, Data64 param8, Data64 param9, Data64 param10, Data64 param11, Data64 param12,
            Data64 param13, Data64 param14, Data64 param15, Data64 param16);
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
