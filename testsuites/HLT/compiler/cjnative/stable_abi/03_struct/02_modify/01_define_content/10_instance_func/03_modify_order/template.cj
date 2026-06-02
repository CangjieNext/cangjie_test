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

    const public init() {}

    public func getWidth(): Int64{
        return width
    }

    public func geta(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    const public func getb(a: Int64): Int64 {
        let b = a + 1
        return b
    }

    @Frozen
    public func getc(a: Int64): Int64 {
        var b = a + 1
        return b
    }

    func getd() {
        return 0
    }

    @Frozen
    public func gete() {
        let x = getd()
        return x
    }

    const func getf() {
        return 0
    }

    public const func getg() {
        let x = getf()
        return x
    }

    @Frozen
    func geth() {
        return 0
    }

    @Frozen
    public func geti() {
        let x = geth()
        return x
    }
}



