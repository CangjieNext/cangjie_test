/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.nio.ByteBuffer;

public class BenchmarkCffiCpointer2 {
    public static int reps = 100000;

    static {
        System.loadLibrary("BenchmarkCffiCpointer2");
    }

    public static void main(String[] args) {
        ByteBuffer data1 = getPtr((byte)1, (short)2, 3, (long)4);
        ByteBuffer data2 = getPtr((byte)1, (short)2, 3, (long)4);
        ByteBuffer data3 = getPtr((byte)1, (short)2, 3, (long)4);
        ByteBuffer data4 = getPtr((byte)1, (short)2, 3, (long)4);
        long start = System.nanoTime();
        for (int i = 0; i < reps; i++) {
            int res = testFunc(data1, data2, data3, data4);
        }
        long end = System.nanoTime();
        double perTime = (double) (end - start) / (double) reps;
        System.out.println("BenchmarkCffiCpointer2: " + String.format("%.2f", perTime) + " ns/op");
    }

    public static native ByteBuffer getPtr(byte num1, short num2, int num3, long num4);

    public static native int testFunc(ByteBuffer param1, ByteBuffer param2, ByteBuffer param3, ByteBuffer param4);
}
