/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiPrimitive7 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiPrimitive7");
    }

    public static void main(String[] args) {
        int param1 = 2894;
        int param2 = 156;
        int param3 = 1846;
        int param4 = 333;
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiPrimitive7: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(int param1, int param2, int param3, int param4);
}
