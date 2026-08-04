/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiFibonacci3 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiFibonacci3");
    }

    public static void main(String[] args) {
        int[] result = new int[100];
        long ptr = GetPtr(0);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = Fibonacci3(100, result, ptr);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiFibonacci3: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native int Fibonacci3(int n, int[] fib, long res);
    public static native long GetPtr(int n);
}
