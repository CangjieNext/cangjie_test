/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiCString4 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiCString4");
    }

    public static void main(String[] args) {
        long ptr1 = mallocCString("test1");
        long ptr2 = mallocCString("test2");
        long ptr3 = mallocCString("test3");
        long ptr4 = mallocCString("test4");
        long ptr5 = mallocCString("test5");
        long ptr6 = mallocCString("test6");
        long ptr7 = mallocCString("test7");
        long ptr8 = mallocCString("test8");
        long ptr9 = mallocCString("test9");
        long ptr10 = mallocCString("test10");
        long ptr11 = mallocCString("test11");
        long ptr12 = mallocCString("test12");
        long ptr13 = mallocCString("test13");
        long ptr14 = mallocCString("test14");
        long ptr15 = mallocCString("test15");
        long ptr16 = mallocCString("test16");
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(ptr1, ptr2, ptr3, ptr4, ptr5, ptr6, ptr7, ptr8, ptr9, ptr10, ptr11, ptr12, ptr13, ptr14,
                    ptr15, ptr16);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiCString4: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native long mallocCString(String str);

    public static native int testFunc(long param1, long param2, long param3, long param4, long param5, long param6,
            long param7, long param8, long param9, long param10, long param11, long param12, long param13, long param14,
            long param15, long param16);
}
