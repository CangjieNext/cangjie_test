/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiReturn11 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiReturn11");
    }

    public static void main(String[] args) {
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            long res = testFunc();
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiReturn11: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native long testFunc();
}
