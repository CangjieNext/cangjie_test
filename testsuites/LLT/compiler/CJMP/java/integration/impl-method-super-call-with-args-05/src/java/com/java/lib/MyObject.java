// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    private String value;

    public MyObject(byte param0, float[] param1, int[] param2, double[] param3) {
        this.value = "" + param0 + "_" + param1[0] + "_" + param2[0] + "_" + param3[0];
    }

    public MyObject(int param0, float param1, byte[] param2, short param3) {
        this.value = "" + param0 + "_" + param1 + "_" + param2[0] + "_" + param3;
    }

    public MyObject(byte param0, float[] param1, int param2, float[] param3, char[] param4, byte[] param5, char[] param6, int[] param7, float[] param8, float param9) {
        this.value = "" + param0 + "_" + param1[0] + "_" + param2 + "_" + param3[0] + "_" + param4[0] + "_" + param5[0] + "_" + param6[0] + "_" + param7[0] + "_" + param8[0] + "_" + param9;
    }


    public String getValue() {
        return this.value;
    }
}
