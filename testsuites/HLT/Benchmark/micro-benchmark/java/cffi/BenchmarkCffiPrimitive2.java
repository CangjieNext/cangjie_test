/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiPrimitive2 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiPrimitive2");
    }

    public static void main(String[] args) {
        long param1 = 1;
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(param1);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiPrimitive2: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int testFunc(long param1);
}
