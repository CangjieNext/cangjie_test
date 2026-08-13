// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public struct C1 {
    let x: Int64 = 0
    public func xoo(a: Int64) {
        a
    }
    const init() {}
}

extend C1 {
    public func f2(x: String, y: Int64): Int64 { 1 }
}