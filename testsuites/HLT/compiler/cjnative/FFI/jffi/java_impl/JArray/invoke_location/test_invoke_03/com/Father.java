/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com;
public class Father {
    public boolean[] aBoolean;
    public int[] aInt;
    public static int[] arrayInt = new int[10];

    static {
        for (int i = 0; i < arrayInt.length; i++) {
            arrayInt[i] = i;
        }
    }

    public Father(int[] aInt) {
        this.aInt = aInt;
        this.aBoolean = new boolean[2];
        this.aBoolean[0] = true;
        this.aBoolean[1] = false;
    }
}