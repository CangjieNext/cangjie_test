// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

public const x = f1()
const y: Int64 = 10
public const func foo(): Int64 {
    return y
}

const func f1() {
    1
}

const func f2(): Int64 {
    return 2
}

@Frozen
public func f3(): Int64 {
    f2();1
}
