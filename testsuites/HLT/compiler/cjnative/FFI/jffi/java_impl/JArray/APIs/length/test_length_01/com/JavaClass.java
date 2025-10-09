/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class JavaClass {
    public int[][] aInt = new int[100][100];
    public static long[][][] arrLong = new long[100][100][100];

    static {
        arrLong[0][0][0] = 1;
        arrLong[99][99][99] = 9999;
    }

    public JavaClass() {}
}