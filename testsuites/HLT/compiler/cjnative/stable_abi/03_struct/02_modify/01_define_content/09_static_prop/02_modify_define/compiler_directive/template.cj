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
    static var a = 10

    public func getWidth(): Int64{
        return width
    }
    static mut prop geta1:Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    public static mut prop geta2:Int64 {
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

    @Frozen
    public func getc1(){
        return getb
    }

    @Deprecated["this function is deprecated", strict: false]
    public static mut prop getc: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    static mut prop getd: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    public func getgetd(){
        return getd
    }

    @Deprecated["this function is deprecated", strict: false]
    public static mut prop gete: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Deprecated["this function is deprecated", strict: true]
    public static mut prop geth: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Deprecated["this function is deprecated", strict: true]
    static mut prop getf: Int64 {
        get() {
            a
        }
        set(value) {
            a = value
        }
    }

    @Frozen
    @Deprecated["this function is deprecated", strict: true]
    public func getgetf(){
        return getf
    }
}

public func f(){
    if(Rectangle.getb == 10 && Rectangle.getd == 10){
        return 0
    }else{
        return 1
    }
}