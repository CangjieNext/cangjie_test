/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: instancemember variable

open public class CC {
    public let check = 0

    public let a1 = 1
    public var a2 = 2

    protected let c1 = 1
    protected var c2 = 2
    
    internal let b1 = 1
    internal var b2 = 2

    private let d1 = 1
    private var d2 = 2
}


