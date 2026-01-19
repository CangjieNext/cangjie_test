/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n

package test_stable_abi

import std.random.*

public class A {}

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64{
        return 11
    }

    @Frozen
    public static func getA(a: Random, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getC(1, b:1)
        return b + c
    }

    public const static func getB(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        let x = getD(1, b:1)
        return b + c
    }

    static const func getC(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static const func getD(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }

    static const func getE(a: Int64, b!: Int64, c!: Int64 = 1): Int64 {
        return b + c
    }
}



