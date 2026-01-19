/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan Compatible!

package test_stable_abi

import std.random.*

public struct Rectangle {
    let width = 10
    static var a = 20
    static var b = 30

    public func getWidth(): Int64{
        return width
    }

    public static mut prop geta1: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

public func f(){
    if(Rectangle.geta1 == 20){
        return 0
    }
    return 1
}