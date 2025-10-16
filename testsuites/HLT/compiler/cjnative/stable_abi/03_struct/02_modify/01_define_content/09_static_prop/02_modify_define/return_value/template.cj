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
    static var a5 = 0
   

    public func getWidth(): Int64{
        return width
    }

    public static mut prop gete: Int64 {
        get() {
            println("get")
            0
        }
        set(value) {
            println("set")
           
        }
    }
}

