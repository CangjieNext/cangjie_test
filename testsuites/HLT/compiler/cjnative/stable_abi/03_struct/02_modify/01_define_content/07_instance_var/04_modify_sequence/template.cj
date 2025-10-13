/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public struct Rectangle {
    let width = 10
    let a1 = 20
    private let a2 = 20
    internal let a3 = 20
    protected let a4 = 20
    public let a5 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public open class A {}

public class B <: A {}

public class C {}

public struct S2 {
    public let a: A = B()
    let b: A = B()
    public let c = 1
    public let d = 1

    @Frozen
    public func getb() {
        return b
    }

    @Frozen
    public func getd() {
        return d
    }
}
