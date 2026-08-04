/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiStruct5 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiStruct5");
    }

    public static void main(String[] args) {
        Data512 param1 = new Data512((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
                59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72);
        Data512 param2 = new Data512((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
                59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72);
        Data512 param3 = new Data512((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
                59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72);
        Data512 param4 = new Data512((byte) 1, (byte) 2, (short) 3, (short) 4, 5, 6, 7, 8, (byte) 9, (byte) 10,
                (short) 11, (short) 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32,
                33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58,
                59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiStruct5: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(Data512 param1, Data512 param2, Data512 param3, Data512 param4);
}

class Data512 {
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
    long a40;
    long a41;
    long a42;
    long a43;
    long a44;
    long a45;
    long a46;
    long a47;
    long a48;
    long a49;
    long a50;
    long a51;
    long a52;
    long a53;
    long a54;
    long a55;
    long a56;
    long a57;
    long a58;
    long a59;
    long a60;
    long a61;
    long a62;
    long a63;
    long a64;
    long a65;
    long a66;
    long a67;
    long a68;
    long a69;
    long a70;
    long a71;

    Data512(byte a0, byte a1, short a2, short a3, int a4, int a5, long a6, long a7, byte a8, byte a9, short a10,
            short a11, int a12, int a13, long a14, long a15, long a16, long a17, long a18, long a19, long a20, long a21,
            long a22, long a23, long a24, long a25, long a26, long a27, long a28, long a29, long a30, long a31,
            long a32, long a33, long a34, long a35, long a36, long a37, long a38, long a39, long a40, long a41,
            long a42, long a43, long a44, long a45, long a46, long a47, long a48, long a49, long a50, long a51,
            long a52, long a53, long a54, long a55, long a56, long a57, long a58, long a59, long a60, long a61,
            long a62, long a63, long a64, long a65, long a66, long a67, long a68, long a69, long a70, long a71) {
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
        this.a16 = a16;
        this.a17 = a17;
        this.a18 = a18;
        this.a19 = a19;
        this.a20 = a20;
        this.a21 = a21;
        this.a22 = a22;
        this.a23 = a23;
        this.a24 = a24;
        this.a25 = a25;
        this.a26 = a26;
        this.a27 = a27;
        this.a28 = a28;
        this.a29 = a29;
        this.a30 = a30;
        this.a31 = a31;
        this.a32 = a32;
        this.a33 = a33;
        this.a34 = a34;
        this.a35 = a35;
        this.a36 = a36;
        this.a37 = a37;
        this.a38 = a38;
        this.a39 = a39;
        this.a40 = a40;
        this.a41 = a41;
        this.a42 = a42;
        this.a43 = a43;
        this.a44 = a44;
        this.a45 = a45;
        this.a46 = a46;
        this.a47 = a47;
        this.a48 = a48;
        this.a49 = a49;
        this.a50 = a50;
        this.a51 = a51;
        this.a52 = a52;
        this.a53 = a53;
        this.a54 = a54;
        this.a55 = a55;
        this.a56 = a56;
        this.a57 = a57;
        this.a58 = a58;
        this.a59 = a59;
        this.a60 = a60;
        this.a61 = a61;
        this.a62 = a62;
        this.a63 = a63;
        this.a64 = a64;
        this.a65 = a65;
        this.a66 = a66;
        this.a67 = a67;
        this.a68 = a68;
        this.a69 = a69;
        this.a70 = a70;
        this.a71 = a71;
    }
}
