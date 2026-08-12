/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiPrimitive4 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiPrimitive4");
    }

    public static void main(String[] args) {
        long param1 = 1;
        long param2 = 2;
        long param3 = 3;
        long param4 = 4;
        long param5 = 5;
        long param6 = 6;
        long param7 = 7;
        long param8 = 8;
        long param9 = 9;
        long param10 = 10;
        long param11 = 11;
        long param12 = 12;
        long param13 = 13;
        long param14 = 14;
        long param15 = 15;
        long param16 = 16;
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11,
                    param12, param13, param14, param15, param16);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiPrimitive4: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(long param1, long param2, long param3, long param4, long param5, long param6,
            long param7, long param8, long param9, long param10, long param11, long param12, long param13, long param14,
            long param15, long param16);
}
