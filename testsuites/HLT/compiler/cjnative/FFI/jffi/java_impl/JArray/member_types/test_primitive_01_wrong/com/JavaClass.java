/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class JavaClass {
    public boolean[] aBoolean = {false, true};
    public byte[] aByte = {127, -128, 0, 1};
    public short[] aShort = {32767, -32768, 0, 1, -1};
    public char[] aChar = {'a', '\u0000', '\uffff'};
    public int[] aInt = {2147483647, -2147483648, 0, 1, -1};
    public long[] aLong = {9223372036854775807L, -9223372036854775808L, 0, 1, -1};
    public float[] aFloat = {1.4E-45f, 3.4028235E38f, 3.14159265f, -3.14159265f, 0f, 1f, -1f};
    public double[] aDouble = {4.9E-324d, 1.7976931348623157E308d, 3.14159265d, -3.14159265d, 0d, 1d, -1d};

    public static boolean[] arrBoolean = {false, true};
    public static byte[] arrByte = {127, -128, 0, 1};
    public static short[] arrShort = {32767, -32768, 0, 1, -1};
    public static char[] arrChar = {'a', '\u0000', '\uffff'};
    public static int[] arrInt = {2147483647, -2147483648, 0, 1, -1};
    public static long[] arrLong = {9223372036854775807L, -9223372036854775808L, 0, 1, -1};
    public static float[] arrFloat = {3.14159265f, -3.14159265f, 0f, 1f, -1f};
    public static double[] arrDouble = {3.14159265d, -3.14159265d, 0d, 1d, -1d};

    public JavaClass() {}
}