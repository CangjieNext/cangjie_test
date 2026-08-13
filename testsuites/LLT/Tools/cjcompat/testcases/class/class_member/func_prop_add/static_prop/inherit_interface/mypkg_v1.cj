// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
    static prop p0: Int64
}

public class C0 {
    public static prop area: Int64 {
        get() { 0 }
    }
    public static prop area1: Int64 {
        get() { 1 }
    }
}

interface I1 {
    public static prop p1: Int64 {
        get() { 1 }
    }
}

public class C1 <: I1 {
    public static prop area: Int64 {
        get() { 1 }
    }
}

interface I2 <: I0 {
    static prop p2: Int64 {
        get() { 2 }
    }
}

public class C2 {
    public static prop area: Int64 {
        get() { 1 }
    }
}
