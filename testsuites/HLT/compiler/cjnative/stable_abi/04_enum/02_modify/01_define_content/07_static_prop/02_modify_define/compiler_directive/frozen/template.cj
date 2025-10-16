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

    public static prop geta: Int64 {
        get() {
            println("get")
            1
        }
        
    }

    static prop getb: Int64 {
        get() {
            println("get")
            1
        }
        
    }
}

public enum S1{
    AB

    @Frozen
    public static prop geta: Int64 {
        get() {
            0
        }
    }

    @Frozen
    static prop getb: Int64 {
        get() {
           0
        }
    }

    @Frozen
    public func f1(){
        getb
    }
}


