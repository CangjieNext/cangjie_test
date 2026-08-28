// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V0
public struct S1 {
    let x: Int64 = 0
    const init() {}
    @Deprecated["This API is deprecated", strict: true]
    public func f1(a: Int64) {
        a
    }
    public func f3() { x }
}
