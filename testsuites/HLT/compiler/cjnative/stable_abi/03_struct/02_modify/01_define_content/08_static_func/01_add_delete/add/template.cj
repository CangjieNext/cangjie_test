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
    static let a1 = 20

    public func getWidth(): Int64{
        return width
    }

    static func geta(): Int64 {
        return 0
    }
}

public func f(){
    return 0
}