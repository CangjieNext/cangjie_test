// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkgA

public func goo(a2: Bool): Int64 {
    println("goo ${a2}")
    return 0
}

@C
public func cfoo(a1: Bool): CPointer<Unit> {
    println("cfoo ${a1}")
    return CPointer<Unit>()
}
