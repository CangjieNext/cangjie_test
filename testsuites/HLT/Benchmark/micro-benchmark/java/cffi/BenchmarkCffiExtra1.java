/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiExtra1 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiExtra1");
    }

    public static void main(String[] args) {
        StructB b = new StructB(
                new byte[] { (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1,
                        (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1 },
                2, 3, new byte[] { (byte) 4, (byte) 4, (byte) 4, (byte) 4, (byte) 4, (byte) 4 }, (byte) 5, (byte) 5,
                (short) 6, (short) 8, (byte) 9, (byte) 10);
        StructA a = new StructA(new byte[] { (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1, (byte) 1 },
                new byte[] { (byte) 2, (byte) 2, (byte) 2, (byte) 2, (byte) 2, (byte) 2 }, (byte) 3, (byte) 4, (byte) 5,
                (byte) 6, 7, b);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(a);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiExtra1: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(StructA param1);
}

class StructA {
    byte[] a0;
    byte[] a1;
    byte a2;
    byte a3;
    byte a4;
    byte a5;
    int a6;
    StructB a7;

    StructA(byte[] a0, byte[] a1, byte a2, byte a3, byte a4, byte a5, int a6, StructB a7) {
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

class StructB {
    byte[] b0;
    int b1;
    int b2;
    byte[] b3;
    byte b4;
    byte b5;
    short b6;
    short b7;
    byte b8;
    byte b9;

    StructB(byte[] b0, int b1, int b2, byte[] b3, byte b4, byte b5, short b6, short b7, byte b8, byte b9) {
        this.b0 = b0;
        this.b1 = b1;
        this.b2 = b2;
        this.b3 = b3;
        this.b4 = b4;
        this.b5 = b5;
        this.b6 = b6;
        this.b7 = b7;
        this.b8 = b8;
        this.b9 = b9;
    }
}
