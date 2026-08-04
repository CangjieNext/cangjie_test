/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiStruct3 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiStruct3");
    }

    public static void main(String[] args) {
        Data32 param1 = new Data32((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8);
        Data32 param2 = new Data32((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8);
        Data32 param3 = new Data32((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8);
        Data32 param4 = new Data32((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiStruct3: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(Data32 param1, Data32 param2, Data32 param3, Data32 param4);
}

class Data32 {
    byte a0;
    byte a1;
    short a2;
    short a3;
    int a4;
    int a5;
    long a6;
    long a7;

    Data32(byte a0, byte a1, short a2, short a3, int a4, int a5, long a6, long a7) {
        this.a0 = a0;
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.a5 = a5;
        this.a6 = a6;
        this.a7 = a7;
    }
}
