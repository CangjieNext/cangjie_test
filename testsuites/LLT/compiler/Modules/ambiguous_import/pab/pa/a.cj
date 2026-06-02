// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pab.pa

protected interface I {
    func f(): Int
}

extend<T> Array<T> <: I {
    public func f(): Int {
        1
    }
}
