/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiReturn10 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiReturn10");
    }

    public static void main(String[] args) {
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            Data1024 res = testFunc();
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiReturn10: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native Data1024 testFunc();
}

class Data1024 {
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
    long a72;
    long a73;
    long a74;
    long a75;
    long a76;
    long a77;
    long a78;
    long a79;
    long a80;
    long a81;
    long a82;
    long a83;
    long a84;
    long a85;
    long a86;
    long a87;
    long a88;
    long a89;
    long a90;
    long a91;
    long a92;
    long a93;
    long a94;
    long a95;
    long a96;
    long a97;
    long a98;
    long a99;
    long a100;
    long a101;
    long a102;
    long a103;
    long a104;
    long a105;
    long a106;
    long a107;
    long a108;
    long a109;
    long a110;
    long a111;
    long a112;
    long a113;
    long a114;
    long a115;
    long a116;
    long a117;
    long a118;
    long a119;
    long a120;
    long a121;
    long a122;
    long a123;
    long a124;
    long a125;
    long a126;
    long a127;
    long a128;
    long a129;
    long a130;
    long a131;
    long a132;
    long a133;
    long a134;
    long a135;
}
