/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiCpointer7 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiCpointer7");
    }

    public static void main(String[] args) {
        long ptr1 = getPtr(1);
        long ptr2 = getPtr(2);
        long ptr3 = getPtr(3);
        long ptr4 = getPtr(4);
        long ptr5 = getPtr(5);
        long ptr6 = getPtr(6);
        long ptr7 = getPtr(7);
        long ptr8 = getPtr(8);
        long ptr9 = getPtr(9);
        long ptr10 = getPtr(10);
        long ptr11 = getPtr(11);
        long ptr12 = getPtr(12);
        long ptr13 = getPtr(13);
        long ptr14 = getPtr(14);
        long ptr15 = getPtr(15);
        long ptr16 = getPtr(16);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(ptr1, ptr2, ptr3, ptr4, ptr5, ptr6, ptr7, ptr8, ptr9, ptr10, ptr11, ptr12, ptr13, ptr14,
                    ptr15, ptr16);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiCpointer7: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native long getPtr(long num);

    public static native int testFunc(long param1, long param2, long param3, long param4, long param5, long param6,
            long param7, long param8, long param9, long param10, long param11, long param12, long param13, long param14,
            long param15, long param16);
}
