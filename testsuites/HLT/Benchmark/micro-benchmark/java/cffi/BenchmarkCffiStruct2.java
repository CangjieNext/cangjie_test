/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiStruct2 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiStruct2");
    }

    public static void main(String[] args) {
        Data24 param1 = new Data24((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7);
        Data24 param2 = new Data24((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7);
        Data24 param3 = new Data24((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7);
        Data24 param4 = new Data24((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiStruct2: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(Data24 param1, Data24 param2, Data24 param3, Data24 param4);
}

class Data24 {
    byte a0;
    byte a1;
    short a2;
    short a3;
    int a4;
    int a5;
    long a6;

    Data24(byte a0, byte a1, short a2, short a3, int a4, int a5, long a6) {
        this.a0 = a0;
        this.a1 = a1;
        this.a2 = a2;
        this.a3 = a3;
        this.a4 = a4;
        this.a5 = a5;
        this.a6 = a6;
    }
}
