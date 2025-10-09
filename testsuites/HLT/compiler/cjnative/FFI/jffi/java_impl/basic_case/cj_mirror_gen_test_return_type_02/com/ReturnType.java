/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class ReturnType {
    static boolean aBoolean = true;
    static byte aByte = 1;
    static short aShort = 1;
    static char aChar = 1;
    static int aInt = 1;
    static long aLong = 1;
    static float aFloat = 1.0F;
    static double aDouble = 1.0;

    public static boolean getBoolean() {
        return aBoolean;
    }

    public static byte getByte() {
        return aByte;
    }

    public static short getShort() {
        return aShort;
    }

    public static char getChar() {
        return aChar;
    }

    public static int getInt() {
        return aInt;
    }

    public static long getLong() {
        return aLong;
    }

    public static float getFloat() {
        return aFloat;
    }

    public static double getDouble() {
        return aDouble;
    }
}