// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Exe {
    public static Object getArrayInt8(byte b) {
        return new byte[] {b};
    }
    public static Object getArrayFloat32(float f) {
        return new float[] {f};
    }
    public static Object getArrayString(String s) {
        return new String[] {s};
    }
    public static Object getArrayExe(Exe e) {
        return new Exe[] {e};
    }
}
