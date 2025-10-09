/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public struct S {
    public var a = 1
    public init(a1: UInt8) { a = Int64(a1) }
    protected init(a1: Int16) {}
    protected init(a1: UInt16) {}
    internal init(a1: Int32) {}
    internal init(a1: UInt32) {}
    private init(a1: Int64) {}
    private init(a1: UInt64) {}
    init(a1: Int8) {}
    init(a1: Float32) {}
    init(a1: Float64) {}
}


