// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// add open modifier: OK
public open class C1 {
    C1(let x: Int64, let y: Float32) {}
}

public open class C2 {
    C2(let a : String, let b : Rune) {}
}

public abstract sealed class C3 {
    C3(let a : String, let b : Rune) {}
}