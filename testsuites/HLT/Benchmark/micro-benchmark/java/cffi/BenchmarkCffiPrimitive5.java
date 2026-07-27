/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiPrimitive5 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiPrimitive5");
    }

    public static void main(String[] args) {
        byte param1 = (byte) 1;
        byte param2 = (byte) 15;
        byte param3 = (byte) 32;
        byte param4 = (byte) 100;
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiPrimitive5: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(byte param1, byte param2, byte param3, byte param4);
}
