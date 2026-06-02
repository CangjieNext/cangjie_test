// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test

class LooogA {}

type A = LooogA

public class C {
    private static let arr: Array<Int64> = [1, 2, 3]
    public static func size(): UInt16 {
        return UInt16(C.arr.size)
    }
}
