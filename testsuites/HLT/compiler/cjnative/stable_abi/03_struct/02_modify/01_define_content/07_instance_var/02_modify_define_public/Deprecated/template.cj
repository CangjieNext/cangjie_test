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
    static let width = 10
    let a1 = 20
    public let a2 = 20
    @Deprecated["this value is deprecated", strict: false]
    let a3 = 20
    @Deprecated["this value is deprecated", strict: false]
    public let a4 = 20
    @Deprecated["this value is deprecated", strict: true]
    public let a5 = 20

    public func getWidth(): Int64 {
        return width
    }
}

public struct S2 {
    let a1 = 20
    public let a2 = 0
    let a3 = 20
    public let a4 = 0

    @Deprecated["this value is deprecated", strict: false]
    public let a5 = 20
    @Deprecated["this value is deprecated", strict: false]
    let a6 = 20

    @Frozen
    public func geta3() {
        return a3
    }

    @Frozen
    public func geta4() {
        return a4
    }

    @Frozen
    public func geta6() {
        return a6
    }
}
