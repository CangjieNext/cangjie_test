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

    public prop geta1: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    prop geta2: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    public prop geta3: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    private prop geta4: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    internal prop geta5: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    prop geta6: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    protected prop geta7: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    public prop geta8: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    prop geta9: Int64 {
        get() {
            println("get")
            11
        }
        
    }

    prop geta10: Int64 {
        get() {
            println("get")
            11
        }
        
    }

}

public enum S1{
    AB
    public static prop geta: Int64 {
        get() {
            1
        }
    }

    static prop getb: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f1(){
        getb
    }

    public prop getc: Int64 {
        get() {
            1
        }
    }

    public prop getd: Int64 {
        get() {
            1
        }
    }

    @Frozen
    public func f2(){
        getd
    }
}

