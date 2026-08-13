// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
public class S1 {
    let x: Int64 = 0
    const init() {}
    public func f1(a: Int64) {
        a
    }
    const func f2() { x }
    const public func f3() { f2() + 1 }
}
