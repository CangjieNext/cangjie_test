/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiCpointer4 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiCpointer4");
    }

    public static void main(String[] args) {
        long ptr1 = cfuncPtr();
        long ptr2 = cfuncPtr();
        long ptr3 = cfuncPtr();
        long ptr4 = cfuncPtr();
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(ptr1, ptr2, ptr3, ptr4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiCpointer4: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native long cfuncPtr();

    public static native int testFunc(long func1, long func2, long func3, long func4);
}
