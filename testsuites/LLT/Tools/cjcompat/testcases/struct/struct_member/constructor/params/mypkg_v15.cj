// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package myPkgA

// V13
public struct S1_public{
    public var a = 1
    public S1_public(a1: Int64, let a2_change_name!:Int64, public let a3!:Int64) {
        a = a1
    }
}