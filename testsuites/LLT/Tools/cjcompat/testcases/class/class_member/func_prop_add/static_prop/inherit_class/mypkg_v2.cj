// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

interface I0 {
    static prop p0: Int64
}

interface I1 {
    public static prop p1: Int64 {
        get() { 1 }
    }
}

public abstract class C0 {
    public static prop cp0: Int64 {
        get() { 0 }
    }
}

public open class C1 <: C0 {
    public static prop cp0: Int64 {
        get() { 1 }
    }
    public static prop cp1: Int64 {
        get() { 1 }
    }
}

public open class C2 <: I1 {
    public static prop cp2: Int64 {
        get() { 2 }
    }
}

public class C3 <: C2 {
    public static prop cp3: Int64 {
        get() { 3 }
    }
}
