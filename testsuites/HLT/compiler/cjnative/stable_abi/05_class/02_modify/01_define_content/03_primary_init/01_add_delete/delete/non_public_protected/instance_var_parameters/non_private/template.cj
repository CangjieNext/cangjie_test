/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

public class S {
    public var a = 1
    public init() { a = 0; a2 = 0 }
    S(a1: Int64, public var a2!: Int64 = 2) { a = a1 }
}


