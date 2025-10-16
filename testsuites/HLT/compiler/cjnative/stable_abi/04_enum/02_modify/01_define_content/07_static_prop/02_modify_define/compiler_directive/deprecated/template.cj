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

    public func getWidth(): Int64{
        return 11
    }
    static prop geta1:Int64 {
        get() {
            println("get")
            0
        }
        
    }

    public static prop geta2:Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: false]
    static prop geta3: Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: false]
    public static prop geta4: Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: true]
    public static prop geta5: Int64 {
        get() {
            println("get")
            0
        }
        
    }
}

public enum Rectangle1 {
    AB
    public static prop geta: Int64 {
        get() {
            0
        }
    }

    static prop getb: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getb
    }

    @Deprecated["this function is deprecated", strict: false]
    public static prop getc: Int64 {
        get() {
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    static prop getd: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f2(){
        getd
    }
}


