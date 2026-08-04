/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiPrimitive6 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiPrimitive6");
    }

    public static void main(String[] args) {
        short param1 = (short) 26;
        short param2 = (short) 156;
        short param3 = (short) 187;
        short param4 = (short) 96;
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1, param2, param3, param4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiPrimitive6: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(short param1, short param2, short param3, short param4);
}
