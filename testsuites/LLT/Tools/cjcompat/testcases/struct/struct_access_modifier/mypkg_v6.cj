// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// changed modifier private to public: OK
public struct S1 {
    let structS1_Field_x : Int64 = 42
}

public struct S2 {
    let s1 : S1 = S1()
}