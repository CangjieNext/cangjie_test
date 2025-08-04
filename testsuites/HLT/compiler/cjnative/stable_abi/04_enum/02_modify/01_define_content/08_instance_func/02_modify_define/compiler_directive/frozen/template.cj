/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// ASSERT: scan Compatible!

package test_stable_abi

public enum Rectangle {
    | Red | Green | Blue(UInt8)

    public func getWidth(): Int64 {
        return 11
    }

    @Frozen
    public func geta(): Int64 {
        return 0
    }

    @Frozen
    func geta1() {
        return 0
    }

    @Frozen
    public func geta2() {
        let x = geta1()
        return x
    }
}
