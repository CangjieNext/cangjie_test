/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

public class BenchmarkCffiCpointer3 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiCpointer3");
    }

    public static void main(String[] args) {
        long ptr1 = getPtr((byte)1);
        long ptr2 = getPtr((byte)2);
        long ptr3 = getPtr((byte)3);
        long ptr4 = getPtr((byte)4);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(ptr1, ptr2, ptr3, ptr4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiCpointer3: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native long getPtr(byte num);

    public static native int testFunc(long param1, long param2, long param3, long param4);
}
