/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: interface implementation
interface I1 {
    public func f1(): Int64
    public func ff1(): Int64
}

interface I2 {
    public func f2(): Int64
}

interface I3 {}

public class C1 {}

public struct S1 {}

extend C1 <: I1 & I3 {
    public func f1() {
        100
    }
    public func ff1() {
        100
    }
}

extend S1 <: I1 & I3 {
    public func f1() {
        100
    }
    public func ff1() {
        100
    }
}
