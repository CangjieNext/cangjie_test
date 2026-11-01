// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V1
interface I {
    mut func f(): Unit
}

interface I2 {
}

interface I3 {
}

interface I4 {
}

public type Myint = Int64

extend Myint <: I {
    public func f(): Unit {}
}

main() {}