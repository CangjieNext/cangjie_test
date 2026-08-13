// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public interface I {
    static prop area1: Int64 {
        get() { 1 }
    }
    static prop area2: Int64 {
        get() { 2 }
    }
}
interface I1 {
    static prop area1: Int64 {
        get() { 1 }
    }
    static prop area2: Int64
}
public interface I2 <: I1 {
}