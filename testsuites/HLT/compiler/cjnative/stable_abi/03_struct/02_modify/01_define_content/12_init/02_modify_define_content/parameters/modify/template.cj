/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

public interface I {}

extend UInt64 <: I {}

public struct S {
    public var a: Int64 = 1
    public init(a1: Int64, a2: UInt64) {
        a = a1
    }
    public init(a1: Int64, a2!: Float32, a3!: Float64) {
        a = a1
    }
    public init(a1: Int64, a2!: Bool = true, a3!: String = "0") {
        a = a1
    }
    public const init(a1: Unit, a2!: Int64 = 0) {
        a = a2
    }
    @Frozen
    public init(a1: Rune, a2!: Int64 = 0) {
        a = a2
    }
}
