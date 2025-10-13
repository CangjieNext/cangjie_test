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
    public let a1 = 20
    let a2 = 20
    public let a3 = 20
    private let a4 = 20
    internal let a5 = 20
    let a6 = 20
    protected let a7 = 20
    public let a8 = 20
    let a9 = 20
    let a10 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct S1 {
    var a1 = 20
    public let a2 = 0
    var a3 = 20
    public let a4 = 0

    @Frozen
    public func geta3() {
        return a3
    }

    @Frozen
    public func geta4() {
        return a4
    }
}
