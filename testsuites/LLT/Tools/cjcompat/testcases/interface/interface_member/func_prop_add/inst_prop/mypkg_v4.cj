// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public interface I {
    prop area1: Int64 {
        get() { 1 }
    }
}

interface I1 {
    prop area1: Int64 {
        get() { 1 }
    }
    prop area2: Int64
}
public interface I2 <: I1 {
    override prop area1: Int64 {
        get() { 2 }
    }
}