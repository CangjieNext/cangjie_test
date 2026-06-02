/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test

public struct A {
    public static func a(input: Int64): Int64 {
        input
    }

    public static func b(input: Int64): Int64 {
        input
    }

    public static func c(input: (Int64) -> Int64): Int64 {
        input(1)
    }
}
