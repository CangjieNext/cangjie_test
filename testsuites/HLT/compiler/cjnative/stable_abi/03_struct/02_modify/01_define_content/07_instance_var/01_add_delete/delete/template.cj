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

    public func getWidth(): Int64{
        var s = S1()
        s.geta1()
        s.a2
        return width
    }
}

public struct S1 {
    let a1 = 20
    public let a2 = 0
    let a3 = 20

    @Frozen
    public func geta1() {
        return a3
    }
}
