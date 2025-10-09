/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class JavaClass {
    public int[] aInt = new int[2147483645];
    public static long[] arrLong = new long[2147483645];

    static {
        for (int i = 0; i < arrLong.length; i++) {
            arrLong[i] = i;
        }
    }
    
    public JavaClass() {}
}