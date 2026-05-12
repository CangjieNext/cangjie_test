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
    static var a = 20

    public func getWidth(): Int64{
        return width
    }

    public static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    static mut prop getb: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
}

public struct S1{
    static var a = 20
    @Frozen
    public static mut prop getb: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    static mut prop geta: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }
    @Frozen
    public func getgeta(){
        return geta
    }
}

public func f(){
    if(Rectangle.getb == 20 && S1.geta == 20){
        return 0
    }else{
        return 1
    }
}