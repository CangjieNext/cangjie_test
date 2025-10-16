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
    prop geta1:Int64 {
        get() {
            println("get")
            0
        }
        
    }

    public prop geta2:Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: false]
    prop geta3: Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: false]
    public prop geta4: Int64 {
        get() {
            println("get")
            0
        }
        
    }

    @Deprecated["this function is deprecated", strict: true]
    public prop geta5: Int64 {
        get() {
            println("get")
            0
        }
        
    }
}

public enum Rectangle1 {
    AB
    public prop geta: Int64 {
        get() {
            0
        }
    }

    prop getb: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f1(){
        getb
    }

    @Deprecated["this function is deprecated", strict: false]
    public prop getc: Int64 {
        get() {
            0
        }
    }

    @Deprecated["this function is deprecated", strict: false]
    prop getd: Int64 {
        get() {
            0
        }
    }

    @Frozen
    public func f2(){
        getd
    }
}

